using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class SolicitarMatriculaTurmaController : Controller
    {

        // GET/Index 
        public ViewResult Index()
        {
            return View(GerenciadorTurma.GetInstance().ObterTurmasAtivasExcAdm());
        }

        public ActionResult Solicitar(int IdTurma)
        {
            TurmaPessoaModel tpm = new TurmaPessoaModel();
            tpm.IdTurma = (int)IdTurma;
            tpm.Ativa = false;
            tpm.IdRole = Global.Usuario;

            tpm.IdPessoa = SessionController.Pessoa.IdPessoa;
            GerenciadorTurmaPessoa.GetInstance().Inserir(tpm);
            return RedirectToAction("Index", "Home");
        }

    }
}
