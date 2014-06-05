using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class CirculacaoController : Controller
    {
        GerenciadorCirculacao gCirculacao = GerenciadorCirculacao.GetInstance();

        //
        // POST: /Circulacao/Edit/5
        [HttpPost]
        public ActionResult Edit(CirculacaoModel circulacao)
        {
            if (ModelState.IsValid)
            {
                gCirculacao.Atualizar(circulacao);
                SessionController.Circulacao = circulacao;
            }
            //SessionController.Abas1 = Global.abaComunicacao;
            return RedirectToAction("Edit", "Consulta");
        }


    }
}
