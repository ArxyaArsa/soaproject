using SmartHomeLocal.WebTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartHomeLocal.WebTest.Controllers
{
    public class WorkerController : Controller
    {
        // GET: Worker
        public ActionResult Index()
        {
            ViewBag.Devices = DeviceModel.GetAllDevices();
            ViewBag.Commands = CommandModel.GetAllCommands();
            ViewBag.Actions = ActionModel.GetAllActions();
            ViewBag.Jobs = JobModel.GetAllJobs();
            ViewBag.ReturnLogs = ReturnLogModel.GetAllReturnLogs();

            return View();
        }
    }
}