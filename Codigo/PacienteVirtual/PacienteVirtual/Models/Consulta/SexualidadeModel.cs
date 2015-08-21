using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
    public enum ListaParceiroFixo { Sim = 0, Nao = 1 , NaoRelatou = 2 }
    [Serializable]
    public enum ListaConflitoPreferenciaSexual { Sim = 0, Nao = 1, NaoRelatou = 2 }
    [Serializable]
    public enum ListaDorRelaxaoSexual { Sim = 0, Nao = 1, NaoRelatou = 2 }
    [Serializable]
    public class SexualidadeModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "parceiro_fixo", ResourceType = typeof(Mensagem))]
        public ListaParceiroFixo ParceiroFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "conflito_preferencia_sexual", ResourceType = typeof(Mensagem))]
        public ListaConflitoPreferenciaSexual ConflitoPreferenciaSexual { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "dor_relacao_sexual", ResourceType = typeof(Mensagem))]
        public ListaDorRelaxaoSexual DorRelacaoSexual { get; set; }

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

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sem_alteracao", ResourceType = typeof(Mensagem))]
        public bool SemAlteracao { get; set; }
    }
}