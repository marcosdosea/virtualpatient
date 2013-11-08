using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio.Turma;
using PacienteVirtual.Models.Turma;

namespace PacienteVirtual.Controllers.Turma
{
    public class SelecionarTurmaController : Controller
    {
        
        public ActionResult Index()
        {
            if (GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoa(SessionController.Pessoa.IdPessoa) > 1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa));
            }
            SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorPessoaUmaTurmaPessoa(SessionController.Pessoa.IdPessoa);           
            return RedirectToAction("Index", "Home");
        }

        public ActionResult DadosTurma()
        {
            if (SessionController.Pessoa != null)
            {
                ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoa(SessionController.Pessoa.IdPessoa);
            }
            return View(SessionController.DadosTurmaPessoa);
        }

        //[HttpPost]
        public ActionResult Create(int id)
        {
            if(id > 0)
            {
                SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(id, SessionController.Pessoa.IdPessoa);
                ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoa(SessionController.Pessoa.IdPessoa);
                return RedirectToAction("Index", "Home");
            }
            ViewBag.QtdTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterQuantidadePorPessoa(SessionController.Pessoa.IdPessoa);
            return RedirectToAction("Index", "SelecionarTurma", GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa));
        }

    }
}
