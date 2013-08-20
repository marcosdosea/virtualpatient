using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class PacienteRelato
    {
        public PacienteModel paciente { get; set; }
        public RelatoClinicoModel relato {get; set;}
    }
}