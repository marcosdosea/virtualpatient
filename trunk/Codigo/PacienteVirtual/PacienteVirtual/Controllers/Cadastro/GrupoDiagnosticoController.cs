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
    public class GrupoDiagnosticoController : Controller
    {
        //
        // GET: /GrupoDiagnostico/

        public ViewResult Index()
        {
            return View(GerenciadorGrupoDiagnostico.GetInstance().ObterTodos());
        }

        //
        // GET: /GrupoDiagnostico/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorGrupoDiagnostico.GetInstance().Obter(id));
        }

        //
        // GET: /GrupoDiagnostico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /GrupoDiagnostico/Create

        [HttpPost]
        public ActionResult Create(GrupoDiagnosticoModel grupoDiagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorGrupoDiagnostico.GetInstance().Inserir(grupoDiagnostico);
                return RedirectToAction("Index");
            }
            return View(grupoDiagnostico);
        }

        //
        // GET: /GrupoDiagnostico/Edit/5

        public ActionResult Edit(int id)
        {
            GrupoDiagnosticoModel grupoDiagnostico = GerenciadorGrupoDiagnostico.GetInstance().Obter(id);
            return View(grupoDiagnostico);
        }

        //
        // POST: /GrupoDiagnostico/Edit/5

        [HttpPost]
        public ActionResult Edit(GrupoDiagnosticoModel grupoDiagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorGrupoDiagnostico.GetInstance().Atualizar(grupoDiagnostico);
                return RedirectToAction("Index");
            }
            return View(grupoDiagnostico);
        }

        //
        // GET: /GrupoDiagnostico/Delete/5

        public ActionResult Delete(int id)
        {
            GrupoDiagnosticoModel grupoDiagnostico = GerenciadorGrupoDiagnostico.GetInstance().Obter(id);
            return View(grupoDiagnostico);
        }

        //
        // POST: /GrupoDiagnostico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorGrupoDiagnostico.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}