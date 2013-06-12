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

        public int quantRelatos { get; set; }

        
    }
}