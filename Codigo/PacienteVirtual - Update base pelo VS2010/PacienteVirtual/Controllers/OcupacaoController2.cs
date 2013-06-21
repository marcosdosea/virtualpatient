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
    public class OcupacaoController2 : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /OcupacaoController2/

        public ViewResult Index()
        {
            return View(db.tb_ocupacao.ToList());
        }

        //
        // GET: /OcupacaoController2/Details/5

        public ViewResult Details(int id)
        {
            OcupacaoE ocupacaoe = db.tb_ocupacao.Single(o => o.IdOcupacao == id);
            return View(ocupacaoe);
        }

        //
        // GET: /OcupacaoController2/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /OcupacaoController2/Create

        [HttpPost]
        public ActionResult Create(OcupacaoE ocupacaoe)
        {
            if (ModelState.IsValid)
            {
                db.tb_ocupacao.AddObject(ocupacaoe);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(ocupacaoe);
        }
        
        //
        // GET: /OcupacaoController2/Edit/5
 
        public ActionResult Edit(int id)
        {
            OcupacaoE ocupacaoe = db.tb_ocupacao.Single(o => o.IdOcupacao == id);
            return View(ocupacaoe);
        }

        //
        // POST: /OcupacaoController2/Edit/5

        [HttpPost]
        public ActionResult Edit(OcupacaoE ocupacaoe)
        {
            if (ModelState.IsValid)
            {
                db.tb_ocupacao.Attach(ocupacaoe);
                db.ObjectStateManager.ChangeObjectState(ocupacaoe, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ocupacaoe);
        }

        //
        // GET: /OcupacaoController2/Delete/5
 
        public ActionResult Delete(int id)
        {
            OcupacaoE ocupacaoe = db.tb_ocupacao.Single(o => o.IdOcupacao == id);
            return View(ocupacaoe);
        }

        //
        // POST: /OcupacaoController2/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            OcupacaoE ocupacaoe = db.tb_ocupacao.Single(o => o.IdOcupacao == id);
            db.tb_ocupacao.DeleteObject(ocupacaoe);
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