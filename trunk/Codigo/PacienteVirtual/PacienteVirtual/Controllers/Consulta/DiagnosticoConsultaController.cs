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
                //Verifica se foi selecionado algum diagnostico no combobox ou não.
                if (diagnostico.IdDiagnostico != 0)
                {
                    //Obtem o diagnostico na tb_diagnostico passado no combobox
                    DiagnosticoModel diagnoConsulta = GerenciadorDiagnostico.GetInstance().Obter(diagnostico.IdDiagnostico);
                    //verifica se o diagnostico que foi passado é de risco ou não.
                    if (diagnoConsulta.Risco == true)
                    {
                        //Session Controller para o risco do diagnostico, guardando se é de risco ou não.
                        SessionController.RiscoDiagnostico = true;
                    }
                    else
                    {
                        SessionController.RiscoDiagnostico = false;
                    }
                    SessionController.IdDiagnostico = diagnostico.IdDiagnostico;
                    return RedirectToAction("Edit2", "Consulta");
                }
                SessionController.IdGrupoDiagnostico = diagnostico.IdGrupoDiagnostico;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        // POST: /DiagnosticoConsulta/Edit
        public ActionResult Edit(long idConsultaVariavel, int idDiagnostico)
        {
            DiagnosticoConsultaModel diagnostico = GerenciadorDiagnosticoConsulta.GetInstance().ObterPorConsultaDiagnostico(idConsultaVariavel, idDiagnostico);
            DiagnosticoModel diagnoConsulta = GerenciadorDiagnostico.GetInstance().Obter(idDiagnostico);
            if (diagnoConsulta.Risco == true)
            {
                //Session Controller para o risco do diagnostico, guardando se é de risco ou não.
                SessionController.RiscoDiagnostico = true;
            }
            else
            {
                SessionController.RiscoDiagnostico = false;
            }
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
                SessionController.RiscoDiagnostico = false;
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