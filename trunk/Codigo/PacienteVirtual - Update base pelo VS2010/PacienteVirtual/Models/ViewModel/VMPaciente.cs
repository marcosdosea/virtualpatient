using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models.ViewModel
{
    public class VMPaciente
    {
        public PacienteModel paciente { get; set; }

        public List<RelatoClinicoModel> relatosClinico { get; set; }

        public DemograficosAntropometricosModel demograficosAntropomedicos { get; set; }

        public ExperienciaMedicamentosModel experienciaMedicamentos { get; set; }

        public DiarioPessoalModel diarioPessoal { get; set; }

        public int quantRelatos { get; set; }
        
    }
}