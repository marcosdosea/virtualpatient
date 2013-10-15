using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio.Consulta;
using PacienteVirtual.Models.Consulta;

namespace PacienteVirtual.Controllers
{
    public class QueixaMedicamentoController : Controller
    {

        public static String Descricao { get; set; }
        public static int Id { get; set; }

        public ViewResult Index()
        {
            return View(GerenciadorQueixaMedicamento.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        //
        // POST: /MedicamentoPrescrito/Create

        [HttpPost]
        public ActionResult Create(QueixaMedicamentoModel queixaMedicamento)
        {
            if (ModelState.IsValid)
            {
                GerenciadorQueixaMedicamento.GetInstance().Inserir(queixaMedicamento);
                SessionController.ListaQueixaMedicamento = null;
            }
            return RedirectToAction("Edit2", "Consulta");
        }

        //
        // POST: /MedicamentoPrescrito/Delete/5
        //[HttpPost]
        public ActionResult Delete(long idConsultaVariavel, int idMedicamento, int idQueixa)
        {
            GerenciadorQueixaMedicamento.GetInstance().Remover(idConsultaVariavel, idMedicamento, idQueixa);
            SessionController.ListaQueixaMedicamento = null;
            return RedirectToAction("Edit2", "Consulta");
        }

        public void Teste(int idQueixa, String descricao)
        {
            Descricao = descricao;
            Id = idQueixa;
            return;
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
