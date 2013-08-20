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
    public class PacientePessoaTurmaController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorPacientePessoaTurma gPacPessTurma = GerenciadorPacientePessoaTurma.GetInstance();
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();

        //
        // GET: /PacientePessoaTurma/

        public ViewResult Index()
        {
            return View();
        }

        //
        // GET: /PacientePessoaTurma/Details/5

       public ViewResult Details(int id)// passar três tipos de Id
        {
            return null;
        }

        //
        // GET: /PacientePessoaTurma/Create

        public ActionResult Create()
        {
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes");
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome");
            return View();
        } 

        //
        // POST: /PacientePessoaTurma/Create

        [HttpPost]
        public ActionResult Create(PacientePessoaTurmaModel pacPessTurma)
        {
            if (ModelState.IsValid)
            {
                return RedirectToAction("Index");  
            }

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", pacPessTurma.IdConsultaFixo);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes", pacPessTurma.IdConsultaVariavel);
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome", pacPessTurma.IdPaciente);
            
            return View(pacPessTurma);
        }
        
        //
        // GET: /PacientePessoaTurma/Edit/5
 
        public ActionResult Edit(int id)
        {
            PacientePessoaTurmaModel pacPessTurma = null;

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", pacPessTurma.IdConsultaFixo);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes", pacPessTurma.IdConsultaVariavel);
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome", pacPessTurma.IdPaciente);
            return View(pacPessTurma.IdPaciente);
        }

        //
        // POST: /PacientePessoaTurma/Edit/5

        [HttpPost]
        public ActionResult Edit(PacientePessoaTurmaModel pacPessTurma)
        {
            if (ModelState.IsValid)
            {
                return RedirectToAction("Index");
            }
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", pacPessTurma.IdConsultaFixo);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes", pacPessTurma.IdConsultaVariavel);
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome", pacPessTurma.IdPaciente);
            return View(pacPessTurma);
        }

        //
        // GET: /PacientePessoaTurma/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /PacientePessoaTurma/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}