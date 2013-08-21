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
    public class BebidaController : Controller
    {
        //
        // GET: /Bebida/

        public ViewResult Index()
        {
            return View(GerenciadorBebida.GetInstance().ObterTodos());
        }

        //
        // GET: /Bebida/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorBebida.GetInstance().Obter(id));
        }

        //
        // GET: /Bebida/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Bebida/Create

        [HttpPost]
        public ActionResult Create(BebidaModel bebidaModel)
        {
            if (ModelState.IsValid)
            {
                bebidaModel.IdBebida = GerenciadorBebida.GetInstance().Inserir(bebidaModel);
                return RedirectToAction("Index");
            }

            return View(bebidaModel);
        }

        //
        // GET: /Bebida/Edit/5

        public ActionResult Edit(int id)
        {
            BebidaModel bebidaModel = GerenciadorBebida.GetInstance().Obter(id);
            return View(bebidaModel);
        }

        //
        // POST: /Bebida/Edit/5

        [HttpPost]
        public ActionResult Edit(BebidaModel bebidaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorBebida.GetInstance().Atualizar(bebidaModel);
                return RedirectToAction("Index");
            }
            return View(bebidaModel);
        }

        //
        // GET: /Bebida/Delete/5

        public ActionResult Delete(int id)
        {
            BebidaModel bebidaModel = GerenciadorBebida.GetInstance().Obter(id);
            return View(bebidaModel);
        }

        //
        // POST: /Bebida/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorBebida.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}