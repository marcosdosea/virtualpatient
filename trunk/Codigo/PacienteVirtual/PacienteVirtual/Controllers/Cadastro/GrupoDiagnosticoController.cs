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
    public class ClasseDiagnosticoController : Controller
    {
        //
        // GET: /ClasseDiagnostico/

        public ViewResult Index()
        {
            return View(GerenciadorClasseDiagnostico.GetInstance().ObterTodos());
        }

        //
        // GET: /ClasseDiagnostico/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorClasseDiagnostico.GetInstance().Obter(id));
        }

        //
        // GET: /ClasseDiagnostico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ClasseDiagnostico/Create

        [HttpPost]
        public ActionResult Create(ClasseDiagnosticoModel classeDiagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorClasseDiagnostico.GetInstance().Inserir(classeDiagnostico);
                return RedirectToAction("Index");
            }
            return View(classeDiagnostico);
        }

        //
        // GET: /ClasseDiagnostico/Edit/5

        public ActionResult Edit(int id)
        {
            ClasseDiagnosticoModel classeDiagnostico = GerenciadorClasseDiagnostico.GetInstance().Obter(id);
            return View(classeDiagnostico);
        }

        //
        // POST: /ClasseDiagnostico/Edit/5

        [HttpPost]
        public ActionResult Edit(ClasseDiagnosticoModel classeDiagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorClasseDiagnostico.GetInstance().Atualizar(classeDiagnostico);
                return RedirectToAction("Index");
            }
            return View(classeDiagnostico);
        }

        //
        // GET: /ClasseDiagnostico/Delete/5

        public ActionResult Delete(int id)
        {
            ClasseDiagnosticoModel classeDiagnostico = GerenciadorClasseDiagnostico.GetInstance().Obter(id);
            return View(classeDiagnostico);
        }

        //
        // POST: /ClasseDiagnostico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorClasseDiagnostico.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}