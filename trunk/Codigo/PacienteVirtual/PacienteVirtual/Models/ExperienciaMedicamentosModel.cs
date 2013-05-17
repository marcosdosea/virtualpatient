using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ExperienciaMedicamentosModel
    {

        public long IdConsultaFixo { get; set; }

        public int IdRespostaEsperaTratamento { get; set; }

        public int IdRespostaPreocupacoes { get; set; }

        public int IdRespostaGrauEntendimento { get; set; }

        public int IdRespostaCultural { get; set; }

        public int IdRespostaComportamento { get; set; }

        public int IdRespostaIncorporadoPlano { get; set; }


        public bool AtencaoEsperaTratamento { get; set; }

        public bool AtencaoPreocupacoes { get; set; }

        public bool AtencaoGrauEntendimento { get; set; }

        public bool AtencaoCultural { get; set; }

        public bool AtencaoComportamento { get; set; }
    
    }
}