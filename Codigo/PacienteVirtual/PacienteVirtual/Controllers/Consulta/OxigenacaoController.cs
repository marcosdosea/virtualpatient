using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using System;
using System.Collections.Generic;

namespace PacienteVirtual.Controllers
{ 
    public class OxigenacaoController : Controller
    {
        GerenciadorOxigenacao gOxigenacao = GerenciadorOxigenacao.GetInstance();

        //
        // POST: /Oxigenacao/Edit/5
        [HttpPost]
        public ActionResult Edit(OxigenacaoModel oxigenacao)
        {
            if (ModelState.IsValid)
            {
                gOxigenacao.Atualizar(oxigenacao);
                SessionController.Oxigenacao = oxigenacao;
            }
            SessionController.Abas1 = Global.abaPsicobiologicas;
            SessionController.AbasDentro = Global.abaOxigenacao;
            return RedirectToAction("Edit", "Consulta");
        }
    }
}