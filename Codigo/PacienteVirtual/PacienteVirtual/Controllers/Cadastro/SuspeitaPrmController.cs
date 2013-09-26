using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio.Cadastro;
using PacienteVirtual.Models.Cadastro;

namespace PacienteVirtual.Controllers.Cadastro
{ 
    public class SuspeitaPrmController : Controller
    {
         //
        // GET: /SuspeitaPrm/

        public ViewResult Index()
        {
            return View(GerenciadorSuspeitaPrm.GetInstance().ObterTodos());
        }

        //
        // GET: /SuspeitaPrm/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorSuspeitaPrm.GetInstance().Obter(id));
        }

        //
        // GET: /SuspeitaPrm/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /SuspeitaPrm/Create

        [HttpPost]
        public ActionResult Create(SuspeitaPrmModel suspeitaPrmModel)
        {
            if (ModelState.IsValid)
            {

                suspeitaPrmModel.IdSuspeitaPrm = GerenciadorSuspeitaPrm.GetInstance().Inserir(suspeitaPrmModel);

                return RedirectToAction("Index");
            }

            return View(suspeitaPrmModel);
        }

        //
        // GET: /SuspeitaPrm/Edit/5

        public ActionResult Edit(int id)
        {
            SuspeitaPrmModel suspeitaPrmModel = GerenciadorSuspeitaPrm.GetInstance().Obter(id);
            return View(suspeitaPrmModel);
        }

        //
        // POST: /SuspeitaPrm/Edit/5

        [HttpPost]
        public ActionResult Edit(SuspeitaPrmModel suspeitaPrmModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorSuspeitaPrm.GetInstance().Atualizar(suspeitaPrmModel);
                return RedirectToAction("Index");
            }
            return View(suspeitaPrmModel);
        }

        //
        // GET: /SuspeitaPrm/Delete/5

        public ActionResult Delete(int id)
        {
            SuspeitaPrmModel suspeitaPrmModel = GerenciadorSuspeitaPrm.GetInstance().Obter(id);
            return View(suspeitaPrmModel);
        }

        //
        // POST: /SuspeitaPrm/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorSuspeitaPrm.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}