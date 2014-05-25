using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaSimetriaMamas { Simetricas = 0, Assimetricas = 1 }
    public enum ListaTipoSecrecao { SecrecaoSerosa = 0, SecrecaoPurulenta = 1 }

    public class SexualidadeModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "parceiro_fixo", ResourceType = typeof(Mensagem))]
        public bool ParceiroFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "conflito_preferencia_sexual", ResourceType = typeof(Mensagem))]
        public bool ConflitoPreferenciaSexual { get; set; }

        [Display(Name = "data_ultima_menstruacao", ResourceType = typeof(Mensagem))]
        public DateTime DataUltimaMenstruacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "uso_contraceptivo", ResourceType = typeof(Mensagem))]
        public bool UsoContraceptivo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "dor_relacao_sexual", ResourceType = typeof(Mensagem))]
        public bool DorRelacaoSexual { get; set; }

        [Display(Name = "data_exame_preventivo", ResourceType = typeof(Mensagem))]
        public DateTime DataExamePreventivo { get; set; }

        [Display(Name = "simetria_mamas", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaSimetriaMamas))]
        public ListaSimetriaMamas SimetriaMamas { get; set; }

        [Display(Name = "tipo_secrecao", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTipoSecrecao))]
        public ListaTipoSecrecao TipoSecrecao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "secrecao", ResourceType = typeof(Mensagem))]
        public bool Secrecao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "prurido", ResourceType = typeof(Mensagem))]
        public bool Prurido { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "edema", ResourceType = typeof(Mensagem))]
        public bool Edema { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "odor_fetido", ResourceType = typeof(Mensagem))]
        public bool OdorFetido { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sangramento", ResourceType = typeof(Mensagem))]
        public bool Sangramento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "lesao", ResourceType = typeof(Mensagem))]
        public bool Lesao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "hiperemia", ResourceType = typeof(Mensagem))]
        public bool Hiperemia { get; set; }
    }
}