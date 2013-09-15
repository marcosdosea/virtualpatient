using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Consulta;

namespace PacienteVirtual.Models
{
    public class ConsultaModel
    {
        // Dados do paciente
        public PacienteModel Paciente { get; set; }
        public RelatoClinicoModel RelatoClinico { get; set; }
        
        // Dados fixos e compartilhados entre consultas
        public ConsultaFixoModel ConsultaFixo { get; set; }
        public HistoriaModel Historia { get; set; }
        public DemograficosAntropometricosModel DemograficoAntropometrico { get; set; }
        public ExperienciaMedicamentosModel ExperienciaMedicamentos { get; set; }
        public DiarioPessoalModel DiarioPessoal { get; set; }
        public IEnumerable<DiarioPessoalModel> ListaDiarioPessoal { get; set; }

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

        public ExamesFisicosModel ExamesFisicos { get; set; }
        //public QueixaModel Queixas

    }
}