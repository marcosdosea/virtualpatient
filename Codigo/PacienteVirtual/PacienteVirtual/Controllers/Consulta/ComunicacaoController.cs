﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{
    public class ComunicacaoController : Controller
    {
        GerenciadorComunicacao gComunicacao = GerenciadorComunicacao.GetInstance();

        //
        // POST: /Comunicacao/Edit/5
        [HttpPost]
        public ActionResult Edit(ComunicacaoModel comunicacao)
        {
            SessionController.Abas1 = Global.abaPsicossociais;
            SessionController.AbasDentro = Global.abaComunicacao;
            if (ModelState.IsValid)
            {
                gComunicacao.Atualizar(comunicacao);
                SessionController.Comunicacao = comunicacao;
            }
            return RedirectToAction("Edit", "Consulta");
        }

    }
}
