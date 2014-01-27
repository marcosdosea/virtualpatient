using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class CorrigirConsultasController : Controller
    {
        //
        // GET: /ConsultasAlunos/

        public ActionResult Index()
        {
            if (SessionController.DadosTurmaPessoa != null)
            {
                return View(GerenciadorConsultaVariavel.GetInstance().ObterParaCorreção(SessionController.DadosTurmaPessoa.IdTurma));
            }
            else
            {
                throw new NegocioException("Selecione uma turma.");
            }
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
