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
    public class UsuarioController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /Usuario/

        public ViewResult Index()
        {
            return View(db.tb_usuario.ToList());
        }

        //
        // GET: /Usuario/Details/5

        public ViewResult Details(int id)
        {
            UsuarioE usuarioe = db.tb_usuario.Single(u => u.IdUsuario == id);
            return View(usuarioe);
        }

        //
        // GET: /Usuario/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Usuario/Create

        [HttpPost]
        public ActionResult Create(UsuarioE usuarioe)
        {
            if (ModelState.IsValid)
            {
                db.tb_usuario.AddObject(usuarioe);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(usuarioe);
        }
        
        //
        // GET: /Usuario/Edit/5
 
        public ActionResult Edit(int id)
        {
            UsuarioE usuarioe = db.tb_usuario.Single(u => u.IdUsuario == id);
            return View(usuarioe);
        }

        //
        // POST: /Usuario/Edit/5

        [HttpPost]
        public ActionResult Edit(UsuarioE usuarioe)
        {
            if (ModelState.IsValid)
            {
                db.tb_usuario.Attach(usuarioe);
                db.ObjectStateManager.ChangeObjectState(usuarioe, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(usuarioe);
        }

        //
        // GET: /Usuario/Delete/5
 
        public ActionResult Delete(int id)
        {
            UsuarioE usuarioe = db.tb_usuario.Single(u => u.IdUsuario == id);
            return View(usuarioe);
        }

        //
        // POST: /Usuario/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id) 
        {            
            UsuarioE usuarioe = db.tb_usuario.Single(u => u.IdUsuario == id);
            db.tb_usuario.DeleteObject(usuarioe);
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