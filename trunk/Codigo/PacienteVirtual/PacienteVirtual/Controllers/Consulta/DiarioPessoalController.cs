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
    public class DiarioPessoalController : Controller
    {
   
        private GerenciadorDiarioPessoal gDiarioPessoal = GerenciadorDiarioPessoal.GetInstance();
        
        //
        // GET: /DiarioPessoal/
        public ViewResult Index()
        {
            return View(gDiarioPessoal.Obter(SessionController.IdConsultaFixo));
        }

        public ActionResult Create()
        {
            ViewBag.IdMedicamento = new SelectList(GerenciadorMedicamentos.GetInstance().ObterTodos().ToList(), "IdMedicamento", "MedicamentoNome");
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "NomeBebida");
            return PartialView();
        }

        //
        // POST: /DiarioPessoal/Create
        [HttpPost]
        public ActionResult Create(DiarioPessoalModel diarioPessoal)
        {
            if (ModelState.IsValid)
            {
                gDiarioPessoal.Inserir(diarioPessoal);
                List<DiarioPessoalModel> listaDiarioPessoal = new List<DiarioPessoalModel>(SessionController.ListaDiarioPessoal);
                listaDiarioPessoal.Add(diarioPessoal);
                SessionController.ListaDiarioPessoal = listaDiarioPessoal;
                return RedirectToAction("Edit", "Consulta");
            }
            return PartialView(diarioPessoal);
        }

        //
        // POST: /DiarioPessoal/Delete/5
        [HttpPost]
        public ActionResult Delete(long idConsultaFixo, int idMedicamento)
        {
            gDiarioPessoal.Remover(idConsultaFixo, idMedicamento);
            SessionController.ListaDiarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(idConsultaFixo);
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}