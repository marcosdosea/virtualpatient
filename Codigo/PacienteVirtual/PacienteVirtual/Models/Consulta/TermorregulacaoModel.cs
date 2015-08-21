using System.ComponentModel.DataAnnotations;
using Resources;
using System;

namespace PacienteVirtual.Models
{
    [Serializable]
    public enum ListaTemperaturaPele { Quente = 0, Fria = 1, Normotermica = 2 }
    [Serializable]
    public class TermorregulacaoModel
    {
        public string ErroTemperaturaPele { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "temperatura", ResourceType = typeof(Mensagem))]
        [RegularExpression(@"[0-9]+(\.[0-9][0-9])", ErrorMessageResourceType = typeof(Resources.Mensagem), ErrorMessageResourceName = "campo_numerico")]
        public double Temperatura { get; set; }

        [Display(Name = "temperatura_pele", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTemperaturaPele))]
        public ListaTemperaturaPele TemperaturaPele { get; set; }

        [Display(Name = "sudorese", ResourceType = typeof(Mensagem))]
        public bool Sudorese { get; set; }

        [Display(Name = "calafrio", ResourceType = typeof(Mensagem))]
        public bool Calafrio { get; set; }

        [Display(Name = "piloerecao", ResourceType = typeof(Mensagem))]
        public bool Piloerecao { get; set; }
    }
}