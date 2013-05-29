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
    public class ParametoClinicoController : Controller
    {
        //
        // GET: /ParamentoClinico/

        public ViewResult Index()
        {
            return View(GerenciadorParamentoClinico.GetInstance().ObterTodos());
        }

        //
        // GET: /ParamentoClinico/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorParamentoClinico.GetInstance().Obter(id));
        }

        //
        // GET: /ParamentoClinico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ParamentoClinico/Create

        [HttpPost]
        public ActionResult Create(ParamentoClinicoModel paramentoClinicoModel)
        {
            if (ModelState.IsValid)
            {
                paramentoClinicoModel.IdParamentoClinico = GerenciadorParamentoClinico.GetInstance().Inserir(paramentoClinicoModel);
                return RedirectToAction("Index");
            }

            return View(paramentoClinicoModel);
        }

        //
        // GET: /ParamentoClinico/Edit/5

        public ActionResult Edit(int id)
        {
            ParamentoClinicoModel paramentoClinicoModel = GerenciadorParamentoClinico.GetInstance().Obter(id);
            return View(paramentoClinicoModel);
        }

        //
        // POST: /ParamentoClinico/Edit/5

        [HttpPost]
        public ActionResult Edit(ParamentoClinicoModel paramentoClinicoModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorParamentoClinico.GetInstance().Atualizar(paramentoClinicoModel);
                return RedirectToAction("Index");
            }
            return View(paramentoClinicoModel);
        }

        //
        // GET: /ParamentoClinico/Delete/5

        public ActionResult Delete(int id)
        {
            ParamentoClinicoModel paramentoClinicoModel = GerenciadorParamentoClinico.GetInstance().Obter(id);
            return View(paramentoClinicoModel);
        }

        //
        // POST: /ParamentoClinico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorParamentoClinico.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}