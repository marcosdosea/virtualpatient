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
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public string Codigo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "periodo", ResourceType = typeof(Mensagem))]
        public string Periodo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "disciplina", ResourceType = typeof(Mensagem))]
        public int IdDisciplina { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public int IdInstituicao { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public string NomeInstituicao { get; set; }

        [Display(Name = "disciplina", ResourceType = typeof(Mensagem))]
        public string NomeDisciplina { get; set; }


    }
}