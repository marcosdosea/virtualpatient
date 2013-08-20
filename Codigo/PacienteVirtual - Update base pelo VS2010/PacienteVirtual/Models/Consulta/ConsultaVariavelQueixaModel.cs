using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ConsultaVariavelQueixaModel
    {
        public long IdConsultaVariavel { get; set; }

        public int IdQueixa { get; set; }

        public int IdAcaoQueixa { get; set; }

        public string Motivo { get; set; }

        public string Desde { get; set; }

        public int Prioridade { get; set; }

        public string DescricaoAcao { get; set; }
     }
}