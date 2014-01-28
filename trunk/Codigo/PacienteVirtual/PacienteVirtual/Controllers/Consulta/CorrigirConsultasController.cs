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
            Global.ZeraSessaoConsulta();
            if (SessionController.DadosTurmaPessoa != null)
            {
                return View(GerenciadorConsultaVariavel.GetInstance().ObterParaCorreção(SessionController.DadosTurmaPessoa.IdTurma));
            }
            else
            {
                throw new NegocioException("Selecione uma turma.");
            }
        }

        public ActionResult ComentariosTutor(ConsultaVariavelModel cvm)
        {
            if (ModelState.IsValid)
            {
                GerenciadorConsultaVariavel.GetInstance().Atualizar(cvm);
            }
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult EnviarParaCorrecao(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            consultaVariavelModel.IdEstadoConsulta = Global.AguardandoCorrecaoDoAluno;
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            return RedirectToAction("Index", "CorrigirConsultas");
        }

        public ActionResult FinalizarCorrecao(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            consultaVariavelModel.IdEstadoConsulta = Global.Finalizado;
            GerenciadorConsultaVariavel.GetInstance().Atualizar(consultaVariavelModel);
            return RedirectToAction("Index", "CorrigirConsultas");
        }

        public ActionResult Delete(long idConsultaVariavel, int idEstadoConsulta)
        {
            if(idEstadoConsulta == Global.AguardandoPreenchimento)
            {
                GerenciadorConsultaVariavel.GetInstance().Remover(idConsultaVariavel);
            }
            return RedirectToAction("Index", "CorrigirConsultas");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

    }
}
