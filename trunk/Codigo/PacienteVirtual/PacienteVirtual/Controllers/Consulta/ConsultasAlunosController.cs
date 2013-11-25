using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class ConsultasAlunosController : Controller
    {
        //
        // GET: /ConsultasAlunos/

        public ActionResult Index()
        {
            return View(GerenciadorConsultaVariavel.GetInstance().ObterTodos());
        }

        
        public ActionResult Delete(long idConsultaVariavel, int idEstadoConsulta)
        {
            if(idEstadoConsulta == Global.AguardandoPreenchimento)
            {
                GerenciadorConsultaVariavel.GetInstance().Remover(idConsultaVariavel);
            }
            return RedirectToAction("Index", "ConsultasAlunos");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

    }
}
