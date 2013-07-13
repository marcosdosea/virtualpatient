using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models.ViewModel
{
    public class VMConsulta
    {
        public PacienteModel paciente { get; set; }

        public RelatoClinicoModel relatoClinico { get; set; }

        public int idConsultaFixo { get; set; }

        public int idQueixa { get; set; }

        public int idDemograficosAntropomedicos { get; set; }

        public int idExperienciaMedicamentos { get; set; }

        public int idDiarioPessoal { get; set; }

        public int idEstiloVida { get; set; }

        public int idMedicamentosAnteriores { get; set; }

        public int idMedicamentoPrescrito { get; set; }

        public int idMedicamentoNaoPrescrito { get; set; }

 
    }
}