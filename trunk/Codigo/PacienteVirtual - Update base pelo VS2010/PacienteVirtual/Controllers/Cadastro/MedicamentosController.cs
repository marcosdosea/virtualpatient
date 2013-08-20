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
    public class MedicamentosController : Controller
    {
        //
        // GET: /Medicamentos/

        public ViewResult Index()
        {
            return View(GerenciadorMedicamentos.GetInstance().ObterTodos());
        }

        //
        // GET: /Medicamentos/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorMedicamentos.GetInstance().Obter(id));
        }

        //
        // GET: /Medicamentos/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Medicamentos/Create

        [HttpPost]
        public ActionResult Create(MedicamentosModel medicamentosModel)
        {
            if (ModelState.IsValid)
            {

                medicamentosModel.IdMedicamento = GerenciadorMedicamentos.GetInstance().Inserir(medicamentosModel);

                return RedirectToAction("Index");
            }

            return View(medicamentosModel);
        }

        //
        // GET: /Medicamentos/Edit/5

        public ActionResult Edit(int id)
        {
            MedicamentosModel medicamentosModel = GerenciadorMedicamentos.GetInstance().Obter(id);
            return View(medicamentosModel);
        }

        //
        // POST: /Medicamentos/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentosModel medicamentosModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentos.GetInstance().Atualizar(medicamentosModel);
                return RedirectToAction("Index");
            }
            return View(medicamentosModel);
        }

        //
        // GET: /Medicamentos/Delete/5

        public ActionResult Delete(int id)
        {
            MedicamentosModel medicamentosModel = GerenciadorMedicamentos.GetInstance().Obter(id);
            return View(medicamentosModel);
        }

        //
        // POST: /Medicamentos/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorMedicamentos.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}