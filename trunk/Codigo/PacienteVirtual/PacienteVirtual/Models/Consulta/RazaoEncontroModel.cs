using System;
using System.ComponentModel.DataAnnotations;
using Resources;
using PacienteVirtual.Validator;

namespace PacienteVirtual.Models
{
    public class RazaoEncontroModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        [GabaritoRazaoEncontro]
        public int IdRazaoEncontro { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_razao", ResourceType = typeof(Mensagem))]
        public String DescricaoRazao { get; set; }
    }
}