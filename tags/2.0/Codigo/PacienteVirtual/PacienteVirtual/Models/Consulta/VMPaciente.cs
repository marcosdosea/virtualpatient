using System.Collections.Generic;

namespace PacienteVirtual.Models
{
    public class VMPaciente
    {
        public PacienteModel paciente { get; set; }

        public List<RelatoClinicoModel> relatosClinico { get; set; }

        public DemograficosAntropometricosModel demograficosAntropomedicos { get; set; }

        public ExperienciaMedicamentosModel experienciaMedicamentos { get; set; }

        public DiarioPessoalModel diarioPessoal { get; set; }

        public RelatoClinicoModel relatoClinico { get; set; }

        public CursoModel cursoModel { get; set; }

        public int quantRelatos { get; set; }
        
    }
}