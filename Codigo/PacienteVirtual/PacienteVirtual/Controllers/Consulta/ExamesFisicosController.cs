﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio.Consulta;
using PacienteVirtual.Models.Consulta;

namespace PacienteVirtual.Controllers.Consulta
{ 
    public class ExamesFisicosController : Controller
    {
       
        //
        // POST: /ExamesFisicos/Create

        [HttpPost]
        public ActionResult Edit(ExamesFisicosModel examesFisicosModel)
        {
            if (ModelState.IsValid)
            {
                GerenciadorExamesFisicos.GetInstance().Atualizar(examesFisicosModel);
                SessionController.ExamesFisicos = examesFisicosModel;
            }
            SessionController.Abas2 = 5;
            return RedirectToAction("Edit", "Consulta");
        }

        [HttpPost]
        public ActionResult AdicionarAlergia(AlergiaExamesFisicosModel alergiaExamesFisicosModel)
        {
            if(ModelState.IsValid)
            {
                ExamesFisicosModel efm = GerenciadorExamesFisicos.GetInstance().Obter(alergiaExamesFisicosModel.IdConsultaVariavel);
                GerenciadorExamesFisicos.GetInstance().InserirAlergia(efm, alergiaExamesFisicosModel.IdAlergia);
                SessionController.ListaAlergia = null;
            }
            SessionController.Abas2 = 5;
            return RedirectToAction("Edit", "Consulta");
        }

        public ViewResult ListaAlergias()
        {
            return View(GerenciadorExamesFisicos.GetInstance().ObterAlergias(SessionController.ConsultaVariavel.IdConsultaVariavel));
        }


        public ActionResult Delete(int idAlergia)
        {
            ExamesFisicosModel efm = GerenciadorExamesFisicos.GetInstance().Obter(SessionController.ConsultaVariavel.IdConsultaVariavel);
            GerenciadorExamesFisicos.GetInstance().RemoverAlergia(efm, idAlergia);
            SessionController.ListaAlergia = null;
            SessionController.Abas2 = 5;
            return RedirectToAction("Edit", "Consulta");
        }


        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}