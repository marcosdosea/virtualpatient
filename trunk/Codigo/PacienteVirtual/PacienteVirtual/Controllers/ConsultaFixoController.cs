using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ConsultaFixoController : Controller
    {
        private pvEntities db = new pvEntities();


        GerenciadorConsultaFixo gGerenciadorConsultaFixo = GerenciadorConsultaFixo.GetInstance();
       

        //
        // GET: /ConsultaFixo/

        public ViewResult Index()
        {
            return View(gGerenciadorConsultaFixo.ObterTodos());
        }

        //
        // GET: /Default1/Details/5

        public ViewResult Details(long id)
        {
            return View(gGerenciadorConsultaFixo.Obter(id));
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Default1/Create

        [HttpPost]
        public ActionResult Create(ConsultaFixoE consultafixoe)
        {
            if (ModelState.IsValid)
            {
                db.tb_consulta_fixo.AddObject(consultafixoe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(consultafixoe);
        }

        //
        // GET: /Default1/Edit/5

        public ActionResult Edit(long id)
        {
            ConsultaFixoE consultafixoe = db.tb_consulta_fixo.Single(c => c.IdConsultaFixo == id);
            return View(consultafixoe);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(ConsultaFixoE consultafixoe)
        {
            if (ModelState.IsValid)
            {
                db.tb_consulta_fixo.Attach(consultafixoe);
                db.ObjectStateManager.ChangeObjectState(consultafixoe, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(consultafixoe);
        }

        //
        // GET: /Default1/Delete/5

        public ActionResult Delete(long id)
        {
            ConsultaFixoE consultafixoe = db.tb_consulta_fixo.Single(c => c.IdConsultaFixo == id);
            return View(consultafixoe);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            ConsultaFixoE consultafixoe = db.tb_consulta_fixo.Single(c => c.IdConsultaFixo == id);
            db.tb_consulta_fixo.DeleteObject(consultafixoe);
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