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
            if (GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoaEmTurmasAtivas(SessionController.Pessoa.IdPessoa) > Global.ValorInicial)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa));
            }
            SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorPessoaUmaTurmaPessoa(SessionController.Pessoa.IdPessoa);
            SessionController.Roles = SessionController.DadosTurmaPessoa.NomeRole;
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
            if(id > Global.ValorInteiroNulo)
            {
                SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(id, SessionController.Pessoa.IdPessoa);
                ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoa(SessionController.Pessoa.IdPessoa);
                SessionController.Roles = SessionController.DadosTurmaPessoa.NomeRole;
                return RedirectToAction("Index", "Home");
            }
            ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoa(SessionController.Pessoa.IdPessoa);
            return RedirectToAction("Index", "SelecionarTurma", GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa));
        }

    }
}
