using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaAberturaOcular { Espontanea = 0, EstimuloVerbal = 1, Dor = 2, NenhumaResposta = 3, NaoSeAplica = 4 }

    public enum ListaMelhorRespostaMotora { ObedeceComandoVerbal = 0, LocalizaDor = 1, FlexaoRetirada = 2, FlexaoAnormal = 3,
    ExtensaoAnormal = 4, NenhumaResposta = 5, NaoSeAplica = 6}
    public enum ListaMelhorRespostaVerbal { Orientado = 0, ConversacaoConfusa = 1, FalaInadequada = 2, SonsIncopativeis = 3,
    NenhumaResposta = 4, NaoSeAplica = 5}
    public enum ListaAvaliacaoSedacao { Grau1 = 0, Grau2 = 1, Grau3 = 2, Grau4 = 3, Grau5 = 4, Grau6 = 5, NaoSeAplica = 6 }

    public class ConscienciaModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Display(Name = "abertura_ocular", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaAberturaOcular))]
        public ListaAberturaOcular AberturaOcular { get; set; }

        [Display(Name = "melhor_resposta_motora", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaMelhorRespostaMotora))]
        public ListaMelhorRespostaMotora MelhorRespostaMotora { get; set; }

        [Display(Name = "melhor_resposta_verbal", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaMelhorRespostaVerbal))]
        public ListaMelhorRespostaVerbal MelhorRespostaVerbal { get; set; }

        [Display(Name = "avaliacao_sedacao", ResourceType = typeof(Mensagem))]
        [EnumDataType(typeof(ListaAvaliacaoSedacao))]
        public ListaAvaliacaoSedacao AvaliacaoSedacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "avaliacao_consciencia_glasgow", ResourceType = typeof(Mensagem))]
        public int AvaliacaoConscienciaGlasgow { get; set; }
    }
}