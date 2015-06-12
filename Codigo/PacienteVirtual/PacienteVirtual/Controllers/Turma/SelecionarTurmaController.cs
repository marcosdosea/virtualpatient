using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class SelecionarTurmaController : Controller
    {
        
        // GET/Index
        public ActionResult Index()
        {
            if (GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoaEmTurmasAtivas(SessionController.Pessoa.IdPessoa) == Global.ValorInteiroNulo)
            {
                return RedirectToAction("Index", "SolicitarMatriculaTurma");
            }
            if (GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoaEmTurmasAtivas(SessionController.Pessoa.IdPessoa) > Global.ValorInicial)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa));
            }

            SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorPessoaAtivaUmaTurmaPessoa(SessionController.Pessoa.IdPessoa);
            SessionController.Roles = SessionController.DadosTurmaPessoa.NomeRole;
            SessionController.Curso = SessionController.DadosTurmaPessoa.Curso;
            return RedirectToAction("Index", "Home");
        }

        // DadosTurma
        public ActionResult DadosTurma()
        {
            if (SessionController.Pessoa != null)
            {
                ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoaEmTurmasAtivas(SessionController.Pessoa.IdPessoa);
            }
            return View(SessionController.DadosTurmaPessoa);
        }

        //[HttpPost]
        public ActionResult Create(int id)
        {
            ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoaEmTurmasAtivas(SessionController.Pessoa.IdPessoa);
            if(id > Global.ValorInteiroNulo)
            {
                SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(id, SessionController.Pessoa.IdPessoa);
                SessionController.Roles = SessionController.DadosTurmaPessoa.NomeRole;
                SessionController.Curso = SessionController.DadosTurmaPessoa.Curso;
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "SelecionarTurma", GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa));
        }

    }
}
