using System.Collections.Generic;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class DiarioPessoalController : Controller
    {
   
        private GerenciadorDiarioPessoal gDiarioPessoal = GerenciadorDiarioPessoal.GetInstance();

        //
        // GET: /DiarioPessoal/

        public ViewResult Index()
        {
            return View(gDiarioPessoal.Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }

       
        //
        // POST: /DiarioPessoal/Create
        [HttpPost]
        public ActionResult Create(DiarioPessoalModel diarioPessoal)
        {
            if (ModelState.IsValid)
            {
                ConsultaVariavelModel consultaOrdem1 = GerenciadorConsultaVariavel.GetInstance().ObterPrimeiraConsulta(SessionController.Pessoa.IdPessoa
                    , SessionController.DadosTurmaPessoa.IdTurma, SessionController.Paciente.IdPaciente);
                diarioPessoal.IdConsultaFixo = consultaOrdem1.IdConsultaFixo;
                gDiarioPessoal.Inserir(diarioPessoal);
                SessionController.ListaDiarioPessoal = null;

                SessionController.Abas2 = 4;
                return RedirectToAction("Edit2", "Consulta");
            }
            SessionController.Abas2 = 4;
            return PartialView(diarioPessoal);
        }

        public ActionResult Edit(long idConsultaFixo, int idMedicamento)
        {
            DiarioPessoalModel diarioPessoal = GerenciadorDiarioPessoal.GetInstance().ObterPorMedicamento(idConsultaFixo, idMedicamento);
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "Nome");
            SessionController.Abas2 = 4;
            return View(diarioPessoal);
        }

        // POST: /Escolaridade/Edit/5

        [HttpPost]
        public ActionResult Edit(DiarioPessoalModel diarioPessoal)
        {
            if (ModelState.IsValid)
            {
                GerenciadorDiarioPessoal.GetInstance().Atualizar(diarioPessoal);
                SessionController.ListaDiarioPessoal = null;
                SessionController.Abas2 = 4;
                return RedirectToAction("Edit2", "Consulta");
            }
            SessionController.Abas2 = 4;
            return View(diarioPessoal);
        }

        //
        // POST: /DiarioPessoal/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaFixo, int idMedicamento, string horario, string quantidade)
        {
            gDiarioPessoal.Remover(idConsultaFixo, idMedicamento, horario, quantidade);
            SessionController.ListaDiarioPessoal = null;

            SessionController.Abas2 = 4;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}