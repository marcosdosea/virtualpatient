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
    public class EscolaridadeController : Controller
    {
        //
        // GET: /Escolaridade/

        public ViewResult Index()
        {
            return View(GerenciadorEscolaridade.GetInstance().ObterTodos());
        }

        //
        // GET: /Escolaridade/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorEscolaridade.GetInstance().Obter(id));
        }

        //
        // GET: /Escolaridade/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Escolaridade/Create

        [HttpPost]
        public ActionResult Create(EscolaridadeModel escolaridadeModel)
        {
            if (ModelState.IsValid)
            {
                escolaridadeModel.IdEscolaridade = GerenciadorEscolaridade.GetInstance().Inserir(escolaridadeModel);
                return RedirectToAction("Index");
            }

            return View(escolaridadeModel);
        }

        //
        // GET: /Escolaridade/Edit/5

        public ActionResult Edit(int id)
        {
            EscolaridadeModel escolaridadeModel = GerenciadorEscolaridade.GetInstance().Obter(id);
            return View(escolaridadeModel);
        }

        //
        // POST: /Escolaridade/Edit/5

        [HttpPost]
        public ActionResult Edit(EscolaridadeModel escolaridadeModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorEscolaridade.GetInstance().Atualizar(escolaridadeModel);
                return RedirectToAction("Index");
            }
            return View(escolaridadeModel);
        }

        //
        // GET: /Escolaridade/Delete/5

        public ActionResult Delete(int id)
        {
            EscolaridadeModel escolaridadeModel = GerenciadorEscolaridade.GetInstance().Obter(id);
            return View(escolaridadeModel);
        }

        //
        // POST: /Escolaridade/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorEscolaridade.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}