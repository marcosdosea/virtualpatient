using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaEstadoNutricional { PesoNormal = 0, PerdaPeso = 1, AumentoPeso = 2, Caquexia = 3, Sobrepeso = 4 }

    public enum ListaDispositivosAlimentacao { NaoSeAplica = 0, SNE = 1, SNG = 2, NPT = 3, Gastronomia = 4, Jejunostomia = 5 }

    public class NutricaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "peso", ResourceType = typeof(Mensagem))]
        public float Peso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "altura", ResourceType = typeof(Mensagem))]
        public float Altura { get; set; }

        [Display(Name = "estado_nutricional", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaEstadoNutricional))]
        public ListaEstadoNutricional EstadoNutricional { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nutricao_oral", ResourceType = typeof(Mensagem))]
        public bool NutricaoOral { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "disfagia", ResourceType = typeof(Mensagem))]
        public bool Disfagia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "dificuldade_mastigar", ResourceType = typeof(Mensagem))]
        public bool DificuldadeMastigar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sangramento_gengival", ResourceType = typeof(Mensagem))]
        public bool SangramentoGengival { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ausencia_dentes", ResourceType = typeof(Mensagem))]
        public bool AusenciaDentes { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nausea", ResourceType = typeof(Mensagem))]
        public bool Nausea { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "emese", ResourceType = typeof(Mensagem))]
        public bool Emese { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "pirose", ResourceType = typeof(Mensagem))]
        public bool Pirose { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ingesta_hidrica", ResourceType = typeof(Mensagem))]
        public bool IngestaHidrica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ingesta_hidrica", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public decimal IngestaHidricaValor { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "restricao_hidrica", ResourceType = typeof(Mensagem))]
        public bool RestricaoHidrica { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "restricao_hidrica", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public decimal RestricaoHidricaValor { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sem_restricao", ResourceType = typeof(Mensagem))]
        public bool SemRestricao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "restricao_alimentar", ResourceType = typeof(Mensagem))]
        public bool RestricaoAlimentar { get; set; }

        [Display(Name = "restricao_alimentar", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string RestricaoAlimentarTexto { get; set; }

        [Display(Name = "habitos_alimentares", ResourceType = typeof(Mensagem))]
        [StringLength(100)]
        public string HabitosAlimentares { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "dispositivos_armazenacao", ResourceType = typeof(Mensagem))]
        public ListaDispositivosAlimentacao DispositivosAlimentacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instalada", ResourceType = typeof(Mensagem))]
        public DateTime Instalada { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sem_restricao_alimentar", ResourceType = typeof(Mensagem))]
        public bool SemRestricaoAlimentar { get; set; }
    }
}