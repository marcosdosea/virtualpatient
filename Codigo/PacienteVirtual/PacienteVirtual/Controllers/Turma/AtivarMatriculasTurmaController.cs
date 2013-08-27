using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Negocio.Turma;
using PacienteVirtual.Models.Turma;

namespace PacienteVirtual.Controllers.Turma
{
    public class AtivarMatriculasTurmaController : Controller
    {
        //
        // GET: /AtivarMatriculasTurma/

        public ActionResult Index()
        {
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            return View(GerenciadorTurmaPessoa.GetInstance().ObterTodos());
        }

        [HttpPost]
        public ActionResult Index(int IdTurma = -1)
        {

            ViewBag.codigo = IdTurma;
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            if (IdTurma != -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterPorTurma(IdTurma).ToList());
            }
            if (IdTurma == -1)
            {
                return View(GerenciadorTurmaPessoa.GetInstance().ObterTodos());
            }
            return View();
        }


        public ActionResult Ativar(int id)
        {
            try
            {
                TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().Obter(id);
                tpm.Ativa = true;
                GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
                return RedirectToAction("Index");
            }
            catch 
            {
                return View();
            }
        }

        
        public ActionResult Desativar(int id)
        {
            try
            {
                TurmaPessoaModel tpm = GerenciadorTurmaPessoa.GetInstance().Obter(id);
                tpm.Ativa = false;
                GerenciadorTurmaPessoa.GetInstance().Atualizar(tpm);
                return RedirectToAction("Index");
            }
            catch 
            {
                return View();
            }
            
        }

    }
}
