using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SmartHomeLocal.DataLayer;

namespace SmartHomeLocal.WebTest.Models
{
    public class DeviceModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime DateOfReg { get; set; }
        public string URL { get; set; }

        public static List<DeviceModel> GetAllDevices()
        {
            using (var data = new SmartHomeLocalDbEntities())
            {
                return data.Devices.Select(x => new DeviceModel()
                {
                    Id = x.Id,
                    Name = x.Name,
                    DateOfReg = x.DateOfReg,
                    URL = x.URL
                }).ToList();
            }
        }
    }
}