using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ExperienciaMedicamentosController : Controller
    {
        const int PERGUNTA_ESPERA_TRATAMENTO = 2;
        const int PERGUNTA_PREOCUPACOES = 3;
        const int PERGUNTA_GRAU_ENTENDIMENTO = 4;
        const int PERGUNTA_CULTURAL = 5;
        const int PERGUNTA_COMPORTAMENTO = 6;
        const int PERGUNTA_INCORPORADO_PLANO = 7;

        GerenciadorExperienciaMedicamentos gExpMedicamento = GerenciadorExperienciaMedicamentos.GetInstance();
        GerenciadorResposta gResposta = GerenciadorResposta.GetInstance();
        
        
        //
        // POST: /ExperienciaMedicamentos/Edit/5

        [HttpPost]
        public ActionResult Edit(ExperienciaMedicamentosModel expMedicamento)
        {
            if (ModelState.IsValid)
            {
                gExpMedicamento.Atualizar(expMedicamento);
                SessionController.ExperienciaMedicamentos = expMedicamento;
            }
            SessionController.Abas1 = 3;
            SessionController.Abas2 = 0;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}