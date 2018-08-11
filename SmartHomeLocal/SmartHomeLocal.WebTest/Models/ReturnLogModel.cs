using SmartHomeLocal.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHomeLocal.WebTest.Models
{
    public class ReturnLogModel
    {
        public int Id { get; set; }
        public int JobId { get; set; }
        public DateTime Time { get; set; }
        public string Value { get; set; }

        public static List<ReturnLogModel> GetAllReturnLogs()
        {
            using (var data = new SmartHomeLocalDbEntities())
            {
                return data.ReturnLogs.Select(x => new ReturnLogModel()
                {
                    Id = x.Id,
                    JobId = x.JobId,
                    Time = x.Time,
                    Value = x.Value
                }).ToList();
            }
        }
    }
}