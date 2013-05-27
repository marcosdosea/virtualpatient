using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class PacienteModel
    {

        [Required]
        [Display(Name = "Código: ")]
        public int IdPaciente { get; set; }

        [Required]
        [Display(Name = "Nome do paciente: ")]
        public String NomePaciente { get; set; }

        //[Required]
        [Display(Name = "Foto do paciente: ")]
        public byte[] Foto { get; set; }

    }
}