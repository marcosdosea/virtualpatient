using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers.Consulta
{ 
    public class OxigenacaoController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /Oxigenacao/

        public ViewResult Index()
        {
            var tb_oxiginecao = db.tb_oxiginecao.Include("tb_consulta_variavel");
            return View(tb_oxiginecao.ToList());
        }

        //
        // GET: /Oxigenacao/Details/5

        public ViewResult Details(long id)
        {
            tb_oxiginecao tb_oxiginecao = db.tb_oxiginecao.Single(t => t.IdConsultaVariavel == id);
            return View(tb_oxiginecao);
        }

        //
        // GET: /Oxigenacao/Create

        public ActionResult Create()
        {
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "ResumoPlanoCuidados");
            return View();
        } 

        //
        // POST: /Oxigenacao/Create

        [HttpPost]
        public ActionResult Create(tb_oxiginecao tb_oxiginecao)
        {
            if (ModelState.IsValid)
            {
                db.tb_oxiginecao.AddObject(tb_oxiginecao);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "ResumoPlanoCuidados", tb_oxiginecao.IdConsultaVariavel);
            return View(tb_oxiginecao);
        }
        
        //
        // GET: /Oxigenacao/Edit/5
 
        public ActionResult Edit(long id)
        {
            tb_oxiginecao tb_oxiginecao = db.tb_oxiginecao.Single(t => t.IdConsultaVariavel == id);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "ResumoPlanoCuidados", tb_oxiginecao.IdConsultaVariavel);
            return View(tb_oxiginecao);
        }

        //
        // POST: /Oxigenacao/Edit/5

        [HttpPost]
        public ActionResult Edit(tb_oxiginecao tb_oxiginecao)
        {
            if (ModelState.IsValid)
            {
                db.tb_oxiginecao.Attach(tb_oxiginecao);
                db.ObjectStateManager.ChangeObjectState(tb_oxiginecao, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "ResumoPlanoCuidados", tb_oxiginecao.IdConsultaVariavel);
            return View(tb_oxiginecao);
        }

        //
        // GET: /Oxigenacao/Delete/5
 
        public ActionResult Delete(long id)
        {
            tb_oxiginecao tb_oxiginecao = db.tb_oxiginecao.Single(t => t.IdConsultaVariavel == id);
            return View(tb_oxiginecao);
        }

        //
        // POST: /Oxigenacao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {            
            tb_oxiginecao tb_oxiginecao = db.tb_oxiginecao.Single(t => t.IdConsultaVariavel == id);
            db.tb_oxiginecao.DeleteObject(tb_oxiginecao);
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