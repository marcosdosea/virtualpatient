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



        public EstiloVidaModel estilloVida { get; set; }

        public MedicamentosAnterioresModel medicamentosAnteriores { get; set; }

        public MedicamentoPrescritoModel medicamentoPrescrito { get; set; }

        public MedicamentoNaoPrescritoModel medicamentoNaoPrescrito { get; set; }

        public QueixaModel queixa { get; set; }
 
    }
}