﻿using System;
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
    public class CursoController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /Curso/

        public ViewResult Index()
        {
            /*var tb_curso = db.tb_curso.Include("tb_instituicao");
            return View(tb_curso.ToList());*/

           return View(GerenciadorCurso.GetInstance().ObterTodos());
        }

        //
        // GET: /Curso/Details/5

        public ViewResult Details(int id)
        {
            CursoE cursoe = db.tb_curso.Single(c => c.IdCurso == id);
            return View(cursoe);
            //return View(GerenciadorCurso.GetInstance().Obter(id));
        }

        //
        // GET: /Curso/Create

        public ActionResult Create()
        {
           
            List<string> colors = new List<string>();
            colors.Add("red");
            colors.Add("green");
            colors.Add("blue");
            ViewBag.ListColors = colors; //colors is List

            ViewBag.Instituicoes1 = GerenciadorInstituicao.GetInstance().ObterTodos();
            ViewBag.Instituicoes2 = new SelectList(GerenciadorInstituicao.GetInstance().ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao");
            return View();
        }

        //
        // POST: /Curso/Create

        [HttpPost]
        public ActionResult Create(/*CursoE cursoe*/CursoModel cursoModel)
        {
            if (ModelState.IsValid)
            {

                /*db.tb_curso.AddObject(cursoe);
                db.SaveChanges();
                return RedirectToAction("Index");*/

                cursoModel.IdInstituicao = ToInt32(Request.Form["IdInstituicao"].ToString());


                cursoModel.IdCurso = GerenciadorCurso.GetInstance().Inserir(cursoModel);

                return RedirectToAction("Index");
            }

            /*ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", cursoe.IdInstituicao);
            return View(cursoe);*/
            return View(cursoModel);
        }

        //
        // GET: /Curso/Edit/5

        public ActionResult Edit(int id)
        {
            /*CursoE cursoe = db.tb_curso.Single(c => c.IdCurso == id);
            ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", cursoe.IdInstituicao);
            return View(cursoe);*/

            CursoModel cursoModel = GerenciadorCurso.GetInstance().Obter(id);
            return View(cursoModel);
        }

        //
        // POST: /Curso/Edit/5

        [HttpPost]
        public ActionResult Edit(/*CursoE cursoe*/ CursoModel cursoModel)
        {
            if (ModelState.IsValid)
            {
                /*db.tb_curso.Attach(cursoe);
                db.ObjectStateManager.ChangeObjectState(cursoe, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");*/
                GerenciadorCurso.GetInstance().Atualizar(cursoModel);
                return RedirectToAction("Index");
            }
            /*  ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", cursoe.IdInstituicao);
              return View(cursoe);*/
            return View(cursoModel);
        }

        //
        // GET: /Curso/Delete/5

        public ActionResult Delete(int id)
        {

            /*CursoE cursoe = db.tb_curso.Single(c => c.IdCurso == id);
            return View(cursoe);*/
            CursoModel cursoModel = GerenciadorCurso.GetInstance().Obter(id);
            return View(cursoModel);
        }

        //
        // POST: /Curso/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            /* CursoE cursoe = db.tb_curso.Single(c => c.IdCurso == id);
             db.tb_curso.DeleteObject(cursoe);
             db.SaveChanges();
             return RedirectToAction("Index");*/
            GerenciadorCurso.GetInstance().Remover(id);
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}