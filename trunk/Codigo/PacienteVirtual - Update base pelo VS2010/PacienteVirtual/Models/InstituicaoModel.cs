using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class InstituicaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))] 
        public int IdInstituicao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))] 
        public string NomeInstituicao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sigla", ResourceType = typeof(Mensagem))] 
        public string Sigla { get; set; }

    }
}