using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class TermorregulacaoController : Controller
    {
        GerenciadorTermorregulacao gTermorregulacao = GerenciadorTermorregulacao.GetInstance();

        //
        // POST: /Termorregulacao/Edit/5
        [HttpPost]
        public ActionResult Edit(TermorregulacaoModel Termorregulacao)
        {
            if (ModelState.IsValid)
            {
                gTermorregulacao.Atualizar(Termorregulacao);
                SessionController.Termorregulacao = Termorregulacao;
            }
            SessionController.Abas1 = Global.abaPsicobiologicas;
            SessionController.AbasDentro = Global.abaTermorregulacao;
            return RedirectToAction("Edit", "Consulta");
        }
    }
}