﻿using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class TurmaController : Controller
    {
        GerenciadorTurma gTurma = GerenciadorTurma.GetInstance();
        GerenciadorInstituicao gInstituicao = GerenciadorInstituicao.GetInstance();
        GerenciadorDisciplina gDisciplina = GerenciadorDisciplina.GetInstance();
        GerenciadorCurso gCurso = GerenciadorCurso.GetInstance();

        //
        // GET: /Turma/

        public ViewResult Index()
        {
            return View(gTurma.ObterTodos());
        }

        //
        // GET: /Turma/Details/5

        public ViewResult Details(int id)
        {
            return View(gTurma.Obter(id));
        }

        //
        // GET: /Turma/Create

        public ActionResult Create()
        {
            ViewBag.IdCurso = new SelectList(gCurso.ObterTodos().ToList(), "IdCurso", "NomeCurso");
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao");
            ViewBag.IdDisciplina = new SelectList(gDisciplina.ObterTodos().ToList(), "IdDisciplina", "NomeDisciplina");
            return View();
        }

        //
        // POST: /Turma/Create

        [HttpPost]
        public ActionResult Create(TurmaModel turmaModel)
        {
            if (ModelState.IsValid)
            {
                turmaModel.IdTurma = gTurma.Inserir(turmaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdCurso = new SelectList(gCurso.ObterTodos().ToList(), "IdCurso", "NomeCurso", turmaModel.IdCurso);
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao", turmaModel.IdInstituicao);
            ViewBag.IdDisciplina = new SelectList(gDisciplina.ObterTodos().ToList(), "IdDisciplina", "NomeDisciplina", turmaModel.IdDisciplina); 
            return View(turmaModel);
        }

        //
        // GET: /Turma/Edit/5

        public ActionResult Edit(int id)
        {
            TurmaModel turmaModel = GerenciadorTurma.GetInstance().Obter(id);
            ViewBag.IdCurso = new SelectList(gCurso.ObterTodos().ToList(), "IdCurso", "NomeCurso", turmaModel.IdCurso);
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao", turmaModel.IdInstituicao);
            ViewBag.IdDisciplina = new SelectList(gDisciplina.ObterTodos().ToList(), "IdDisciplina", "NomeDisciplina", turmaModel.IdDisciplina); 
            return View(turmaModel);
        }

        //
        // POST: /Turma/Edit/5

        [HttpPost]
        public ActionResult Edit(TurmaModel turmaModel)
        {
            if (ModelState.IsValid)
            {
                gTurma.Atualizar(turmaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdCurso = new SelectList(gCurso.ObterTodos().ToList(), "IdCurso", "NomeCurso", turmaModel.IdCurso);
            ViewBag.IdInstituicao = new SelectList(gInstituicao.ObterTodos().ToList(), "IdInstituicao", "NomeInstituicao", turmaModel.IdInstituicao);
            ViewBag.IdDisciplina = new SelectList(gDisciplina.ObterTodos().ToList(), "IdDisciplina", "NomeDisciplina", turmaModel.IdDisciplina);
            return View(turmaModel);
        }

        //
        // GET: /Turma/Delete/5

        public ActionResult Delete(int id)
        {
            TurmaModel turmaModel = GerenciadorTurma.GetInstance().Obter(id);
            ViewBag.IdCurso = gCurso.Obter(turmaModel.IdCurso).NomeCurso;
            ViewBag.IdInstituicao = gInstituicao.Obter(turmaModel.IdInstituicao).NomeInstituicao;
            ViewBag.IdDisciplina = gDisciplina.Obter(turmaModel.IdDisciplina).NomeDisciplina;            
            return View(turmaModel);
        }


        //
        // POST: /Turma/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {          
            gTurma.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}