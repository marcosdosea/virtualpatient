using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class ObjetivoTerapeuticoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdObjetivoTerapeutico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_objetivo_terapeutico", ResourceType = typeof(Mensagem))]
        [StringLength(150)]
        public string DescricaoObjetivoTerapeutico { get; set; }
    }
}