using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers.Consulta
{ 
    public class EliminacaoController : Controller
    {
        private GerenciadorEliminacao gEliminacao = GerenciadorEliminacao.GetInstance(); 

        [HttpPost]
        public ActionResult Edit(EliminacaoModel eliminacao)
        {
            if (ModelState.IsValid)
            {
                gEliminacao.Atualizar(eliminacao);
                SessionController.Eliminacao = eliminacao;
            }
            SessionController.Abas1 = Global.abaPsicobiologicas;
            SessionController.AbasDentro = Global.abaEliminacao;
            return RedirectToAction("Edit", "Consulta");
        }
    }
}