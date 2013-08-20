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
    public class DiarioPessoalController : Controller
    {
        private pvEntities db = new pvEntities();

        private GerenciadorDiarioPessoal gDiarioPessoal = GerenciadorDiarioPessoal.GetInstance();
        //
        // GET: /DiarioPessoal/

        public ViewResult Index()
        {
            return View(gDiarioPessoal.ObterTodos());
        }

        //
        // GET: /DiarioPessoal/Details/5

        public ViewResult Details(long id)
        {

            return View(gDiarioPessoal.Obter(id));
        }

        //
        // GET: /DiarioPessoal/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /DiarioPessoal/Create

        [HttpPost]
        public ActionResult Create(DiarioPessoalModel diarioPessoal)
        {
            if (ModelState.IsValid)
            {

                diarioPessoal.IdConsultaFixo = gDiarioPessoal.Inserir(diarioPessoal);
                return RedirectToAction("Index");
            }

            return View(diarioPessoal);
        }

        //
        // GET: /DiarioPessoal/Edit/5

        public ActionResult Edit(long id)
        {
            return View(gDiarioPessoal.Obter(id));
        }

        //
        // POST: /DiarioPessoal/Edit/5

        [HttpPost]
        public ActionResult Edit(DiarioPessoalModel diarioPessoal)
        {
            if (ModelState.IsValid)
            {
                gDiarioPessoal.Atualizar(diarioPessoal);
                return RedirectToAction("Index");
            }
            return View(diarioPessoal);
        }

        //
        // GET: /DiarioPessoal/Delete/5

        public ActionResult Delete(long id)
        {
            return View(gDiarioPessoal.Obter(id));
        }

        //
        // POST: /DiarioPessoal/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gDiarioPessoal.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}