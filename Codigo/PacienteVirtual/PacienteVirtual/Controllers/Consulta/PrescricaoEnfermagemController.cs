using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class PrescricaoEnfermagemController : Controller
    {
        [HttpPost]
        public ActionResult Adicionar(PrescricaoEnfermagemModel prescricaoEnfermagem)
        {
            if (ModelState.IsValid)
            {
                GerenciadorPrescricaoEnfermagem.GetInstance().Inserir(prescricaoEnfermagem);
                SessionController.ListaPrescricaoEnfermagem = null;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        public ViewResult Index()
        {
            return View(GerenciadorPrescricaoEnfermagem.GetInstance().ObterPorConsultaDiagnostico(
                SessionController.ConsultaVariavel.IdConsultaVariavel, SessionController.IdDiagnostico));
        }

        // Delete
        public ActionResult Delete(long idPrescricaoEnfermagem)
        {
            GerenciadorPrescricaoEnfermagem.GetInstance().Remover(idPrescricaoEnfermagem);
            SessionController.ListaPrescricaoEnfermagem = null;
            return RedirectToAction("Edit2", "Consulta");
        }

        public ActionResult MarcarComoRealizado(long idPrescricaoEnfermagem)
        {
            PrescricaoEnfermagemModel prescricaoEnfermagem = GerenciadorPrescricaoEnfermagem.GetInstance().Obter(idPrescricaoEnfermagem);
            prescricaoEnfermagem.Realizada = true;
            GerenciadorPrescricaoEnfermagem.GetInstance().Atualizar(prescricaoEnfermagem);
            SessionController.ListaPrescricaoEnfermagem = null;
            return RedirectToAction("Edit2", "Consulta");
        }
    }
}
