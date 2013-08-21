using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{ 
    public class DisciplinaController : Controller
    {
        //
        // GET: /Disciplina/

        public ViewResult Index()
        {
            return View(GerenciadorDisciplina.GetInstance().ObterTodos());
        }

        //
        // GET: /Disciplina/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorDisciplina.GetInstance().Obter(id));
        }

        //
        // GET: /Disciplina/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Disciplina/Create

        [HttpPost]
        public ActionResult Create(DisciplinaModel disciplinaModel)
        {
            if (ModelState.IsValid)
            {

                disciplinaModel.IdDisciplina = GerenciadorDisciplina.GetInstance().Inserir(disciplinaModel);
                 
                return RedirectToAction("Index");  
            }

            return View(disciplinaModel);
        }
        
        //
        // GET: /Disciplina/Edit/5
 
        public ActionResult Edit(int id)
        {
            DisciplinaModel disciplinaModel = GerenciadorDisciplina.GetInstance().Obter(id);
            return View(disciplinaModel);
        }

        //
        // POST: /Disciplina/Edit/5

        [HttpPost]
        public ActionResult Edit(DisciplinaModel disciplinaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDisciplina.GetInstance().Atualizar(disciplinaModel);
                return RedirectToAction("Index");
            }
            return View(disciplinaModel);
        }

        //
        // GET: /Disciplina/Delete/5
 
        public ActionResult Delete(int id)
        {
            DisciplinaModel disciplinaModel = GerenciadorDisciplina.GetInstance().Obter(id);
            return View(disciplinaModel);
        }

        //
        // POST: /Disciplina/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorDisciplina.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}