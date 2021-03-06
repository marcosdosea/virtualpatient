﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class PsicoEspiritualController : Controller
    {
        //
        // POST: /PsicoEspiritual/Create

        [HttpPost]
        public ActionResult Edit(PsicoEspiritualModel psicoEspiritualModel)
        {
            SessionController.Abas1 = Global.abaPsicoespiritual;
            SessionController.AbasDentro = Global.ValorInteiroNulo;
            if (ModelState.IsValid)
            {
                GerenciadorPsicoEspiritual.GetInstance().Atualizar(psicoEspiritualModel);
                SessionController.PsicoEspiritual = psicoEspiritualModel;
            }
            return RedirectToAction("Edit", "Consulta");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
