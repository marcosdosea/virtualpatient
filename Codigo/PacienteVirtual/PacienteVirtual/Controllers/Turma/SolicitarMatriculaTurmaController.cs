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
            ViewBag.IdInstituicao = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos(), "IdInstituicao", "NomeInstituicao");
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorIdAtivados(Global.NaoSelecionado), "IdTurma", "Codigo");
            return View();
        }

        // Index
        [HttpPost]
        public ActionResult Index(SolicitarMatriculaTurmaModel smt, int IdInstituicao = Global.NaoSelecionado)
        {
            ViewBag.IdInstituicao = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos(), "IdInstituicao", "NomeInstituicao");
            if (IdInstituicao != Global.NaoSelecionado)
            {
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorIdAtivados(IdInstituicao), "IdTurma", "Codigo");
            }
            else 
            {
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorIdAtivados(Global.NaoSelecionado), "IdTurma", "Codigo");
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
