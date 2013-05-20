using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class DisciplinaModel
    {
        [Required]
        [Display(Name = "Código: ")]
        public int IdDisciplina { get; set; }

        [Required]
        [Display(Name = "Disciplina: ")]
        public string NomeDisciplina { get; set; }

    }
}