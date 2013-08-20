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
    public class AcaoAlternativaController : Controller
    {
        //
        // GET: /AcaoAlternativa/

        public ViewResult Index()
        {
            return View(GerenciadorAcaoAlternativa.GetInstance().ObterTodos());
        }

        //
        // GET: /AcaoAlternativa/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorAcaoAlternativa.GetInstance().Obter(id));
        }

        //
        // GET: /AcaoAlternativa/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AcaoAlternativa/Create

        [HttpPost]
        public ActionResult Create(AcaoAlternativaModel acaoAlternativaModel)
        {
            if (ModelState.IsValid)
            {

                acaoAlternativaModel.IdAcaoAlternativa = GerenciadorAcaoAlternativa.GetInstance().Inserir(acaoAlternativaModel);

                return RedirectToAction("Index");
            }

            return View(acaoAlternativaModel);
        }

        //
        // GET: /AcaoAlternativa/Edit/5

        public ActionResult Edit(int id)
        {
            AcaoAlternativaModel acaoAlternativaModel = GerenciadorAcaoAlternativa.GetInstance().Obter(id);
            return View(acaoAlternativaModel);
        }

        //
        // POST: /AcaoAlternativa/Edit/5

        [HttpPost]
        public ActionResult Edit(AcaoAlternativaModel acaoAlternativaModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorAcaoAlternativa.GetInstance().Atualizar(acaoAlternativaModel);
                return RedirectToAction("Index");
            }
            return View(acaoAlternativaModel);
        }

        //
        // GET: /AcaoAlternativa/Delete/5

        public ActionResult Delete(int id)
        {
            AcaoAlternativaModel acaoAlternativaModel = GerenciadorAcaoAlternativa.GetInstance().Obter(id);
            return View(acaoAlternativaModel);
        }

        //
        // POST: /AcaoAlternativa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorAcaoAlternativa.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}