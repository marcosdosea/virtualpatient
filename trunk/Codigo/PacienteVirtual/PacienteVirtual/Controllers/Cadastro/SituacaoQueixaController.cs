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
    public class SituacaoQueixaController : Controller
    {
        //
        // GET: /SituacaoQueixa/

        public ViewResult Index()
        {
            return View(GerenciadorSituacaoQueixa.GetInstance().ObterTodos());
        }

        //
        // GET: /SituacaoQueixa/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorSituacaoQueixa.GetInstance().Obter(id));
        }

        //
        // GET: /SituacaoQueixa/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /SituacaoQueixa/Create

        [HttpPost]
        public ActionResult Create(SituacaoQueixaModel situacaoQueixa)
        {
            if (ModelState.IsValid)
            {
                GerenciadorSituacaoQueixa.GetInstance().Inserir(situacaoQueixa);
                return RedirectToAction("Index");
            }

            return View(situacaoQueixa);
        }

        //
        // GET: /SituacaoQueixa/Edit/5

        public ActionResult Edit(int id)
        {
            SituacaoQueixaModel situacaoQueixa = GerenciadorSituacaoQueixa.GetInstance().Obter(id);
            return View(situacaoQueixa);
        }

        //
        // POST: /SituacaoQueixa/Edit/5

        [HttpPost]
        public ActionResult Edit(SituacaoQueixaModel situacaoQueixa)
        {
            if (ModelState.IsValid)
            {
                GerenciadorSituacaoQueixa.GetInstance().Atualizar(situacaoQueixa);
                return RedirectToAction("Index");
            }
            return View(situacaoQueixa);
        }

        //
        // GET: /SituacaoQueixa/Delete/5

        public ActionResult Delete(int id)
        {
            SituacaoQueixaModel situacaoQueixa = GerenciadorSituacaoQueixa.GetInstance().Obter(id);
            return View(situacaoQueixa);
        }

        //
        // POST: /SituacaoQueixa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorSituacaoQueixa.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}