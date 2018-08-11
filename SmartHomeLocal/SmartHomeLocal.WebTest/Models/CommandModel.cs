using SmartHomeLocal.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartHomeLocal.WebTest.Models
{
    public class CommandModel
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }

        public static List<CommandModel> GetAllCommands()
        {
            using (var data = new SmartHomeLocalDbEntities())
            {
                return data.Commands.Select(x => new CommandModel()
                {
                    Id = x.Id,
                    Code = x.Code,
                    Description = x.Description
                }).ToList();
            }
        }
    }
}