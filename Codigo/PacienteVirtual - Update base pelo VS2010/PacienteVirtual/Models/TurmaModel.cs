using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class TurmaModel
    {

        [Display(Name = "IdTurma: ")]
        public int IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "Código: ")]
        public string Codigo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "Período: ")]
        public string Periodo { get; set; }

        [Display(Name = "IdDsiciplina: ")]
        public int IdDisciplina { get; set; }

        [Display(Name = "IdInstituicao: ")]
        public int IdInstituicao { get; set; }

        [Display(Name = "Nome da Instituição: ")]
        public string NomeInstituicao { get; set; }

        [Display(Name = "Nome da Disciplina: ")]
        public string NomeDisciplina { get; set; }


    }
}