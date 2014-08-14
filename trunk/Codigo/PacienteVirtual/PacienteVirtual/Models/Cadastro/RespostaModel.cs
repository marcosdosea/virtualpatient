using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class RespostaModel
    {

        [Display(Name = "resposta_codigo", ResourceType = typeof(Mensagem))]
        public int IdResposta { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "resposta", ResourceType = typeof(Mensagem))]
        public string Resposta { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pergunta", ResourceType = typeof(Mensagem))]
        public int IdPergunta { get; set; }

        [Display(Name = "pergunta", ResourceType = typeof(Mensagem))]
        public string Pergunta { get; set; }

    }
}