using System;

namespace NetCore 
{
    class TaskDto 
    {
        public Guid Id { get; set; }
        public DateTime CreateDate { get; set; }
        public String Name { get; set; }
        public bool IsFinished { get; set; }
    }
}