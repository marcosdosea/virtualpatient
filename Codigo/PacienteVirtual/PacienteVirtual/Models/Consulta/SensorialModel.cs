using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaEstadoMental
    {
        SemAlteracoes = 0, Agressivo = 1, EpisodioDelirio = 2, Confuso = 3, Agitado = 4, Apatico = 5, Sonolento = 6,
        Torporoso = 7, Comatoso = 8
    }
    
    public class SensorialModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "estado_mental", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaEstadoMental))]
        public ListaEstadoMental EstadoMental { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "palpebral", ResourceType = typeof(Mensagem))]
        public bool Palpebral { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pupilar", ResourceType = typeof(Mensagem))]
        public bool Pupilar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "plantar", ResourceType = typeof(Mensagem))]
        public bool Plantar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sinal_babinski", ResourceType = typeof(Mensagem))]
        public bool SinalBabinski { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "visual", ResourceType = typeof(Mensagem))]
        public bool Visual { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "auditiva", ResourceType = typeof(Mensagem))]
        public bool Auditiva { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "olfativa", ResourceType = typeof(Mensagem))]
        public bool Olfativa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "gustativa", ResourceType = typeof(Mensagem))]
        public bool Gustativa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tatil", ResourceType = typeof(Mensagem))]
        public bool Tatil { get; set; }

        [Display(Name = "descricao_tipo_distorcao", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string DescricaoTipoDistorcao { get; set; }

        [Display(Name = "Dor", ResourceType = typeof(Mensagem))]
        [StringLength(1)]
        public string Dor { get; set; }

        [Display(Name = "dor_intensidade_valor", ResourceType = typeof(Mensagem))]
        public int DorIntensidadeValor { get; set; }

        [Display(Name = "localizacao_dor", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string LocalizacaoDor { get; set; }

        [Display(Name = "duracao_dor", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string DuracaoDor { get; set; }

        [Display(Name = "descricao_dor", ResourceType = typeof(Mensagem))]
        [StringLength(200)]
        public string DescricaoDor { get; set; }

        [Display(Name = "fatores_agravantes_dor", ResourceType = typeof(Mensagem))]
        [StringLength(200)]
        public string FatoresAgravantesDor { get; set; }

        [Display(Name = "fatores_aliviantes_dor", ResourceType = typeof(Mensagem))]
        [StringLength(200)]
        public string FatoresAliviantesDor { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "inquietacao", ResourceType = typeof(Mensagem))]
        public bool Inquietacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "expressao_facial", ResourceType = typeof(Mensagem))]
        public bool ExpressaoFacial { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "defensividade", ResourceType = typeof(Mensagem))]
        public bool Defensividade { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "PA", ResourceType = typeof(Mensagem))]
        public bool PA { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pulso", ResourceType = typeof(Mensagem))]
        public bool Pulso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "respiracao", ResourceType = typeof(Mensagem))]
        public bool Respiracao { get; set; }

    }
}