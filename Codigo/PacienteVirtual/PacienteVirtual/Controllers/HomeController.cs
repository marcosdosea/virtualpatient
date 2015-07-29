using System.Web.Mvc;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class HomeController : Controller
    {
        //public bool controlador { get; set; }

        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to Virtual Patient!";
            if (SessionController.NomePessoa == null)
            {
                SessionController.NomePessoa = Global.stringVazia;
            }
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Manual()
        {
            return View();
        }
    }
}
