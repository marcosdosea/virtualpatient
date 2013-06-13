using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class CursoController : Controller
    {
        GerenciadorCurso gCurso = GerenciadorCurso.GetInstance();
        GerenciadorInstituicao gInstituicao = GerenciadorInstituicao.GetInstance();

        //
        // GET: /Curso/
        public ViewResult Index()
        {
            IEnumerable<CursoModel> c = gCurso.ObterTodos();
            ViewBag.c2 = c.ToList()[1];
           return View(c);
        }

        //
        // GET: /Curso/Details/5
        public ViewResult Details(int id)
        {
            return View(gCurso.Obter(id));
        }

        public PartialViewResult ExibirDisciplina(DisciplinaModel d) {


            return PartialView(d);
        }
        //
        // GET: /Curso/Create

        public ActionResult Create()
        {
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao");
            return View();
        }

        //
        // POST: /Curso/Create
        [HttpPost]
        public ActionResult Create(CursoModel cursoModel)
        {
            if (ModelState.IsValid)
            {
                cursoModel.IdCurso = gCurso.Inserir(cursoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao", cursoModel.IdInstituicao);
            return View(cursoModel);
        }
        
        //
        // GET: /Curso/Edit/5
        public ActionResult Edit(int id)
        {
            CursoModel cursoModel = gCurso.Obter(id);
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao", cursoModel.IdInstituicao);
            return View(cursoModel);
        }

        //
        // POST: /Curso/Edit/5

        [HttpPost]
        public ActionResult Edit(CursoModel cursoModel)
        {
            if (ModelState.IsValid)
            {
                gCurso.Atualizar(cursoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao", cursoModel.IdInstituicao);
            return View(cursoModel);
        }

        //
        // GET: /Curso/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gCurso.Obter(id));
        }

        //
        // POST: /Curso/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gCurso.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}