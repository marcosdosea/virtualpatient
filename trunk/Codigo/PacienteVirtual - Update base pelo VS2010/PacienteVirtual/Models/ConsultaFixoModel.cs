using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ConsultaFixoModel
    {

        [Display(Name = "Código")]
        public long IdConsultaFixo { get; set; }

        [Display(Name = "Código do Paciente")]
        public int IdPaciente { get; set; }

        [Display(Name = "Ehgabarito")]
        public bool EhGabarito { get; set; }
    }
}