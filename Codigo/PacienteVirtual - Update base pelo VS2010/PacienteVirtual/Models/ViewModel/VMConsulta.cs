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

        public DemograficosAntropometricosModel demograficosAntropomedicos { get; set; }

        public ExperienciaMedicamentosModel experienciaMedicamentos { get; set; }

        public DiarioPessoalModel diarioPessoal { get; set; }

        //falta estilo_vida, medicamentos_anteriores, Medicamentos_prescritos, medicamentos_não_prescritos
    }
}