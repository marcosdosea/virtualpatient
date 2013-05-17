using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models.Data;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class ConsultaFixoController : Controller
    {
       
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();

        //
        // GET: /ConsultaFixo/

        public ViewResult Index()
        {
            return View(gConsultaFixo.ObterTodos());
        }

        //
        // GET: /ConsultaFixo/Details/5

        public ViewResult Details(long id)
        {
           // ConsultaFixoE tb_consulta_fixo = db.tb_consulta_fixo.Single(t => t.IdConsultaFixo == id);
            return View(gConsultaFixo.Obter(id));
        }

        //
        // GET: /ConsultaFixo/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /ConsultaFixo/Create

        [HttpPost]
        public ActionResult Create(ConsultaFixoModel consultaFixoModel)
        {
            if (ModelState.IsValid)
            {
                consultaFixoModel.IdConsultaFixo = gConsultaFixo.Inserir(consultaFixoModel);
                return RedirectToAction("Index");  
            }
            return View(consultaFixoModel);
        }
        
        //
        // GET: /ConsultaFixo/Edit/5
 
        public ActionResult Edit(long id)
        {

            //ConsultaFixoE tb_consulta_fixo = db.tb_consulta_fixo.Single(t => t.IdConsultaFixo == id);
            return View(gConsultaFixo.Obter(id));
        }

        //
        // POST: /ConsultaFixo/Edit/5

        [HttpPost]
        public ActionResult Edit(ConsultaFixoModel consultaFixoModel)
        {
            if (ModelState.IsValid)
            {
                gConsultaFixo.Atualizar(consultaFixoModel);
                return RedirectToAction("Index");
            }
            return View(consultaFixoModel);
        }

        //
        // GET: /ConsultaFixo/Delete/5
 
        public ActionResult Delete(long id)
        {
           // ConsultaFixoE tb_consulta_fixo = db.tb_consulta_fixo.Single(t => t.IdConsultaFixo == id);
            return View(gConsultaFixo.Obter(id));
        }

        //
        // POST: /ConsultaFixo/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            gConsultaFixo.Remover(id);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}