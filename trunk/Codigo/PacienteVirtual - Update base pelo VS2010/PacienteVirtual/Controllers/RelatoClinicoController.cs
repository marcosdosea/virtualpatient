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
    public class RelatoClinicoController : Controller
    {
        GerenciadorRelato gRelato = GerenciadorRelato.GetInstance();
        GerenciadorPaciente gPaciente = GerenciadorPaciente.GetInstance();

        //
        // GET: /Curso/
        public ViewResult Index()
        {
            return View(gRelato.ObterTodos());
        }

        //
        // GET: /Curso/Details/5
        public ViewResult Details(int id)
        {
            return View(gRelato.Obter(id));
        }

        //
        // GET: /Curso/Create

        public ActionResult Create()
        {
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View();
        }

        //
        // POST: /Curso/Create
        [HttpPost]
        public ActionResult Create(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                relatoModel.IdRelato = gRelato.Inserir(relatoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        //
        // GET: /Curso/Edit/5
        public ActionResult Edit(int id)
        {
            RelatoClinicoModel relatoModel = gRelato.Obter(id);
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        //
        // POST: /Curso/Edit/5

        [HttpPost]
        public ActionResult Edit(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                gRelato.Atualizar(relatoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        //
        // GET: /Curso/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gRelato.Obter(id));
        }

        //
        // POST: /Curso/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gRelato.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}