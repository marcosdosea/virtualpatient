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
    public class PlanoSaudeController : Controller
    {
        //
        // GET: /PlanoSaude/

        public ViewResult Index()
        {
            return View(GerenciadorPlanoSaude.GetInstance().ObterTodos());
        }

        //
        // GET: /PlanoSaude/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorPlanoSaude.GetInstance().Obter(id));
        }

        //
        // GET: /PlanoSaude/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /PlanoSaude/Create

        [HttpPost]
        public ActionResult Create(PlanoSaudeModel planoSaudeModel)
        {
            if (ModelState.IsValid)
            {

                planoSaudeModel.IdPlanoSaude = GerenciadorPlanoSaude.GetInstance().Inserir(planoSaudeModel);

                return RedirectToAction("Index");
            }

            return View(planoSaudeModel);
        }

        //
        // GET: /PlanoSaude/Edit/5

        public ActionResult Edit(int id)
        {
            PlanoSaudeModel planoSaudeModel = GerenciadorPlanoSaude.GetInstance().Obter(id);
            return View(planoSaudeModel);
        }

        //
        // POST: /PlanoSaude/Edit/5

        [HttpPost]
        public ActionResult Edit(PlanoSaudeModel planoSaudeModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorPlanoSaude.GetInstance().Atualizar(planoSaudeModel);
                return RedirectToAction("Index");
            }
            return View(planoSaudeModel);
        }

        //
        // GET: /PlanoSaude/Delete/5

        public ActionResult Delete(int id)
        {
            PlanoSaudeModel planoSaudeModel = GerenciadorPlanoSaude.GetInstance().Obter(id);
            return View(planoSaudeModel);
        }

        //
        // POST: /PlanoSaude/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorPlanoSaude.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}