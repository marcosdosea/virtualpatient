using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class ConsultaParametroModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdParametroClinico { get; set; }

        [Display(Name = "parametro_clinico", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string ParametroClinico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "valor", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float Valor { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "valor_referencia", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public string ValorReferencia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "unidade", ResourceType = typeof(Mensagem))]
        [StringLength(20)]
        public string Unidade { get; set; }

        public string ErroParametroClinico { get; set; }
    }
}