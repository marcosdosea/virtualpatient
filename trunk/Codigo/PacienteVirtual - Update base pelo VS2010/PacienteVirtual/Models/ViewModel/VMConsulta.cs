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

        public long idConsultaFixo { get; set; }

        public long idConsultaVariavel { get; set; }

        public int idQueixa { get; set; }

      
       
    }
}