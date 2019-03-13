using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace NetCore
{
    class Program
    {
        private static List<TaskDto> GetTasks()
        {
            var list = new List<TaskDto>();
            for (int i = 1; i <= 100; ++i)
            {
                list.Add(new TaskDto
                {
                    Id = Guid.NewGuid().ToString(),
                    CreateDate = DateTime.Now,
                    Name = $"Task {i}",
                    IsFinished = false,
                    Subtasks = 212,
                    Weight = 3.14,
                    Children = new string[] { "taska", "taskb", "taskc" },
                    Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. Suspendisse dignissim sapien et consequat lobortis.",
                    Deadline = DateTime.Now,
                    Tags = new string[] { "tag1", "tag2", "tag3", "tag4", "tag5" }
                });
            }

            return list;
        }

        private static TaskDto GetObject()
        {
            return new TaskDto
            {
                Id = Guid.NewGuid().ToString(),
                CreateDate = DateTime.Now,
                Name = $"Task 1",
                IsFinished = false,
                Subtasks = 212,
                Weight = 3.14,
                Children = new string[] { "taska", "taskb", "taskc" },
                Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget sem erat. Quisque dictum tellus in feugiat facilisis. Vivamus porttitor vel arcu id cursus. Cras interdum massa ac rhoncus ornare. Sed quis massa felis. Curabitur blandit tempor enim, vitae euismod nibh tincidunt a. Duis faucibus dapibus purus nec dictum. Suspendisse dignissim sapien et consequat lobortis.",
                Deadline = DateTime.Now,
                Tags = new string[] { "tag1", "tag2", "tag3", "tag4", "tag5" }
            };
        }

        private static void evaluateProblem(String name, Action method)
        {
            var watch = System.Diagnostics.Stopwatch.StartNew();
            method();
            watch.Stop();

            var elapsedMs = watch.ElapsedMilliseconds;
            var timeInterval = elapsedMs / 1000.0;

            Console.WriteLine($"    {name}: {timeInterval} seconds");
        }

        static void Main(string[] args)
        {
            var entity = GetObject();
            var list = GetTasks();

            var entityJson = JsonConvert.SerializeObject(entity);
            var listJson = JsonConvert.SerializeObject(list);
            
            Console.WriteLine("Running benchmarks for .NET Core:");

            evaluateProblem("#1 Encoding (single object)", () => {
                for(int i = 1; i <= 10000; ++i) {
                    JsonConvert.SerializeObject(entity);
                }
            });

            evaluateProblem("#2 Encoding (list of objects)", () => {
                for(int i = 1; i <= 10000; ++i) {
                    JsonConvert.SerializeObject(list);
                }
            });

            evaluateProblem("#3 Decoding (single object)", () => {
                for(int i = 1; i <= 10000; ++i) {
                    JsonConvert.DeserializeObject<TaskDto>(entityJson);
                }
            });

            evaluateProblem("#4 Decoding (list of objects)", () => {
                for(int i = 1; i <= 10000; ++i) {
                    JsonConvert.DeserializeObject<TaskDto[]>(listJson);
                }
            });
        }
    }
}
