﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class TurmaPessoaRelatoController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorTurmaPessoaRelato gturmaPessRelato = GerenciadorTurmaPessoaRelato.GetInstance();
       
        //
        // GET: /TurmaPessoaRelato/

        public ViewResult Index()
        {
            return View(gturmaPessRelato.ObterTodos());
        }

        //
        // GET: /TurmaPessoaRelato/Details/5

        public ViewResult Details(int id)
        {
            //TurmaPessoaRelatoModel TurmaPessoaRelatoModel = db.tb_turma_pessoa_relato.Single(t => t.IdTurma == id);
            return View();
        }

        //
        // GET: /TurmaPessoaRelato/Create

        public ActionResult Create()
        {
            ViewBag.IdTurma = new SelectList(GerenciadorTurma.GetInstance().ObterTodos().ToList(), "IdTurma", "Codigo");
            ViewBag.IdPessoa = new SelectList(GerenciadorPessoa.GetInstance().ObterTodos().ToList(), "IdPessoa", "Nome");

            return View();
        }
        //
        // POST: /TurmaPessoaRelato/Create
       // protected void Foo_DataBound(object sender, EventArgs e)
      //  {
        //      GerenciadorPessoa.GetInstance().ObterTodos().DataBind();
       // }
        [HttpPost]
        public ActionResult Create(TurmaPessoaRelatoModel TurmaPessoaRelatoModel)
        {
            if (ModelState.IsValid)
            {
               // db.TurmaPessoaRelatoModel.AddObject(TurmaPessoaRelatoModel);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(TurmaPessoaRelatoModel);
        }
        
        //
        // GET: /TurmaPessoaRelato/Edit/5
 
        public ActionResult Edit(int id)
        {
            //TurmaPessoaRelatoModel TurmaPessoaRelatoModel = db.TurmaPessoaRelatoModel.Single(t => t.IdTurma == id);
            return View();
        }

        //
        // POST: /TurmaPessoaRelato/Edit/5

        [HttpPost]
        public ActionResult Edit(TurmaPessoaRelatoModel TurmaPessoaRelatoModel)
        {
            if (ModelState.IsValid)
            {
                //db.TurmaPessoaRelatoModel.Attach(TurmaPessoaRelatoModel);
                db.ObjectStateManager.ChangeObjectState(TurmaPessoaRelatoModel, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(TurmaPessoaRelatoModel);
        }

        //
        // GET: /TurmaPessoaRelato/Delete/5
 
        public ActionResult Delete(int id)
        {
            //TurmaPessoaRelatoModel TurmaPessoaRelatoModel = db.TurmaPessoaRelatoModel.Single(t => t.IdTurma == id);
            return View();
        }

        //
        // POST: /TurmaPessoaRelato/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            //TurmaPessoaRelatoModel TurmaPessoaRelatoModel = db.TurmaPessoaRelatoModel.Single(t => t.IdTurma == id);
            //db.TurmaPessoaRelatoModel.DeleteObject(TurmaPessoaRelatoModel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}