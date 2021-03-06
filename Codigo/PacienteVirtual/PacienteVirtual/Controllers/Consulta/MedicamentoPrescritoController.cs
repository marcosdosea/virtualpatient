﻿using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{                 
    public class MedicamentoPrescritoController : Controller
    {
        
        private GerenciadorMedicamentoPrescrito gMedicamentoPrescrito = GerenciadorMedicamentoPrescrito.GetInstance();
        
        //
        // GET: /MedicamentoPrescrito/

        public ViewResult Index()
        {
            return View(gMedicamentoPrescrito.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

        
        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(MedicamentoPrescritoModel medicamentoPrescrito)
        {
            if (ModelState.IsValid)
            {
                medicamentoPrescrito.IdConsultaVariavel = SessionController.ConsultaVariavel.IdConsultaVariavel; 
                gMedicamentoPrescrito.Inserir(medicamentoPrescrito);
                SessionController.ListaMedicamentosPrescritos = null;
            }
            else
            {
                GerenciadorMedicamentoPrescrito.GetInstance().ValidarRespostasSelecionaveis(medicamentoPrescrito.IdMedicamento);
            }
            SessionController.Abas1 = Global.abaMedPresc;
            return RedirectToAction("Edit", "Consulta");
        }

        public ActionResult Edit(long idConsultaVariavel, int idMedicamento)
        {
            MedicamentoPrescritoModel medicamentoPrescritoModel = GerenciadorMedicamentoPrescrito.GetInstance().ObterPorMedicamento(idConsultaVariavel, idMedicamento);
            SessionController.Abas1 = Global.abaMedPresc;
            return View(medicamentoPrescritoModel);
        }

        // POST: /Escolaridade/Edit/5

        [HttpPost]
        public ActionResult Edit(MedicamentoPrescritoModel medicamentoPrescrito)
        {
            SessionController.Abas1 = Global.abaMedPresc;
            if (ModelState.IsValid)
            {
                GerenciadorMedicamentoPrescrito.GetInstance().Atualizar(medicamentoPrescrito);
                SessionController.ListaMedicamentosPrescritos = null;
                return RedirectToAction("Edit", "Consulta");
            }
            return View(medicamentoPrescrito);
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento)
        {
            gMedicamentoPrescrito.Remover(idConsultaVariavel, idMedicamento);
            SessionController.ListaMedicamentosPrescritos = null;
            SessionController.Abas1 = Global.abaMedPresc;
            return RedirectToAction("Edit", "Consulta");
        }
      
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}