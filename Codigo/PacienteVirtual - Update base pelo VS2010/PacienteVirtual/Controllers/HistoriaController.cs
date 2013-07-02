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
    public class HistoriaController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorHistoria gHistoria = GerenciadorHistoria.GetInstance();
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();

        //
        // GET: /Historica/

        public ViewResult Index()
        {
            return View(gHistoria.ObterTodos());
        }

        //
        // GET: /Historica/Details/5

        public ViewResult Details(long id)
        {
            return View(gHistoria.ObterPorIdCursoFixo(id));
        }

        //
        // GET: /Historica/Create

        public ActionResult Create()
        {
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");
            return View();
        } 

        //
        // POST: /Historica/Create

        [HttpPost]
        public ActionResult Create(HistoriaModel historiaModel)
        {
            if (ModelState.IsValid)
            {
                historiaModel.IdConsultaFixo = gHistoria.Inserir(historiaModel);
                return RedirectToAction("Index");  
            }

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", historiaModel.IdConsultaFixo);
            return View(historiaModel);
        }
        
        //
        // GET: /Historica/Edit/5
 
        public ActionResult Edit(long id)
        {
            HistoriaModel historiaModel = gHistoria.Obter(id);
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", historiaModel.IdConsultaFixo);

            return View(historiaModel);
        }

        //
        // POST: /Historica/Edit/5

        [HttpPost]
        public ActionResult Edit(HistoriaModel historiaModel)
        {
            if (ModelState.IsValid)
            {
                gHistoria.Atualizar(historiaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", historiaModel.IdConsultaFixo);
            return View(historiaModel);
        }

        //
        // GET: /Historica/Delete/5
 
        public ActionResult Delete(long id)
        {
             return View(gHistoria.Obter(id));
        }

        //
        // POST: /Historica/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gHistoria.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}