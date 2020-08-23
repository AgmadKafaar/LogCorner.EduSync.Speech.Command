using LogCorner.EduSync.Speech.Application.Exceptions;
using LogCorner.EduSync.Speech.Application.UseCases;
using LogCorner.EduSync.Speech.Domain.SpeechAggregate;
using LogCorner.EduSync.Speech.Infrastructure;
using Moq;
using System;
using System.Threading.Tasks;
using LogCorner.EduSync.Speech.SharedKernel.Events;
using Xunit;

namespace LogCorner.EduSync.Speech.Application.UnitTest.Specs
{
    public class EventSourcingHandlerUnitTest
    {
        [Fact(DisplayName = "Handle with null events should raise EventNullException")]
        public async Task HandleWithNullEventsShouldRaiseEventNullException()
        {
            //Arrange
            var mockEventStoreRepository = new Mock<IEventStoreRepository<AggregateRoot<Guid>>>();
            mockEventStoreRepository.Setup(e => e.AppendAsync(It.IsAny<EventStore>()))
                .Verifiable();

            var mockEventSerializer = new Mock<IEventSerializer>();

            long version = 0;

            //Act
            //Assert
            var sut = new EventSourcingHandler<AggregateRoot<Guid>>(mockEventStoreRepository.Object, mockEventSerializer.Object);
            await Assert.ThrowsAsync<EventNullException>(() => sut.Handle(null, version));
        }

        [Fact(DisplayName = "Handle with events should call AppendAsync")]
        public async Task HandleWithEventsShouldCallAppendAsync()
        {
            //Arrange
            var mockEventStoreRepository = new Mock<IEventStoreRepository<AggregateRoot<Guid>>>();
            mockEventStoreRepository.Setup(e => e.AppendAsync(It.IsAny<EventStore>()))
                .Returns(Task.FromResult(true))
                .Verifiable();

            var mockEventSerializer = new Mock<IEventSerializer>();

            var @event = new SpeechCreatedEvent(It.IsAny<Guid>(), It.IsAny<string>(),
                It.IsAny<string>(), It.IsAny<string>(),
                It.IsAny<string>());

            long version = 0;

            //Act
            var sut = new EventSourcingHandler<AggregateRoot<Guid>>(mockEventStoreRepository.Object,
                mockEventSerializer.Object);
            await sut.Handle(@event, version);

            //Assert
            mockEventStoreRepository.Verify(m => m.AppendAsync(It.IsAny<EventStore>()),
                Times.Once, "AppendAsync must be called only once");
        }
    }
}