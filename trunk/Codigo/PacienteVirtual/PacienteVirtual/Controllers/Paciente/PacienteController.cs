﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;
using System.IO;
using System.Web.UI.WebControls;
using System.Text;

namespace PacienteVirtual.Controllers
{
    public class PacienteController : Controller
    {
        private pvEntities db = new pvEntities();
        //
        // GET: /Paciente/

        public ViewResult Index()
        {
            return View(GerenciadorPaciente.GetInstance().ObterTodos());
        }

        //
        // GET: /Paciente/Details/5

        public ViewResult Details(int id)
        {
            return View(GerenciadorPaciente.GetInstance().Obter(id));
        }

        //
        // GET: /Paciente/Create

        public ActionResult Create()
        {
            return View();
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            Button btnSomeButton = sender as Button;
            btnSomeButton.Text = "I was clicked!";
        }

        //
        // POST: /Paciente/Create

        [HttpPost]
        public ActionResult Create(PacienteModel pacienteModel)
        {
            if (ModelState.IsValid)
            {

                int tamanho = (int)Request.Files[0].InputStream.Length;
                if (tamanho == 0)
                    pacienteModel.Foto = null;
                else
                {
                    byte[] arq = new byte[tamanho];
                    Request.Files[0].InputStream.Read(arq, 0, tamanho);
                    byte[] arqUp = arq;

                    pacienteModel.Foto = arqUp;
                }
                GerenciadorPaciente.GetInstance().Inserir(pacienteModel);

                return RedirectToAction("Index");
            }

            return View(pacienteModel);
        }


        //
        // GET: /Paciente/Edit/5

        public ActionResult Edit(int id)
        {
            PacienteModel pacienteModel = GerenciadorPaciente.GetInstance().Obter(id);
            return View(pacienteModel);
        }

        public FileContentResult GetImage(int id)
        {
            if (id != -1)
            {
                var imageData = GerenciadorPaciente.GetInstance().Obter(id).Foto;
                if (imageData != null)
                    return File(imageData, "image/jpg");
            }
            byte[] byt = System.IO.File.ReadAllBytes(Server.MapPath("~/Content/themes/pv/img/default-avatar.png"));
            return File(byt, "image/jpg");
        }
        //
        // POST: /Paciente/Edit/5

        [HttpPost]
        public ActionResult Edit(PacienteModel pacienteModel)
        {
            if (ModelState.IsValid)
            {

                int tamanho = (int)Request.Files[0].InputStream.Length;
                if (tamanho == 0)
                    pacienteModel.Foto = GerenciadorPaciente.GetInstance().Obter(pacienteModel.IdPaciente).Foto;
                else
                {
                    byte[] arq = new byte[tamanho];
                    Request.Files[0].InputStream.Read(arq, 0, tamanho);
                    byte[] arqUp = arq;

                    pacienteModel.Foto = arqUp;
                }

                GerenciadorPaciente.GetInstance().Atualizar(pacienteModel);
                return RedirectToAction("Index");
            }
            return View(pacienteModel);
        }

        //
        // GET: /Paciente/Delete/5

        public ActionResult Delete(int id)
        {
            PacienteModel pacienteModel = GerenciadorPaciente.GetInstance().Obter(id);
            return View(pacienteModel);
        }

        //
        // POST: /Paciente/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GerenciadorPaciente.GetInstance().Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

    }
}