using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class PatologiaController : Controller
    {
        //
        // GET: /Patologia/

        public ViewResult Index()
        {
            return View(GerenciadorPatologia.GetInstance().ObterTodos());
        }

        //
        // GET: /PAtologia/Details/5

        public ViewResult Details(long id)
        {
            return View(GerenciadorPatologia.GetInstance().Obter(id));
        }

        //
        // GET: /Patologia/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Patologia/Create

        [HttpPost]
        public ActionResult Create(PatologiaModel patologiaModel)
        {
            if (ModelState.IsValid)
            {
                patologiaModel.IdPatologia = GerenciadorPatologia.GetInstance().Inserir(patologiaModel);
                return RedirectToAction("Index");
            }
            return View(patologiaModel);
        }

        //
        // GET: /Patologia/Edit/5

        public ActionResult Edit(long id)
        {
            PatologiaModel patologiaModel = GerenciadorPatologia.GetInstance().Obter(id);
            return View(patologiaModel);
        }

        //
        // POST: /Patologia/Edit/5

        [HttpPost]
        public ActionResult Edit(PatologiaModel patologiaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorPatologia.GetInstance().Atualizar(patologiaModel);
                return RedirectToAction("Index");
            }
            return View(patologiaModel);
        }

        //
        // GET: /Patologia/Delete/5

        public ActionResult Delete(long id)
        {
            PatologiaModel patologiaModel = GerenciadorPatologia.GetInstance().Obter(id);
            return View(patologiaModel);
        }

        //
        // POST: /Patologia/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            GerenciadorPatologia.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}