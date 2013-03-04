using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class TurmaModel
    {
        [Required]
        [Display(Name = "Turma: ")]
        public long Id { get; set; }

        [Required]
        [Display(Name = "Código: ")]
        public string Codigo { get; set; }

        [Required]
        [Display(Name = "Período: ")]
        public string Periodo { get; set; }

        //[Required]
        [Display(Name = "Tutor: ")]
        public string Tutor { get; set; }

        [Required]
        [Display(Name = "Disciplina: ")]       
        public string NomeDisciplina { get; set; }
    }
}