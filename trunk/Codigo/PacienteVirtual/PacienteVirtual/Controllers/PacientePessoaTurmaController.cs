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
    public class PacientePessoaTurmaController : Controller
    {
        private pvEntities db = new pvEntities();

        //
        // GET: /PacientePessoaTurma/

        public ViewResult Index()
        {
            var tb_paciente_pessoa_turma = db.tb_paciente_pessoa_turma.Include("tb_consulta_fixo").Include("tb_consulta_variavel").Include("tb_paciente");
            return View(tb_paciente_pessoa_turma.ToList());
        }

        //
        // GET: /PacientePessoaTurma/Details/5

        public ViewResult Details(int id)
        {
            tb_paciente_pessoa_turma tb_paciente_pessoa_turma = db.tb_paciente_pessoa_turma.Single(t => t.IdPessoa == id);
            return View(tb_paciente_pessoa_turma);
        }

        //
        // GET: /PacientePessoaTurma/Create

        public ActionResult Create()
        {
            ViewBag.IdConsutaFixo = new SelectList(db.tb_consulta_fixo, "IdConsutaFixo", "IdConsutaFixo");
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes");
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome");
            return View();
        } 

        //
        // POST: /PacientePessoaTurma/Create

        [HttpPost]
        public ActionResult Create(tb_paciente_pessoa_turma tb_paciente_pessoa_turma)
        {
            if (ModelState.IsValid)
            {
                db.tb_paciente_pessoa_turma.AddObject(tb_paciente_pessoa_turma);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.IdConsutaFixo = new SelectList(db.tb_consulta_fixo, "IdConsutaFixo", "IdConsutaFixo", tb_paciente_pessoa_turma.IdConsutaFixo);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes", tb_paciente_pessoa_turma.IdConsultaVariavel);
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome", tb_paciente_pessoa_turma.IdPaciente);
            return View(tb_paciente_pessoa_turma);
        }
        
        //
        // GET: /PacientePessoaTurma/Edit/5
 
        public ActionResult Edit(int id)
        {
            tb_paciente_pessoa_turma tb_paciente_pessoa_turma = db.tb_paciente_pessoa_turma.Single(t => t.IdPessoa == id);
            ViewBag.IdConsutaFixo = new SelectList(db.tb_consulta_fixo, "IdConsutaFixo", "IdConsutaFixo", tb_paciente_pessoa_turma.IdConsutaFixo);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes", tb_paciente_pessoa_turma.IdConsultaVariavel);
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome", tb_paciente_pessoa_turma.IdPaciente);
            return View(tb_paciente_pessoa_turma);
        }

        //
        // POST: /PacientePessoaTurma/Edit/5

        [HttpPost]
        public ActionResult Edit(tb_paciente_pessoa_turma tb_paciente_pessoa_turma)
        {
            if (ModelState.IsValid)
            {
                db.tb_paciente_pessoa_turma.Attach(tb_paciente_pessoa_turma);
                db.ObjectStateManager.ChangeObjectState(tb_paciente_pessoa_turma, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdConsutaFixo = new SelectList(db.tb_consulta_fixo, "IdConsutaFixo", "IdConsutaFixo", tb_paciente_pessoa_turma.IdConsutaFixo);
            ViewBag.IdConsultaVariavel = new SelectList(db.tb_consulta_variavel, "IdConsultaVariavel", "Lembretes", tb_paciente_pessoa_turma.IdConsultaVariavel);
            ViewBag.IdPaciente = new SelectList(db.tb_paciente, "IdPaciente", "Nome", tb_paciente_pessoa_turma.IdPaciente);
            return View(tb_paciente_pessoa_turma);
        }

        //
        // GET: /PacientePessoaTurma/Delete/5
 
        public ActionResult Delete(int id)
        {
            tb_paciente_pessoa_turma tb_paciente_pessoa_turma = db.tb_paciente_pessoa_turma.Single(t => t.IdPessoa == id);
            return View(tb_paciente_pessoa_turma);
        }

        //
        // POST: /PacientePessoaTurma/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tb_paciente_pessoa_turma tb_paciente_pessoa_turma = db.tb_paciente_pessoa_turma.Single(t => t.IdPessoa == id);
            db.tb_paciente_pessoa_turma.DeleteObject(tb_paciente_pessoa_turma);
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