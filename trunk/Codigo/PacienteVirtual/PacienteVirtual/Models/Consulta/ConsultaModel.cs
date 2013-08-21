using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ConsultaModel
    {
        // Dados do paciente
        public PacienteModel Paciente { get; set; }
        public RelatoClinicoModel RelatoClinico { get; set; }
        
        // Dados fixos e compartilhados entre consultas
        public ConsultaFixoModel ConsultaFixo { get; set; }
        public HistoriaModel Historia { get; set; }
        public DemograficosAntropometricosModel DemograficoAntropometrico { get; set; }
        public ExperienciaMedicamentosModel ExperienciaMedicamentos { get; set; }
        public DiarioPessoalModel DiarioPessoal { get; set; }
        public IEnumerable<DiarioPessoalModel> ListaDiarioPessoal { get; set; }

        

        public long idConsultaFixo { get; set; }

        public long idConsultaVariavel { get; set; }

        public int idQueixa { get; set; }

      
       
    }
}