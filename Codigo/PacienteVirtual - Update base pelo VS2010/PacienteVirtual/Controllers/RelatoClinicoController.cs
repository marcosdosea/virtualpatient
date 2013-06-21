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
    public class RelatoClinicoController : Controller
    {
        GerenciadorRelatoClinico gRelato = GerenciadorRelatoClinico.GetInstance();
        GerenciadorPaciente gPaciente = GerenciadorPaciente.GetInstance();

        //
        // GET: /RelatoClinico/
        public ViewResult Index()
        {

            return View(gRelato.ObterTodos());
        }

        public ViewResult Listar(int id)
        {

            return View(gRelato.ObterRelatos(id));
        }

        //
        // GET: /RelatoClinico/Details/5
        public ViewResult Details(int id)
        {
            return View(gRelato.Obter(id));
        }

        public FileContentResult GetImage(int id)
        {
            if (id != -1)
            {
                var imageData = GerenciadorPaciente.GetInstance().Obter(id).Foto;
                if (imageData != null)
                    return File(imageData, "image/jpg");
            }
            // byte[] buffer = System.IO.File.ReadAllBytes("~/Content/themes/pv/img/default-avatar.png");
            byte[] byt = System.IO.File.ReadAllBytes(Server.MapPath("~/Content/themes/pv/img/default-avatar.png"));
            return File(byt, "image/jpg");
        }
        // GET: /RelatoClinico/Create

        public ActionResult Create()
        {
            ViewBag.fotoId = -1;
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View();
        }

        //
        // POST: /RelatoClinico/Create
        [HttpPost]
        public ActionResult Create(RelatoClinicoModel relatoModel)
        {
            if (relatoModel.IdPaciente != -1)
            {
                ViewBag.fotoId = relatoModel.IdPaciente;
                ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
                return View(relatoModel);
            }

            if (ModelState.IsValid)
            {
                relatoModel.IdRelato = gRelato.Inserir(relatoModel);
                return PartialView();
            }
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente");
            return View(relatoModel);
        }

        //
        // GET: /RelatoClinico/Edit/5
        public ActionResult Edit(int id)
        {
            RelatoClinicoModel relatoModel = gRelato.Obter(id);
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        //
        // POST: /RelatoClinico/Edit/5

        [HttpPost]
        public ActionResult Edit(RelatoClinicoModel relatoModel)
        {
            if (ModelState.IsValid)
            {
                gRelato.Atualizar(relatoModel);
                return RedirectToAction("Index");
            }
            ViewBag.IdPaciente = new SelectList(gPaciente.ObterTodos().ToList(), "IdPaciente", "NomePaciente", relatoModel.IdPaciente);
            return View(relatoModel);
        }

        public FileContentResult GetVideo(int id)
        {

            var imageData = GerenciadorRelatoClinico.GetInstance().Obter(id).RelatoVideo;
            if (imageData != null)
                return File(imageData, "video/mp4");

            return null;
        }
        //
        // GET: /RelatoClinico/Delete/5

        public ActionResult Delete(int id)
        {
            return View(gRelato.Obter(id));
        }

        //
        // POST: /RelatoClinico/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            gRelato.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}