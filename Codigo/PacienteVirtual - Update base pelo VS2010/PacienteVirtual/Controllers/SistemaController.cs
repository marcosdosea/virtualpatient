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
    public class SistemaController : Controller
    {
        //
        // GET: /Sistema/

        public ViewResult Index()
        {
            return View(GerenciadorSistema.GetInstance().ObterTodos());
        }

        //
        // GET: /Sistema/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorSistema.GetInstance().Obter(id));
        }

        //
        // GET: /Sistema/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Sistema/Create

        [HttpPost]
        public ActionResult Create(SistemaModel sistemaModel)
        {
            if (ModelState.IsValid)
            {
                sistemaModel.IdSistema = GerenciadorSistema.GetInstance().Inserir(sistemaModel);
                return RedirectToAction("Index");
            }

            return View(sistemaModel);
        }

        //
        // GET: /Sistema/Edit/5

        public ActionResult Edit(int id)
        {
            SistemaModel sistemaModel = GerenciadorSistema.GetInstance().Obter(id);
            return View(sistemaModel);
        }

        //
        // POST: /Sistema/Edit/5

        [HttpPost]
        public ActionResult Edit(SistemaModel sistemaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorSistema.GetInstance().Atualizar(sistemaModel);
                return RedirectToAction("Index");
            }
            return View(sistemaModel);
        }

        //
        // GET: /Sistema/Delete/5

        public ActionResult Delete(int id)
        {
            SistemaModel sistemaModel = GerenciadorSistema.GetInstance().Obter(id);
            return View(sistemaModel);
        }

        //
        // POST: /Sistema/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorSistema.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}