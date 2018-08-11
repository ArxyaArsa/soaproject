using SmartHomeLocal.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHomeLocal.WebTest.Models
{
    public class JobModel
    {
        public int Id { get; set; }
        public int ActionId { get; set; }
        public string DeviceName { get; set; }
        public string CommandCode { get; set; }
        public DateTime? Time { get; set; }
        public int? RepeatTimeMinutes { get; set; }
        public int? RepeatTimeSeconds { get; set; }
        public bool IsSensor { get; set; }

        public static List<JobModel> GetAllJobs()
        {
            using (var data = new SmartHomeLocalDbEntities())
            {
                var query = from j in data.Jobs
                            join a in data.Actions on j.ActionId equals a.Id
                            join d in data.Devices on a.DeviceId equals d.Id
                            join c in data.Commands on a.CommandId equals c.Id
                            select new JobModel()
                            {
                                Id = j.Id,
                                ActionId = j.ActionId,
                                DeviceName = d.Name,
                                CommandCode = c.Code,
                                Time = j.Time,
                                RepeatTimeMinutes = j.RepeatTimeMinutes,
                                RepeatTimeSeconds = j.RepeatTimeSeconds,
                                IsSensor = j.IsSensor
                            };

                return query.ToList();
            }
        }
    }
}