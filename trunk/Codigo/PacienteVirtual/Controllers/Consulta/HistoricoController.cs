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
    public class HistoricoController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorHistorico gHistorico = GerenciadorHistorico.GetInstance();
        //
        // GET: /Historico/

        public ViewResult Index()
        {
            return View(gHistorico.ObterTodos());
        }

        //
        // GET: /Historico/Details/5

        public ViewResult Details(long id)
        {
            return View(gHistorico.Obter(id));
        }

        //
        // GET: /Historico/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Historico/Create

        [HttpPost]
        public ActionResult Create(HistoricoModel historicoModel)
        {
            if (ModelState.IsValid)
            {

                historicoModel.IdHistorico = gHistorico.Inserir(historicoModel);
                return RedirectToAction("Index");  
            }

            return View(historicoModel);
        }
        
        //
        // GET: /Historico/Edit/5
 
        public ActionResult Edit(long id)
        {
            return View(gHistorico.Obter(id));
        }

        //
        // POST: /Historico/Edit/5

        [HttpPost]
        public ActionResult Edit(HistoricoModel historicoModel)
        {
            if (ModelState.IsValid)
            {
                gHistorico.Atualizar(historicoModel);
                return RedirectToAction("Index");
            }
            return View(historicoModel);
        }

        //
        // GET: /Historico/Delete/5
 
        public ActionResult Delete(long id)
        {
            return View(gHistorico.Obter(id));
        }

        //
        // POST: /Historico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gHistorico.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            
            base.Dispose(disposing);
        }
    }
}