using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public class ConsultaVariavelQueixaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel_codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdQueixa { get; set; }

        [Display(Name = "alternativas_intervencao", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string DescricaoQueixa { get; set; }

        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdSistema { get; set; }

        [Display(Name = "nome_sistema", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string NomeSistema { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipo", ResourceType = typeof(Mensagem))]
        [StringLength(1)]
        public String Tipo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "desde", ResourceType = typeof(Mensagem))]
        [StringLength(40)]
        public string Desde { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "prioridade", ResourceType = typeof(Mensagem))]
        public int Prioridade { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdObjetivoTerapeutico { get; set; }

        [Display(Name = "objetivo_terapeutico", ResourceType = typeof(Mensagem))]
        public string DescricaoObjetivoTerapeutico { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdSituacaoQueixa { get; set; }

        [Display(Name = "estado_situacao", ResourceType = typeof(Mensagem))]
        public string DescricaoSituacao { get; set; }

        public string ErroConsultaVariavelQueixa { get; set; }
        public string ErroConsultaVariavelQueixa2 { get; set; }
     }
}