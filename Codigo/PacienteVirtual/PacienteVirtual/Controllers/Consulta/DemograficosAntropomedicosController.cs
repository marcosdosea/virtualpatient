using System.Linq;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{ 
    public class DemograficosAntropomedicosController : Controller
    {
        private pvEntities db = new pvEntities();

        GerenciadorDemograficosAntropometricos gDemoAntrop = GerenciadorDemograficosAntropometricos.GetInstance();
        GerenciadorConsultaFixo gConsultaFixo = GerenciadorConsultaFixo.GetInstance();
        GerenciadorEscolaridade gEscolaridade = GerenciadorEscolaridade.GetInstance();
        GerenciadorPlanoSaude gPlanoSaude = GerenciadorPlanoSaude.GetInstance();
        GerenciadorOcupacao gOcupacao = GerenciadorOcupacao.GetInstance();

        //
        // GET: /DemograficosAntropomedicos/Edit/5
 
        public ActionResult Edit(long id)
        {
            DemograficosAntropometricosModel demoAntro = gDemoAntrop.Obter(id);
            ViewBag.IdConsultaFixo = new SelectList(gConsultaFixo.ObterTodos().ToList(), "IdConsultaFixo", "IdConsultaFixo", demoAntro.IdConsultaFixo);
            ViewBag.IdEscolaridade = new SelectList(gEscolaridade.ObterTodos().ToList(), "IdEscolaridade", "Nivel",demoAntro.IdEscolaridade);
            ViewBag.IdOcupacao = new SelectList(gOcupacao.ObterTodos().ToList(), "IdOcupacao", "Descricao", demoAntro.IdOcupacao);
            ViewBag.IdPlanoSaude = new SelectList(gPlanoSaude.ObterTodos().ToList(), "IdPlanoSaude", "Nome", demoAntro.IdPlanoSaude);

            return PartialView(demoAntro);
        }

        //
        // POST: /DemograficosAntropomedicos/Edit/5

        [HttpPost]
        public ActionResult Edit(DemograficosAntropometricosModel demoAntro)
        {
            if (ModelState.IsValid)
            {
                gDemoAntrop.Atualizar(demoAntro);
            }
            return RedirectToAction("Edit", "Consulta");
        }

        
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}