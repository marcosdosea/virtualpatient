using System.Web.Mvc;

namespace PacienteVirtual.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Bem-Vindo ao Paciente Virtual!";
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
