using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaTurgor { Presente = 0, Diminuido = 1}

    public enum ListaEstadoHidratacao { Hidratada = 0, Desidratada = 1 }

    public class IntegridadeTecidualModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "turgor", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTurgor))]
        public ListaTurgor Turgor { get; set; }

        [Display(Name = "equimose", ResourceType = typeof(Mensagem))]
        public bool Equimose { get; set; }

        [Display(Name = "hematoma", ResourceType = typeof(Mensagem))]
        public bool Hematoma { get; set; }

        [Display(Name = "letericia", ResourceType = typeof(Mensagem))]
        public bool Letericia { get; set; }

        [Display(Name = "descorada", ResourceType = typeof(Mensagem))]
        public bool Descorada { get; set; }

        [Display(Name = "estado_hidratacao", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaEstadoHidratacao))]
        public ListaEstadoHidratacao EstadoHidratacao { get; set; }

        [Display(Name = "purido", ResourceType = typeof(Mensagem))]
        public bool Purido { get; set; }

        [Display(Name = "hiperemia", ResourceType = typeof(Mensagem))]
        public bool Hiperemia { get; set; }

        [Display(Name = "nodulo", ResourceType = typeof(Mensagem))]
        public bool Nodulo { get; set; }

        [Display(Name = "descamacao", ResourceType = typeof(Mensagem))]
        public bool Descamacao { get; set; }

        [Display(Name = "perda_sensibilidade", ResourceType = typeof(Mensagem))]
        public bool PerdaSensibilidade { get; set; }

        [Display(Name = "eritema", ResourceType = typeof(Mensagem))]
        public bool Eritema { get; set; }

        [Display(Name = "rubor", ResourceType = typeof(Mensagem))]
        public bool Rubor { get; set; }

        [Display(Name = "localizar_alteracao", ResourceType = typeof(Mensagem))]
        public string LocalAlteracaoPele { get; set; }

        [Display(Name = "pe_diabetico", ResourceType = typeof(Mensagem))]
        public bool Pediabetico { get; set; }

        [Display(Name = "escoriacao", ResourceType = typeof(Mensagem))]
        public bool Escoriacao { get; set; }

        [Display(Name = "ulcera_pressao", ResourceType = typeof(Mensagem))]
        public bool UlceraPressao { get; set; }

        [Display(Name = "estagio", ResourceType = typeof(Mensagem))]
        public string UlceraPressaoEstagio { get; set; }

        [Display(Name = "local", ResourceType = typeof(Mensagem))]
        public string UlceraPressaoLocal { get; set; }

        [Display(Name = "queimadura", ResourceType = typeof(Mensagem))]
        public bool Queimadura { get; set; }

        [Display(Name = "grau", ResourceType = typeof(Mensagem))]
        public string QueimaduraGrau { get; set; }

        [Display(Name = "local", ResourceType = typeof(Mensagem))]
        public string QueimaduraLocal { get; set; }

        [Display(Name = "ferida_cirurgica", ResourceType = typeof(Mensagem))]
        public bool FeridaCirurgica { get; set; }

        [Display(Name = "local", ResourceType = typeof(Mensagem))]
        public string FeridaCirurgicaLocal { get; set; }

        [Display(Name = "aspecto", ResourceType = typeof(Mensagem))]
        public string LesaoAspecto { get; set; }
    }
}