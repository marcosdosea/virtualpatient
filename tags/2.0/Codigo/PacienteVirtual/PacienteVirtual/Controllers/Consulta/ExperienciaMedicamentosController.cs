using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ExperienciaMedicamentosController : Controller
    {
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
            else
            {
                GerenciadorExperienciaMedicamentos.GetInstance().ValidarRespostasSelecionaveis(expMedicamento.IdRespostaComportamento, expMedicamento.IdRespostaCultural, expMedicamento.IdRespostaEsperaTratamento, expMedicamento.IdRespostaGrauEntendimento, expMedicamento.IdRespostaIncorporadoPlano, expMedicamento.IdRespostaPreocupacoes);
            }
            SessionController.Abas1 = Global.abaExpMed;
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}