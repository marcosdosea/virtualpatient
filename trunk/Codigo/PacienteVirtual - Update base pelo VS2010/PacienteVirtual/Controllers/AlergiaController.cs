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
    [Authorize(Roles = "administrador, tutor")]
    public class AlergiaController : Controller
    {
        GerenciadorAlergia gAlergia = GerenciadorAlergia.GetInstance();
        //
        // GET: /Alergia/

        public ViewResult Index()
        {
            return View(gAlergia.ObterTodos());
        }

        //
        // GET: /Alergia/Details/5

        public ViewResult Details(int id)
        {
            
            return View(gAlergia.Obter(id));
        }

        //
        // GET: /Alergia/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Alergia/Create

        [HttpPost]
        public ActionResult Create(AlergiaModel alergia)
        {
            if (ModelState.IsValid)
            {

                alergia.IdAlergia = gAlergia.Inserir(alergia);

                return RedirectToAction("Index");  
            }

            return View(alergia);
        }
        
        //
        // GET: /Alergia/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View(gAlergia.Obter(id));
        }

        //
        // POST: /Alergia/Edit/5

        [HttpPost]
        public ActionResult Edit(AlergiaModel alergia)
        {
            if (ModelState.IsValid)
            {
                gAlergia.Atualizar(alergia);
                return RedirectToAction("Index");
            }
            return View(alergia);
        }

        //
        // GET: /Alergia/Delete/5
 
        public ActionResult Delete(int id)
        {
            
            return View(gAlergia.Obter(id));
        }

        //
        // POST: /Alergia/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gAlergia.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}