using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Controllers
{ 
    public class TurmaController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /Turma/

        public ViewResult Index()
        {
            var tb_turma = db.tb_turma.Include("tb_instituicao");
            return View(tb_turma.ToList());
        }

        //
        // GET: /Turma/Details/5

        public ViewResult Details(int id)
        {
            TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            return View(turmae);
        }

        //
        // GET: /Turma/Create

        public ActionResult Create()
        {
            ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao");
            return View();
        } 

        //
        // POST: /Turma/Create

        [HttpPost]
        public ActionResult Create(TurmaE turmae)
        {
            if (ModelState.IsValid)
            {
                db.tb_turma.AddObject(turmae);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", turmae.IdInstituicao);
            return View(turmae);
        }
        
        //
        // GET: /Turma/Edit/5
 
        public ActionResult Edit(int id)
        {
            TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", turmae.IdInstituicao);
            return View(turmae);
        }

        //
        // POST: /Turma/Edit/5

        [HttpPost]
        public ActionResult Edit(TurmaE turmae)
        {
            if (ModelState.IsValid)
            {
                db.tb_turma.Attach(turmae);
                db.ObjectStateManager.ChangeObjectState(turmae, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdInstituicao = new SelectList(db.tb_instituicao, "IdInstituicao", "NomeInstituicao", turmae.IdInstituicao);
            return View(turmae);
        }

        //
        // GET: /Turma/Delete/5
 
        public ActionResult Delete(int id)
        {
            TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            return View(turmae);
        }

        //
        // POST: /Turma/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            TurmaE turmae = db.tb_turma.Single(t => t.IdTurma == id);
            db.tb_turma.DeleteObject(turmae);
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