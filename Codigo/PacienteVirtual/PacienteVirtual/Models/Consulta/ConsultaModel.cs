using System.Collections.Generic;

namespace PacienteVirtual.Models
{
    public class ConsultaModel
    {
        // Dados do paciente
        public PacienteModel Paciente { get; set; }
        public IEnumerable<RelatoClinicoModel> RelatoClinico { get; set; }
        
        // Dados fixos e compartilhados entre consultas
        public ConsultaFixoModel ConsultaFixo { get; set; }
        public HistoriaModel Historia { get; set; }
        public DemograficosAntropometricosModel DemograficoAntropometrico { get; set; }
        public ExperienciaMedicamentosModel ExperienciaMedicamentos { get; set; }
        public DiarioPessoalModel DiarioPessoal { get; set; }
        public IEnumerable<DiarioPessoalModel> ListaDiarioPessoal { get; set; }

        /////////////////////////////////////////
        public ConscienciaModel Consciencia { get; set; }
        public ComunicacaoModel Comunicacao { get; set; }
        public SensorialModel Sensorial { get; set; }
        public OutrasNecessidadesModel OutrasNecessidades { get; set; }
        public SexualidadeModel Sexualidade { get; set; }
        
        public HigieneModel Higiene { get; set; }
        public PsicoEspiritualModel PsicoEspiritual { get; set; }
        
        public OxigenacaoModel Oxigenacao { get; set; }

        public TermorregulacaoModel Termorregulacao { get; set; }

        public IntegridadeTecidualModel IntegridadeTecidual { get; set; }

        public ClinicoInternacaoModel ClinicoInternacao { get; set; }

        public PatologiasAtuaisModel PatologiasAtuais { get; set; }
        public IEnumerable<PatologiaModel> ListaPatologiasAtuais { get; set; }

        public AntecedentesPatologicosModel AntecedentesPatologicos { get; set; }
        public IEnumerable<PatologiaModel> ListaAntecedentesPatologicos { get; set; }

        public AntecedentesFamiliaresModel AntecedentesFamiliares { get; set; }
        public IEnumerable<PatologiaModel> ListaAntecedentesFamiliares { get; set; }

        public ClinicoInternacaoAlergiasModel ClinicoInternacaoAlergias { get; set; }
        public IEnumerable<AlergiaModel> ListaClinicoInternacaoAlergias { get; set; }

        public NutricaoModel Nutricao { get; set; }
        //////////////////////////////////////


        // Dados Variáveis nas consultas
        public ConsultaVariavelModel ConsultaVariavel { get; set; }
        public EstiloVidaModel EstiloVida { get; set; }

        public MedicamentoNaoPrescritoModel MedicamentoNaoPrescrito { get; set; }
        public IEnumerable<MedicamentoNaoPrescritoModel> ListaMedicamentoNaoPrescrito { get; set; }

        public MedicamentosAnterioresModel MedicamentosAnteriores { get; set; }
        public IEnumerable<MedicamentosAnterioresModel> ListaMedicamentosAnteriores { get; set; }

        public MedicamentoPrescritoModel MedicamentoPrescrito { get; set; }
        public IEnumerable<MedicamentoPrescritoModel> ListaMedicamentoPrescrito { get; set; }

        public ConsultaParametroModel ConsultaParametro { get; set; }
        public IEnumerable<ConsultaParametroModel> ListaConsultaParametro { get; set; }

        public ConsultaVariavelQueixaModel ConsultaVariavelQueixa { get; set; }
        public IEnumerable<ConsultaVariavelQueixaModel> ListaConsultaVariavelQueixa { get; set; }
        public int IdSistema { get; set; }

        public AlergiaExamesFisicosModel AlergiaExamesFisicos { get; set; }
        public ExamesFisicosModel ExamesFisicos { get; set; }
        public IEnumerable<AlergiaModel> ListaAlergia { get; set; }

        public IntervencaoConsultaModel IntervencaoConsulta { get; set; }
        public IEnumerable<IntervencaoConsultaModel> ListaIntervencaoConsulta { get; set; }

        public CartaModel Carta { get; set; }
        public IEnumerable<CartaModel> ListaCarta { get; set; }
        //public QueixaModel Queixas

        // medicamento relacionados a queixa
        public QueixaMedicamentoModel QueixaMedicamento { get; set; }
        public IEnumerable<QueixaMedicamentoModel> ListaQueixaMedicamento { get; set; }

    }
}