﻿using System;

namespace LogCorner.EduSync.Speech.Domain.Events
{
    public class SpeechTitleChangedEvent : Event
    {
        public string Title { get; }

        public SpeechTitleChangedEvent(Guid aggregateId, string title)
        {
            AggregateId = aggregateId;
            Title = title;
        }
    }
}