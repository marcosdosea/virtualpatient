﻿using System;
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
    public class DiagnosticoController : Controller
    {
        GerenciadorDiagnostico gDiagnostico = GerenciadorDiagnostico.GetInstance();
        GerenciadorGrupoDiagnostico gGrupoDiagnostico = GerenciadorGrupoDiagnostico.GetInstance();

        //
        // GET: /Intervencao/
        public ViewResult Index()
        {
            return View(gDiagnostico.ObterTodos());
        }

        //
        // GET: /Intervencao/Details/5
        public ViewResult Details(int id)
        {
            return View(gDiagnostico.Obter(id));
        }

        //
        // GET: /Intervencao/Create

        public ActionResult Create()
        {
            ViewBag.IdGrupoDiagnostico = new SelectList(gGrupoDiagnostico.ObterTodos(), "IdGrupoDiagnostico", "DescricaoGrupoDiagnostico");
            return View();
        }

        //
        // POST: /Intervencao/Create
        [HttpPost]
        public ActionResult Create(DiagnosticoModel diagnosticoModel)
        {
            if (ModelState.IsValid)
            {
                diagnosticoModel.IdGrupoDiagnostico = gDiagnostico.Inserir(diagnosticoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdGrupoDiagnostico = new SelectList(gGrupoDiagnostico.ObterTodos(), "IdGrupoDiagnostico", "DescricaoGrupoDiagnostico", diagnosticoModel.IdGrupoDiagnostico);
            return View(diagnosticoModel);
        }

        //
        // GET: /Intervencao/Edit/5
        public ActionResult Edit(int id)
        {
            DiagnosticoModel diagnostico = gDiagnostico.Obter(id);
            ViewBag.IdGrupoDiagnostico = new SelectList(gGrupoDiagnostico.ObterTodos(), "IdGrupoDiagnostico", "DescricaoGrupoDiagnostico", diagnostico.IdGrupoDiagnostico);
            return View(diagnostico);
        }

        //
        // POST: /Intervencao/Edit/5

        [HttpPost]
        public ActionResult Edit(DiagnosticoModel diagnostico)
        {
            if (ModelState.IsValid)
            {
                gDiagnostico.Atualizar(diagnostico);
                return RedirectToAction("Index");
            }
            ViewBag.IdGrupoDiagnostico = new SelectList(gGrupoDiagnostico.ObterTodos(), "IdGrupoDiagnostico", "DescricaoGrupoDiagnostico", diagnostico.IdGrupoDiagnostico);
            return View(diagnostico);
        }

        //
        // GET: /Intervencao/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gDiagnostico.Obter(id));
        }

        //
        // POST: /Intervencao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gDiagnostico.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}