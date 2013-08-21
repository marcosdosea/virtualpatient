using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{ 
    public class ConsultaVariavelQueixaController : Controller
    {

       GerenciadorConsultaVariavelQueixa gConsultaVariavelQueixa = GerenciadorConsultaVariavelQueixa.GetInstance();
       GerenciadorAcaoQueixa gAcaoQueixa = GerenciadorAcaoQueixa.GetInstance();
       GerenciadorConsultaVariavel gConsultaVariavel = GerenciadorConsultaVariavel.GetInstance();
       GerenciadorQueixa gQueixa = GerenciadorQueixa.GetInstance();
        //
        // GET: /ConsultaVariavelQueixa/

        public ViewResult Index()
        {

            return View(gConsultaVariavelQueixa.ObterTodos());
        }

        //
        // GET: /ConsultaVariavelQueixa/Details/5

        public ViewResult Details(long id, int idQueixa)
        {
            return View(gConsultaVariavelQueixa.Obter(id, idQueixa));
        }

        //
        // GET: /ConsultaVariavelQueixa/Create

        public ActionResult Create()
        {
            ViewBag.IdAcaoQueixa = new SelectList(gQueixa.ObterTodos(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdConsultaVariavel = new SelectList(gConsultaVariavel.ObterTodos(), "IdConsultaVariavel", "Lembretes");
            ViewBag.IdQueixa = new SelectList(gQueixa.ObterTodos(), "IdQueixa", "DescricaoQueixa");
            return View();
        } 

        //
        // POST: /ConsultaVariavelQueixa/Create

        [HttpPost]
        public ActionResult Create(ConsultaVariavelQueixaModel consultavariavelqueixamodel)
        {
            if (ModelState.IsValid)
            {
                gConsultaVariavelQueixa.Inserir(consultavariavelqueixamodel);
                return RedirectToAction("Index");  
            }

            ViewBag.IdAcaoQueixa = new SelectList(gQueixa.ObterTodos(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdConsultaVariavel = new SelectList(gConsultaVariavel.ObterTodos(), "IdConsultaVariavel", "Lembretes");
            ViewBag.IdQueixa = new SelectList(gQueixa.ObterTodos(), "IdQueixa", "DescricaoQueixa");
            return View(consultavariavelqueixamodel);
        }
        
        //
        // GET: /ConsultaVariavelQueixa/Edit/5
 
        public ActionResult Edit(long id, int idQueixa)
        {

            ViewBag.IdAcaoQueixa = new SelectList(gQueixa.ObterTodos(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdConsultaVariavel = new SelectList(gConsultaVariavel.ObterTodos(), "IdConsultaVariavel", "Lembretes");
            ViewBag.IdQueixa = new SelectList(gQueixa.ObterTodos(), "IdQueixa", "DescricaoQueixa");
            return View(gConsultaVariavelQueixa.Obter(id, idQueixa));
        }

        //
        // POST: /ConsultaVariavelQueixa/Edit/5

        [HttpPost]
        public ActionResult Edit(ConsultaVariavelQueixaModel consultavariavelqueixaModel)
        {
            if (ModelState.IsValid)
            {
                gConsultaVariavelQueixa.Atualizar(consultavariavelqueixaModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdAcaoQueixa = new SelectList(gQueixa.ObterTodos(), "IdAcaoQueixa", "DescricaoAcao");
            ViewBag.IdConsultaVariavel = new SelectList(gConsultaVariavel.ObterTodos(), "IdConsultaVariavel", "Lembretes");
            ViewBag.IdQueixa = new SelectList(gQueixa.ObterTodos(), "IdQueixa", "DescricaoQueixa");
            return View(consultavariavelqueixaModel);
        }

        //
        // GET: /ConsultaVariavelQueixa/Delete/5

        public ActionResult Delete(long id, int idQueixa)
        {
            return View(gConsultaVariavelQueixa.Obter(id, idQueixa));
        }

        //
        // POST: /ConsultaVariavelQueixa/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id, int idQueixa)
        {
            gConsultaVariavelQueixa.Remover(id, idQueixa);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}