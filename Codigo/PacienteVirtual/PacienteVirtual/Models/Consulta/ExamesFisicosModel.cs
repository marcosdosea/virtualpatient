using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class ExamesFisicosModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public Int64 IdConsultaVariavel { get; set; }
        
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        [Display(Name = "peso", ResourceType = typeof(Mensagem))]
        public float Peso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "altura", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float Altura { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pressao_diastolica", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float PressaoDiastolica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pressao_sistolica", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float PressaoSistolica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "glicemia", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float Glicemia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "indice_massa_corporea", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float IndiceMassaCorporea { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "circunferencia_abdominal", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public float CircunferenciaAbdominal { get; set; }
    }
}