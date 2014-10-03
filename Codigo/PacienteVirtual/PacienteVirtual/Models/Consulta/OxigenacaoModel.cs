using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaRitmo{ Regular = 0, Irregular = 1 }

    public enum ListaPadraoRespiratorio { Eupineico = 0, Dispneia = 1, Taquipneia = 2, Bradipneia = 3, CheyneStokes = 4, Kussmaul = 5 }

    public enum ListaSimetriaToracica { Simetrico = 0, AssimetricoUnilateral = 1, AssimetricoBilateral = 2 }

    public enum ListaTiposTorax { Barril = 0, PeitoDePombo = 1, Funil = 2, Lordose = 3, Cifose = 4, Escoliose = 5, Normal = 6 }

    public enum ListaExpansibilidade { Preservada = 0, Diminuida = 1 }

    public enum ListaFrequenciaTosse { NaoSeAplica = 0, Frequente = 1, Noturna = 2, Esporadica = 3 }

    public enum ListaTipoTosse { NaoSeAplica = 0, Seca = 1, Produtiva = 2 }

    public enum ListaPercursao { Ar = 0, Liquido = 1, Massa = 2 }

    public enum ListaAuscultaPulmonar { VesicularPresente = 0, VesicularDiminuido = 1, Roncos = 2, Estertores = 3, Sibilos = 4, Estridor = 5, AtritoPleural = 6 }

    public enum ListaAspectoSecrecao { NaoSeAplica = 0, Esbranquicada = 1, Purulenta = 2, Esverdeada = 3, Amarelada = 4, FerruginosaArroxeada = 5, Mucopurulenta = 6, Rosea = 7, Hematica = 8, EnegrecidaCinzenta = 9 }

    public class OxigenacaoModel
    {
        public string ErroRitmo { get; set; }
        public string ErroPadraoResp { get; set; }
        public string ErroSimetriaToracica { get; set; }
        public string ErroTiposTorax { get; set; }
        public string ErroExpansibilidade { get; set; }
        public string ErroFrequenciaTosse { get; set; }
        public string ErroTipoTosse { get; set; }
        public string ErroPercursao { get; set; }
        public string ErroAuscultaPulmonar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "frequencia_respiratoria", ResourceType = typeof(Mensagem))]
        public int FequenciaResporatoria { get; set; }

        [Display(Name = "ritmo", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaRitmo))]
        public ListaRitmo Ritmo { get; set; }

        [Display(Name = "padrao_respiratorio", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaPadraoRespiratorio))]
        public ListaPadraoRespiratorio PadraoRespiratorio { get; set; }

        [Display(Name = "obstrucaoNasal", ResourceType = typeof(Mensagem))]
        public bool ObstrucaoNasal { get; set; }

        [Display(Name = "coriza", ResourceType = typeof(Mensagem))]
        public bool Coriza { get; set; }

        [Display(Name = "desvioDeSepto", ResourceType = typeof(Mensagem))]
        public bool DesvioDeSepto { get; set; }

        [Display(Name = "palidez", ResourceType = typeof(Mensagem))]
        public bool Palidez { get; set; }

        [Display(Name = "labioCianotico", ResourceType = typeof(Mensagem))]
        public bool LabioCianotico { get; set; }

        [Display(Name = "simetriaToracica", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaSimetriaToracica))]
        public ListaSimetriaToracica SimetriaToracica { get; set; }

        [Display(Name = "tipo_torax", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTiposTorax))]
        public ListaTiposTorax TiposTorax { get; set; }

        [Display(Name = "tiragemIntercostal", ResourceType = typeof(Mensagem))]
        public bool TiragemIntercostal { get; set; }

        [Display(Name = "expansibilidade", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaExpansibilidade))]
        public ListaExpansibilidade Expansibilidade { get; set; }

        [Display(Name = "enfizema_subcutaneo", ResourceType = typeof(Mensagem))]
        public bool EnfizemaSubcutaneo { get; set; }

        [Display(Name = "presenca_fremito", ResourceType = typeof(Mensagem))]
        public bool PresencaFremito { get; set; }

        [Display(Name = "tosse", ResourceType = typeof(Mensagem))]
        [StringLength(1)]
        public string Tosse { get; set; }

        [Display(Name = "frequencia_tosse", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaFrequenciaTosse))]
        public ListaFrequenciaTosse FrequenciaTosse { get; set; }

        [Display(Name = "tipo_tosse", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaTipoTosse))]
        public ListaTipoTosse TipoTosse { get; set; }

        [Display(Name = "aspecto_secrecao", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaAspectoSecrecao))]
        public ListaAspectoSecrecao AspectoSecrecao { get; set; }

        [Display(Name = "percursao", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaPercursao))]
        public ListaPercursao Percursao { get; set; }

        [Display(Name = "ganglios_palpaveis", ResourceType = typeof(Mensagem))]
        public bool GangliosPalpaveis { get; set; }

        [Display(Name = "ganglios_dolorosos", ResourceType = typeof(Mensagem))]
        public bool GangliosDolorosos { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ganglios_localizar", ResourceType = typeof(Mensagem))]
        [StringLength(50)]
        public string GangliosLocalizar { get; set; }

        [Display(Name = "asculta_pulmonar", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaAuscultaPulmonar))]
        public ListaAuscultaPulmonar AuscultaPulmonar { get; set; }
    }
}