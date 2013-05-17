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
    public class ExperienciaMedicamentosController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorExperienciaMedicamentos gExpMedicamento = GerenciadorExperienciaMedicamentos.GetInstance();
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();

        //
        // GET: /ExperienciaMedicamentos/

        public ViewResult Index()
        {
            //var tb_experiencia_medicamentos = db.tb_experiencia_medicamentos.Include("tb_consulta_fixo").Include("tb_resposta").Include("tb_resposta1").Include("tb_resposta2").Include("tb_resposta3").Include("tb_resposta4").Include("tb_resposta5");
            return View(gExpMedicamento.ObterTodos());
        }

        //
        // GET: /ExperienciaMedicamentos/Details/5

        public ViewResult Details(long id)
        {
            //PacientePessoaTurmaE tb_experiencia_medicamentos = db.tb_experiencia_medicamentos.Single(t => t.IdConsultaFixo == id);
            return View(gExpMedicamento.Obter(id));
        }

        //
        // GET: /ExperienciaMedicamentos/Create

        public ActionResult Create()
        {
            //ViewBag.IdConsultaFixo = new SelectList(db.tb_consulta_fixo, "IdConsultaFixo", "IdConsultaFixo");

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");

            ViewBag.IdRespostaEsperaTratamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta");
            ViewBag.IdRespostaPreocupacoes = new SelectList(db.tb_resposta, "IdResposta", "Resposta");
            ViewBag.IdRespostaGrauEntendimento = new SelectList(db.tb_resposta, "IdResposta", "Resposta");
            ViewBag.IdRespostaCultural = new SelectList(db.tb_resposta, "IdResposta", "Resposta");
            ViewBag.IdRespostaComportamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta");
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(db.tb_resposta, "IdResposta", "Resposta");
            return View();
        } 

        //
        // POST: /ExperienciaMedicamentos/Create

        [HttpPost]
        public ActionResult Create(ExperienciaMedicamentosModel expMedicamento)
        {
            if (ModelState.IsValid)
            {
                
                gExpMedicamento.Inserir(expMedicamento);
                return RedirectToAction("Index");  
            }

            ViewBag.IdConsultaFixo = new SelectList(db.tb_consulta_fixo, "IdConsultaFixo", "IdConsultaFixo", expMedicamento.IdConsultaFixo);
            ViewBag.IdRespostaEsperaTratamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaEsperaTratamento);
            ViewBag.IdRespostaPreocupacoes = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaPreocupacoes);
            ViewBag.IdRespostaGrauEntendimento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaGrauEntendimento);
            ViewBag.IdRespostaCultural = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaCultural);
            ViewBag.IdRespostaComportamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaComportamento);
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaIncorporadoPlano);
            return View(expMedicamento);
        }
        
        //
        // GET: /ExperienciaMedicamentos/Edit/5
 
        public ActionResult Edit(long id)
        {
            //ExperienciaMedicamentosE tb_experiencia_medicamentos = db.tb_experiencia_medicamentos.Single(t => t.IdConsultaFixo == id);

            ExperienciaMedicamentosModel expMedicamento = gExpMedicamento.Obter(id);

            ViewBag.IdConsultaFixo = new SelectList(db.tb_consulta_fixo, "IdConsultaFixo", "IdConsultaFixo", expMedicamento.IdConsultaFixo);
            ViewBag.IdRespostaEsperaTratamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaEsperaTratamento);
            ViewBag.IdRespostaPreocupacoes = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaPreocupacoes);
            ViewBag.IdRespostaGrauEntendimento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaGrauEntendimento);
            ViewBag.IdRespostaCultural = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaCultural);
            ViewBag.IdRespostaComportamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaComportamento);
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaIncorporadoPlano);
            return View(expMedicamento);
        }

        //
        // POST: /ExperienciaMedicamentos/Edit/5

        [HttpPost]
        public ActionResult Edit(ExperienciaMedicamentosModel expMedicamento)
        {
            if (ModelState.IsValid)
            {
                //db.tb_experiencia_medicamentos.Attach(tb_experiencia_medicamentos);
                //db.ObjectStateManager.ChangeObjectState(tb_experiencia_medicamentos, EntityState.Modified);
                //db.SaveChanges();

                gExpMedicamento.Atualizar(expMedicamento);

                return RedirectToAction("Index");
            }
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");

            ViewBag.IdRespostaEsperaTratamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaEsperaTratamento);
            ViewBag.IdRespostaPreocupacoes = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaPreocupacoes);
            ViewBag.IdRespostaGrauEntendimento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaGrauEntendimento);
            ViewBag.IdRespostaCultural = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaCultural);
            ViewBag.IdRespostaComportamento = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaComportamento);
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(db.tb_resposta, "IdResposta", "Resposta", expMedicamento.IdRespostaIncorporadoPlano);
            return View(expMedicamento);
        }

        //
        // GET: /ExperienciaMedicamentos/Delete/5
 
        public ActionResult Delete(long id)
        {
            //ExperienciaMedicamentosE tb_experiencia_medicamentos = db.tb_experiencia_medicamentos.Single(t => t.IdConsultaFixo == id);
            return View(gExpMedicamento.Obter(id));
        }

        //
        // POST: /ExperienciaMedicamentos/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            //ExperienciaMedicamentosE tb_experiencia_medicamentos = db.tb_experiencia_medicamentos.Single(t => t.IdConsultaFixo == id);
            //db.tb_experiencia_medicamentos.DeleteObject(tb_experiencia_medicamentos);
            //db.SaveChanges();
            gExpMedicamento.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}