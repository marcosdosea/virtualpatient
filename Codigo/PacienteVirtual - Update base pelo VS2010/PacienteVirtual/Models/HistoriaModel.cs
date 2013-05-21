using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class HistoriaModel
    {

        public long IdConsultaFixo { get; set; }


        public string HistoriaMedicaPregressa { get; set; }


        public string HistoriaFamiliar { get; set; }
    }
}