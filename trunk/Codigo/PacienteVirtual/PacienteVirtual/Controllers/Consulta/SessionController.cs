using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers 
{
    public class SessionController
    {
        // Dados do paciente
        public PacienteModel Paciente { get; set; }
        public RelatoClinicoModel RelatoClinico { get; set; }

        // Dados fixos e compartilhados entre consultas
        public ConsultaFixoModel ConsultaFixo { get; set; }
        public HistoriaModel Historia { get; set; }
        
        public DemograficosAntropometricosModel DemograficosAntropometricos
        {
            get
            {
                DemograficosAntropometricosModel demoAntro = (DemograficosAntropometricosModel)HttpContext.Current.Session["_DemograficosAntropometricos"];
                if (demoAntro == null)
                {
                    demoAntro = GerenciadorDemograficosAntropometricos.GetInstance().Obter(ConsultaFixo.IdConsultaFixo);
                    HttpContext.Current.Session["_DemograficosAntropometricos"] = demoAntro;
                }
                return demoAntro;
            }
            set
            {
                HttpContext.Current.Session["_DemograficosAntropometricos"] = value;
            }
        }

        public ExperienciaMedicamentosModel ExperienciaMedicamentos { get; set; }
        public DiarioPessoalModel DiarioPessoal { get; set; }
        public IEnumerable<DiarioPessoalModel> ListaDiarioPessoal { get; set; }

    }
}