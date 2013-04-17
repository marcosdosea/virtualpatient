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
using Negocio;

namespace PacienteVirtual.Controllers
{
    public class TurmaController : Controller
    {
        //private pvEntities db = new pvEntities();

        //
        // GET: /Turma/

        public ViewResult Index()
        {
            /*var tb_turma = db.tb_turma.Include("tb_instituicao");
            return View(tb_turma.ToList());*/

            return View(GerenciadorTurma.GetInstance().ObterTodos());
        }

        //
        // GET: /Turma/Details/5

        public ViewResult Details(int id)
        {
            /*TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            return View(turmae);*/
            return View(GerenciadorTurma.GetInstance().Obter(id));

        }

        //
        // GET: /Turma/Create

        public ActionResult Create()
        {
            /*ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao");
            return View();*/
            ViewBag.Instituicoes = GerenciadorInstituicao.GetInstance().ObterTodos();
            ViewBag.Disciplinas = GerenciadorDisciplina.GetInstance().ObterTodos();
            return View();
        }

        //
        // POST: /Turma/Create

        [HttpPost]
        public ActionResult Create(TurmaModel turmaModel/*TurmaE turmae*/)
        {
            if (ModelState.IsValid)
            {
                /*  db.tb_turma.AddObject(turmae);
                  db.SaveChanges();
                  return RedirectToAction("Index"); */
                turmaModel.IdTurma = GerenciadorTurma.GetInstance().Inserir(turmaModel);

                return RedirectToAction("Index");

            }

            /*ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", turmae.IdInstituicao);
            return View(turmae);*/

            return RedirectToAction("Index");
        }

        //
        // GET: /Turma/Edit/5

        public ActionResult Edit(int id)
        {

            /*TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", turmae.IdInstituicao);
            return View(turmae);*/

            ViewBag.Instituicoes = GerenciadorInstituicao.GetInstance().ObterTodos();
            ViewBag.Disciplinas = GerenciadorDisciplina.GetInstance().ObterTodos();
            TurmaModel turmaModel = GerenciadorTurma.GetInstance().Obter(id);
            return View(turmaModel);
        }

        //
        // POST: /Turma/Edit/5

        [HttpPost]
        public ActionResult Edit(TurmaModel turmaModel/*TurmaE turmae*/)
        {
            if (ModelState.IsValid)
            {
                /*db.tb_turma.Attach(turmae);
                db.ObjectStateManager.ChangeObjectState(turmae, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");*/

                GerenciadorTurma.GetInstance().Atualizar(turmaModel);
                return RedirectToAction("Index");
            }
            /*ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", turmae.IdInstituicao);
            return View(turmae);*/
            return View(turmaModel);
        }

        //
        // GET: /Turma/Delete/5

        public ActionResult Delete(int id)
        {
            /*TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            return View(turmae);*/
            TurmaModel turmaModel = GerenciadorTurma.GetInstance().Obter(id);
            
            ViewBag.Instituicao = GerenciadorInstituicao.GetInstance().Obter(turmaModel.IdInstituicao).NomeInstituicao;
            ViewBag.Disciplinas = GerenciadorDisciplina.GetInstance().Obter(turmaModel.IdDisciplina).NomeDisciplina;
            
            return View(turmaModel);
        }


        //
        // POST: /Turma/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            /*STurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            db.tb_turma.DeleteObject(turmae);
            db.SaveChanges();
            return RedirectToAction("Index");*/

            GerenciadorTurma.GetInstance().Remover(id);
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}