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
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();

        //
        // GET: /ExperienciaMedicamentos/

        public ViewResult Index()
        {
            return View(gExpMedicamento.ObterTodos());
        }

        //
        // GET: /ExperienciaMedicamentos/Details/5

        public ViewResult Details(long id)
        {
            return View(gExpMedicamento.Obter(id));
        }

        //
        // GET: /ExperienciaMedicamentos/Create

        public ActionResult Create()
        {
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");

            ViewBag.IdRespostaEsperaTratamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaPreocupacoes = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaGrauEntendimento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaCultural = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaComportamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta");
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

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", expMedicamento.IdConsultaFixo);
            ViewBag.IdRespostaEsperaTratamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaEsperaTratamento);
            ViewBag.IdRespostaPreocupacoes = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaPreocupacoes);
            ViewBag.IdRespostaGrauEntendimento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaGrauEntendimento);
            ViewBag.IdRespostaCultural = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaCultural);
            ViewBag.IdRespostaComportamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaComportamento);
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaIncorporadoPlano);
            return View(expMedicamento);
        }
        
        //
        // GET: /ExperienciaMedicamentos/Edit/5
 
        public ActionResult Edit(long id)
        {
            ExperienciaMedicamentosModel expMedicamento = gExpMedicamento.Obter(id);

            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", expMedicamento.IdConsultaFixo);
            ViewBag.IdRespostaEsperaTratamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaEsperaTratamento);
            ViewBag.IdRespostaPreocupacoes = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaPreocupacoes);
            ViewBag.IdRespostaGrauEntendimento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaGrauEntendimento);
            ViewBag.IdRespostaCultural = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaCultural);
            ViewBag.IdRespostaComportamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaComportamento);
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaIncorporadoPlano);
            return View(expMedicamento);
        }

        //
        // POST: /ExperienciaMedicamentos/Edit/5

        [HttpPost]
        public ActionResult Edit(ExperienciaMedicamentosModel expMedicamento)
        {
            if (ModelState.IsValid)
            {
                gExpMedicamento.Atualizar(expMedicamento);

                return RedirectToAction("Index");
            }
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo");

            ViewBag.IdRespostaEsperaTratamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaEsperaTratamento);
            ViewBag.IdRespostaPreocupacoes = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaPreocupacoes);
            ViewBag.IdRespostaGrauEntendimento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaGrauEntendimento);
            ViewBag.IdRespostaCultural = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaCultural);
            ViewBag.IdRespostaComportamento = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaComportamento);
            ViewBag.IdRespostaIncorporadoPlano = new SelectList(gResposta.ObterTodos().ToList(), "IdResposta", "Resposta", expMedicamento.IdRespostaIncorporadoPlano);
            return View(expMedicamento);
        }

        //
        // GET: /ExperienciaMedicamentos/Delete/5
 
        public ActionResult Delete(long id)
        {
            return View(gExpMedicamento.Obter(id));
        }

        //
        // POST: /ExperienciaMedicamentos/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
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