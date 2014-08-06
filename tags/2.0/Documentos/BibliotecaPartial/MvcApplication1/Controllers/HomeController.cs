using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var model = new HomeModel
            {
                Autores = SessionController.GetAutores(),
                Autor = SessionController.GetAutores().ElementAtOrDefault(0),
                Editoras = SessionController.GetEditoras(),
                Editora = SessionController.GetEditoras().ElementAtOrDefault(0)
            };
            return View(model);
        }

        public ActionResult About()
        {
            return View();
        }

    }
}
