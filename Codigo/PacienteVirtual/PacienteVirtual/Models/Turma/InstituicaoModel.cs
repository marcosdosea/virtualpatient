using System.ComponentModel.DataAnnotations;
using Resources;
using System;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class InstituicaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))] 
        public int IdInstituicao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        [StringLength(45)]
        public string NomeInstituicao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sigla", ResourceType = typeof(Mensagem))]
        [StringLength(10)]
        public string Sigla { get; set; }

    }
}