using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models;
using Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class TurmaController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /Turma/

        public ViewResult Index()
        {
            return View(GerenciadorTurma.GetInstance().ObterTodos());
        }

        //
        // GET: /Turma/Details/5

        public ViewResult Details(int id)
        {
            TurmaModel turma = GerenciadorTurma.GetInstance().Obter(id);
            return View(turma);
        }

        //
        // GET: /Turma/Create

        public ActionResult Create()
        {
            ViewBag.fktutor = new SelectList(db.tutor, "login", "nome");
            return View();
        } 

        //
        // POST: /Turma/Create

        [HttpPost]
        public ActionResult Create(TurmaModel turma)
        {
            if (ModelState.IsValid)
            {
                GerenciadorTurma.GetInstance().Inserir(turma);
                return RedirectToAction("Index");  
            }

            ViewBag.fktutor = new SelectList(db.tutor, "login", "nome", turma.Tutor);
            return View(turma);
        }
        
        //
        // GET: /Turma/Edit/5
 
        public ActionResult Edit(int id)
        {
            TurmaModel turma = GerenciadorTurma.GetInstance().Obter(id);
            ViewBag.fktutor = new SelectList(db.tutor, "login", "nome", turma.Tutor);
            return View(turma);
        }

        //
        // POST: /Turma/Edit/5

        [HttpPost]
        public ActionResult Edit(TurmaModel turma)
        {
            if (ModelState.IsValid)
            {
                GerenciadorTurma.GetInstance().Atualizar(turma);
                return RedirectToAction("Index");
            }
            ViewBag.fktutor = new SelectList(db.tutor, "login", "nome", turma.Tutor);
            return View(turma);
        }

        //
        // GET: /Turma/Delete/5
 
        public ActionResult Delete(int id)
        {
            TurmaModel turma = GerenciadorTurma.GetInstance().Obter(id);
            return View(turma);
        }

        //
        // POST: /Turma/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorTurma.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}