using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class BebidaModel
    {

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "bebida", ResourceType = typeof(Mensagem))]
        public int IdBebida { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipo_bebida", ResourceType = typeof(Mensagem))]
        [StringLength(45)]
        public string Nome { get; set; }

    }
}