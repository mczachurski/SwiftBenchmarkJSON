using System;

namespace NetCore 
{
    class TaskDto 
    {
        public String Id { get; set; }
        public DateTime CreateDate { get; set; }
        public String Name { get; set; }
        public bool IsFinished { get; set; }
        public int Subtasks { get; set; }
        public double Weight { get; set; }
        public String[] Children { get; set; }
        public String Description { get; set; }
        public DateTime Deadline { get; set; }
        public String[] Tags { get; set; }
    }
}