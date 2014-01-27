using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class SolicitarMatriculaTurmaController : Controller
    {
        
        public ViewResult Index()
        {
            ViewBag.IdInstituicao = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos(), "IdInstituicao", "NomeInstituicao");
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorIdAtivados(-1), "IdTurma", "Codigo");
            return View();
        }

        [HttpPost]
        public ActionResult Index(SolicitarMatriculaTurmaModel smt, int IdInstituicao = -1)
        {
            ViewBag.IdInstituicao = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos(), "IdInstituicao", "NomeInstituicao");
            if (IdInstituicao != -1)
            {
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorIdAtivados(IdInstituicao), "IdTurma", "Codigo");
            }
            else 
            {
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorIdAtivados(-1), "IdTurma", "Codigo");
            }
            if (ModelState.IsValid)
            {
                TurmaPessoaModel tpm = new TurmaPessoaModel();
                tpm.IdTurma = smt.IdTurma;
                tpm.Ativa = false;
                tpm.IdRole = Global.Usuario;

                tpm.IdPessoa = SessionController.Pessoa.IdPessoa;
                GerenciadorTurmaPessoa.GetInstance().Inserir(tpm);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

    }
}
