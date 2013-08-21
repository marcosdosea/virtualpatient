using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{ 
    public class AcaoQueixaController : Controller
    {
        //
        // GET: /AcaoQueixa/

        public ViewResult Index()
        {
            return View(GerenciadorAcaoQueixa.GetInstance().ObterTodos());
        }

        //
        // GET: /AcaoQueixa/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorAcaoQueixa.GetInstance().Obter(id));
        }

        //
        // GET: /AcaoQueixa/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AcaoQueixa/Create

        [HttpPost]
        public ActionResult Create(AcaoQueixaModel acaoQueixaModel)
        {
            if (ModelState.IsValid)
            {

                acaoQueixaModel.IdAcaoQueixa = GerenciadorAcaoQueixa.GetInstance().Inserir(acaoQueixaModel);

                return RedirectToAction("Index");
            }

            return View(acaoQueixaModel);
        }

        //
        // GET: /AcaoQueixa/Edit/5

        public ActionResult Edit(int id)
        {
            AcaoQueixaModel acaoQueixaModel = GerenciadorAcaoQueixa.GetInstance().Obter(id);
            return View(acaoQueixaModel);
        }

        //
        // POST: /AcaoQueixa/Edit/5

        [HttpPost]
        public ActionResult Edit(AcaoQueixaModel acaoQueixaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorAcaoQueixa.GetInstance().Atualizar(acaoQueixaModel);
                return RedirectToAction("Index");
            }
            return View(acaoQueixaModel);
        }

        //
        // GET: /AcaoQueixa/Delete/5

        public ActionResult Delete(int id)
        {
            AcaoQueixaModel acaoQueixaModel = GerenciadorAcaoQueixa.GetInstance().Obter(id);
            return View(acaoQueixaModel);
        }

        //
        // POST: /AcaoQueixa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorAcaoQueixa.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}