using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaTemperaturaPele { Quente = 0, Fria = 1 }

    public class TermorregulacaoModel
    {
        public string ErroTemperaturaPele { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "temperatura", ResourceType = typeof(Mensagem))]
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