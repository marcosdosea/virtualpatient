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
    public class EstiloVidaController : Controller
    {
        private pvEntities db = new pvEntities();

        private GerenciadorEstiloVida gEstiloVida = GerenciadorEstiloVida.GetInstance();
        //
        // GET: /EstiloVida/

        public ViewResult Index()
        {
            return View(gEstiloVida.ObterTodos());
        }

        //
        // GET: /EstiloVida/Details/5

        public ViewResult Details(long id)
        {

            return View(gEstiloVida.Obter(id));
        }

        //
        // GET: /EstiloVida/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /EstiloVida/Create

        [HttpPost]
        public ActionResult Create(EstiloVidaModel estiloVidaModel)
        {
            if (ModelState.IsValid)
            {

                estiloVidaModel.IdConsultaVariavel = gEstiloVida.Inserir(estiloVidaModel);
                return RedirectToAction("Index");
            }

            return View(estiloVidaModel);
        }

        //
        // GET: /EstiloVida/Edit/5

        public ActionResult Edit(long id)
        {
            return View(gEstiloVida.Obter(id));
        }

        //
        // POST: /EstiloVida/Edit/5

        [HttpPost]
        public ActionResult Edit(EstiloVidaModel estiloVidaModel)
        {
            if (ModelState.IsValid)
            {
                gEstiloVida.Atualizar(estiloVidaModel);
                return RedirectToAction("Index");
            }
            return View(estiloVidaModel);
        }

        //
        // GET: /EstiloVida/Delete/5

        public ActionResult Delete(long id)
        {
            return View(gEstiloVida.Obter(id));
        }

        //
        // POST: /EstiloVida/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gEstiloVida.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}