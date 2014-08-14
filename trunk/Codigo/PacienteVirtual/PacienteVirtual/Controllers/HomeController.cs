using System.Web.Mvc;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class HomeController : Controller
    {
        //public bool controlador { get; set; }

        public ActionResult Index()
        {
            ViewBag.Message = "Bem-Vindo ao Paciente Virtual!";
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
    }
}
