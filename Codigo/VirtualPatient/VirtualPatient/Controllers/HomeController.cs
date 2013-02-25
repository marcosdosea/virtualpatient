using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VirtualPatient.Models;

namespace VirtualPatient.Controllers
{
    public class HomeController : Controller
    {

        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Ajuda()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(DiscenteModel discente)
        {
            if (ModelState.IsValid)
            {
                return View("About", discente);
            }

            return View();

        }
    }
}
