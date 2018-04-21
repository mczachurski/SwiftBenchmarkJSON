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
                    Id = Guid.NewGuid(),
                    CreateDate = DateTime.Now,
                    Name = $"Task {i}",
                    IsFinished = false
                });
            }

            return list;
        }

        private static TaskDto GetObject()
        {
            return new TaskDto
            {
                Id = Guid.NewGuid(),
                CreateDate = DateTime.Now,
                Name = $"Task 1",
                IsFinished = false
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
                for(int i = 1; i <= 100000; ++i) {
                    var json = JsonConvert.SerializeObject(entity);
                }
            });

            evaluateProblem("#2 Encoding (list of objects)", () => {
                for(int i = 1; i <= 100000; ++i) {
                    var json = JsonConvert.SerializeObject(list);
                }
            });

            evaluateProblem("#3 Decoding (single object)", () => {
                for(int i = 1; i <= 100000; ++i) {
                    var deserialized = JsonConvert.DeserializeObject<TaskDto>(entityJson);
                }
            });

            evaluateProblem("#4 Decoding (list of objects)", () => {
                for(int i = 1; i <= 100000; ++i) {
                    var deserialized = JsonConvert.DeserializeObject<TaskDto[]>(listJson);
                }
            });
        }
    }
}
