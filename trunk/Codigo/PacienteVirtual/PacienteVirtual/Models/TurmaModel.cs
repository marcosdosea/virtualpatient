using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class TurmaModel
    {
        public long Id { get; set; }
        public string Codigo { get; set; }
        public string Periodo { get; set; }
        public string Tutor { get; set; }
        public string NomeDisciplina { get; set; }
    }
}