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
    public class RazaoEncontroController : Controller
    {
        //
        // GET: /RazaoEncontro/

        public ViewResult Index()
        {
            return View(GerenciadorRazaoEncontro.GetInstance().ObterTodos());
        }

        //
        // GET: /RazaoEncontro/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorRazaoEncontro.GetInstance().Obter(id));
        }

        //
        // GET: /RazaoEncontro/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /RazaoEncontro/Create

        [HttpPost]
        public ActionResult Create(RazaoEncontroModel razaoEncontroModel)
        {
            if (ModelState.IsValid)
            {

                razaoEncontroModel.IdRazaoEncontro = GerenciadorRazaoEncontro.GetInstance().Inserir(razaoEncontroModel);

                return RedirectToAction("Index");
            }

            return View(razaoEncontroModel);
        }

        //
        // GET: /RazaoEncontro/Edit/5

        public ActionResult Edit(int id)
        {
            RazaoEncontroModel razaoEncontroModel = GerenciadorRazaoEncontro.GetInstance().Obter(id);
            return View(razaoEncontroModel);
        }

        //
        // POST: /RazaoEncontro/Edit/5

        [HttpPost]
        public ActionResult Edit(RazaoEncontroModel razaoEncontroModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorRazaoEncontro.GetInstance().Atualizar(razaoEncontroModel);
                return RedirectToAction("Index");
            }
            return View(razaoEncontroModel);
        }

        //
        // GET: /RazaoEncontro/Delete/5

        public ActionResult Delete(int id)
        {
            RazaoEncontroModel razaoEncontroModel = GerenciadorRazaoEncontro.GetInstance().Obter(id);
            return View(razaoEncontroModel);
        }

        //
        // POST: /RazaoEncontro/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorRazaoEncontro.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}