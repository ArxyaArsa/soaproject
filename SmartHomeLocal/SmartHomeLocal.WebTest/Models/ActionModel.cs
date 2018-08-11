using SmartHomeLocal.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHomeLocal.WebTest.Models
{
    public class ActionModel
    {
        public int Id { get; set; }
        public int DeviceId { get; set; }
        public string DeviceName { get; set; }
        public int CommandId { get; set; }
        public string CommandCode { get; set; }
        public string Description { get; set; }

        public static List<ActionModel> GetAllActions()
        {
            using (var data = new SmartHomeLocalDbEntities())
            {
                var query = from a in data.Actions
                            join d in data.Devices on a.DeviceId equals d.Id
                            join c in data.Commands on a.CommandId equals c.Id
                            select new ActionModel()
                            {
                                Id = a.Id,
                                DeviceId = a.DeviceId,
                                DeviceName = d.Name,
                                CommandId = a.CommandId,
                                CommandCode = c.Code,
                                Description = (a.Description == null) ? c.Description : a.Description
                            };
                return query.ToList();
            }
        }
    }
}