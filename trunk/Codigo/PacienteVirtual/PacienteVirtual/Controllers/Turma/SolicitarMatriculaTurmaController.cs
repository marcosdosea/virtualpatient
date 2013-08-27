using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models.Turma;
using PacienteVirtual.Negocio.Turma;

namespace PacienteVirtual.Controllers
{
    public class SolicitarMatriculaTurmaController : Controller
    {
        
        public ViewResult Index()
        {
            ViewBag.IdInstituicao = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos(), "IdInstituicao", "NomeInstituicao");
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorId(-1), "IdTurma", "Codigo");
            return View();
        }

        [HttpPost]
        public ActionResult Index(SolicitarMatriculaTurmaModel smt, int IdInstituicao = -1)
        {
            ViewBag.IdInstituicao = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos(), "IdInstituicao", "NomeInstituicao");
            if (IdInstituicao != -1)
            {
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorId(IdInstituicao), "IdTurma", "Codigo");
            }
            else 
            {
                ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorId(-1), "IdTurma", "Codigo");
            }
            //ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterPorId(IdInstituicao), "IdTurma", "Codigo");
            if (ModelState.IsValid)
            {
                //TurmaPessoaModel tpm = new TurmaPessoaModel();
                //tpm.IdTurma = smt.IdTurma;
                //tpm.Ativa = false;
                //tpm.IdRole = 2;
                //GerenciadorTurmaPessoa.GetInstance().Inserir(tpm);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

    }
}
