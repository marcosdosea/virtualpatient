using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class QueixaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdQueixa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "descricao_queixa", ResourceType = typeof(Mensagem))]
        public string DescricaoQueixa { get; set; }


        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_sistema", ResourceType = typeof(Mensagem))]
        public int IdSistema { get; set; }

        [Display(Name = "nome_sistema", ResourceType = typeof(Mensagem))]
        public string NomeSistema { get; set; }
    }
}