using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models.Consulta;

namespace PacienteVirtual.Controllers.Consulta
{
    public class Consulta2Controller : Controller
    {
        //
        // GET: /Consulta2/
        public ActionResult Edit(long? idConsultaVariavel)
        {
            long idConsultaVariavelTemp = (idConsultaVariavel == null) ? SessionController.ConsultaVariavel.IdConsultaVariavel : (long)idConsultaVariavel;
            ConsultaVariavelModel consultaVariavelModel = GerenciadorConsultaVariavel.GetInstance().Obter(idConsultaVariavelTemp);
            SessionController.ConsultaVariavel = consultaVariavelModel;

            Consulta2Model consulta2Model = new Consulta2Model();
            consulta2Model.ConsultaVariavel = consultaVariavelModel;
            consulta2Model.Paciente = SessionController.Paciente;
            consulta2Model.RelatoClinico = SessionController.RelatoClinico;


            consulta2Model.ConsultaVariavelQueixa = new ConsultaVariavelQueixaModel { IdConsultaVariavel = consulta2Model.ConsultaVariavel.IdConsultaVariavel };
            consulta2Model.ListaConsultaVariavelQueixa = SessionController.ListaConsultaVariavelQueixa;
            consulta2Model.IdSistema = SessionController.Sistema;

            // Consulta Queixa
            ViewBag.IdSistema = new SelectList(GerenciadorSistema.GetInstance().ObterTodos(), "IdSistema", "NomeSistema", consulta2Model.IdSistema);
            ViewBag.IdQueixa = new SelectList(GerenciadorQueixa.GetInstance().ObterPorSistema(consulta2Model.IdSistema), "IdQueixa", "DescricaoQueixa");

            return View(consulta2Model);
        }

    }
}
