using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class NaturalidadeController : Controller
    {
        //
        // GET: /Naturalidade/

        public ViewResult Index()
        {
            return View(GerenciadorNaturalidade.GetInstance().ObterTodos());
        }

        //
        // GET: /Naturalidade/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorNaturalidade.GetInstance().Obter(id));
        }

        //
        // GET: /Naturalidade/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Naturalidade/Create

        [HttpPost]
        public ActionResult Create(NaturalidadeModel naturalidadeModel)
        {
            if (ModelState.IsValid)
            {
                naturalidadeModel.IdNaturalidade = GerenciadorNaturalidade.GetInstance().Inserir(naturalidadeModel);
                return RedirectToAction("Index");
            }
            return View(naturalidadeModel);
        }

        //
        // GET: /Naturalidade/Edit/5

        public ActionResult Edit(int id)
        {
            NaturalidadeModel naturalidadeModel = GerenciadorNaturalidade.GetInstance().Obter(id);
            return View(naturalidadeModel);
        }

        //
        // POST: /Naturalidade/Edit/5

        [HttpPost]
        public ActionResult Edit(NaturalidadeModel naturalidadeModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorNaturalidade.GetInstance().Atualizar(naturalidadeModel);
                return RedirectToAction("Index");
            }
            return View(naturalidadeModel);
        }

        //
        // GET: /Naturalidade/Delete/5

        public ActionResult Delete(int id)
        {
            NaturalidadeModel naturalidadeModel = GerenciadorNaturalidade.GetInstance().Obter(id);
            return View(naturalidadeModel);
        }

        //
        // POST: /Naturalidade/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorNaturalidade.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}