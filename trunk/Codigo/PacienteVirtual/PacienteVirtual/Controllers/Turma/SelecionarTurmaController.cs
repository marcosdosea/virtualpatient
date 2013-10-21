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
            ViewBag.IdTurma = new SelectList(GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa), "IdTurma", "NomeTurma");
            return View();
        }

        [HttpPost]
        public ActionResult Create(TurmaPessoaModel tpm)
        {
            if(tpm.IdTurma > 0)
            {
                SessionController.DadosTurmaPessoa = GerenciadorTurmaPessoa.GetInstance().ObterPorTurmaPessoa(tpm.IdTurma, SessionController.Pessoa.IdPessoa);
                return RedirectToAction("Index", "Home");
            }
            ViewBag.IdTurma = new SelectList(GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(SessionController.Pessoa.IdPessoa), "IdTurma", "NomeTurma");
            return RedirectToAction("Index", "SelecionarTurma");
        }

    }
}
