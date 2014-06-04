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
            return View(gDiarioPessoal.Obter(SessionController.ConsultaVariavel.IdConsultaFixo));
        }

       
        //
        // POST: /DiarioPessoal/Create
        [HttpPost]
        public ActionResult Create(DiarioPessoalModel diarioPessoal)
        {
            SessionController.Abas2 = Global.abaDiarioPessoal;
            if (ModelState.IsValid)
            {
                ConsultaVariavelModel consultaOrdem1 = GerenciadorConsultaVariavel.GetInstance().ObterPrimeiraConsulta(SessionController.ConsultaVariavel.IdPessoa, 
                    SessionController.ConsultaVariavel.IdTurma, SessionController.ConsultaVariavel.IdPaciente);
                diarioPessoal.IdConsultaFixo = consultaOrdem1.IdConsultaFixo;
                gDiarioPessoal.Inserir(diarioPessoal);
                SessionController.ListaDiarioPessoal = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            else
            {
                GerenciadorDiarioPessoal.GetInstance().ValidarRespostasSelecionaveis(diarioPessoal.IdMedicamento, diarioPessoal.IdBebida);
            }
            return PartialView(diarioPessoal);
        }

        public ActionResult Edit(long idConsultaFixo, int idMedicamento)
        {
            DiarioPessoalModel diarioPessoal = GerenciadorDiarioPessoal.GetInstance().ObterPorMedicamento(idConsultaFixo, idMedicamento);
            ViewBag.IdBebida = new SelectList(SessionController.ListaBebidas, "IdBebida", "Nome");
            SessionController.Abas2 = Global.abaDiarioPessoal;
            return View(diarioPessoal);
        }

        // POST: /Escolaridade/Edit/5

        [HttpPost]
        public ActionResult Edit(DiarioPessoalModel diarioPessoal)
        {
            SessionController.Abas2 = Global.abaDiarioPessoal;
            if (ModelState.IsValid)
            {
                GerenciadorDiarioPessoal.GetInstance().Atualizar(diarioPessoal);
                SessionController.ListaDiarioPessoal = null;
                return RedirectToAction("Edit2", "Consulta");
            }
            return View(diarioPessoal);
        }

        //
        // POST: /DiarioPessoal/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaFixo, int idMedicamento, string horario, string quantidade)
        {
            gDiarioPessoal.Remover(idConsultaFixo, idMedicamento, horario, quantidade);
            SessionController.ListaDiarioPessoal = null;
            SessionController.Abas2 = Global.abaDiarioPessoal;
            return RedirectToAction("Edit2", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}