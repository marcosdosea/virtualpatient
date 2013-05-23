using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Controllers
{ 
    public class PacienteController : Controller
    {
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

        //
        // POST: /Paciente/Create

        [HttpPost]
        public ActionResult Create(PacienteModel pacienteModel)
        {
            /**if (Request.Files.Count > 0)
            {
                int tamanho = (int)Request.Files[0].InputStream.Length;
                byte[] arq = new byte[tamanho];
                Request.Files[0].InputStream.Read(arq, 0, tamanho);
                byte[] arqUp = arq;
                pacienteModel.Foto = arqUp;
            } */
            
            if (ModelState.IsValid)
            {
                pacienteModel.IdPaciente = GerenciadorPaciente.GetInstance().Inserir(pacienteModel);
                return RedirectToAction("Index");
            }
            /**
            if (Request.Files.Count > 0)
            {
                int tamanho = (int)Request.Files[0].InputStream.Length;
                byte[] arq = new byte[tamanho];
                Request.Files[0].InputStream.Read(arq, 0, tamanho);
                byte[] arqUp = arq;
                cadastro.ImageData = arqUp;
                db.Cadastroes.Add(cadastro);
                db.SaveChanges();
                return RedirectToAction("Index"); //Manda de volta pra listagem 
            }*/

            return View(pacienteModel);
        }

        //
        // GET: /Paciente/Edit/5

        public ActionResult Edit(int id)
        {
            PacienteModel pacienteModel = GerenciadorPaciente.GetInstance().Obter(id);
            return View(pacienteModel);
        }

        //
        // POST: /Paciente/Edit/5

        [HttpPost]
        public ActionResult Edit(PacienteModel pacienteModel)
        {
            if (ModelState.IsValid)
            {
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
            //db.Dispose();
            base.Dispose(disposing);
        }
    }
}