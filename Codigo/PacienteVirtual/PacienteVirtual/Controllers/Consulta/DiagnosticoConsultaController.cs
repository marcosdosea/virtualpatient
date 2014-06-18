using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DiagnosticoConsultaController : Controller
    {
        
        public ViewResult Index()
        {
            return View(GerenciadorDiagnosticoConsulta.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        //
        // POST: /DiagnosticoConsulta/Create

        [HttpPost]
        public ActionResult Create(DiagnosticoConsultaModel diagnostico)
        {
            if (ModelState.IsValid)
            {
                diagnostico.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel;
                GerenciadorDiagnosticoConsulta.GetInstance().Inserir(diagnostico);
                SessionController.ListaDiagnostico = null;
                SessionController.IdGrupoDiagnostico = Global.ValorInteiroNulo;
            }
            else
            {
                if (GerenciadorDiagnosticoConsulta.GetInstance().ValidarRespostasSelecionaveis(diagnostico.IdDiagnostico, diagnostico.IdGrupoDiagnostico))
                {
                    SessionController.IdGrupoDiagnostico = diagnostico.IdGrupoDiagnostico;
                }
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        // POST: /DiagnosticoConsulta/Edit
        public ActionResult Edit(long idConsultaVariavel, int idDiagnostico)
        {
            DiagnosticoConsultaModel diagnostico = GerenciadorDiagnosticoConsulta.GetInstance().ObterPorConsultaDiagnostico(idConsultaVariavel, idDiagnostico);
            ViewBag.IdDiagnostico = new SelectList(GerenciadorEspecialidade.GetInstance().ObterTodos(), "IdDiagnostico", "DescricaoDiagnostico");
            ViewBag.IdGrupoDiagnostico = new SelectList(GerenciadorGrupoDiagnostico.GetInstance().ObterTodos().ToList(), "IdGrupoDiagnostico", "DescricaoGrupoDiagnostico", SessionController.IdGrupoDiagnostico);
            return View(diagnostico);
        }

        // POST: /DiagnosticoConsulta/Edit/5

        [HttpPost]
        public ActionResult Edit(DiagnosticoConsultaModel diagnostico)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDiagnosticoConsulta.GetInstance().Atualizar(diagnostico);
                SessionController.ListaDiagnostico = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            return View(diagnostico);
        }

        //
        // POST: /DiagnosticoConsulta/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idDiagnostico)
        {
            GerenciadorDiagnosticoConsulta.GetInstance().Remover(idConsultaVariavel, idDiagnostico);
            SessionController.ListaDiagnostico = null;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}