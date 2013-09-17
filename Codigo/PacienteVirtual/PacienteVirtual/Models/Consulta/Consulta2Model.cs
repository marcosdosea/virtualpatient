using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models.Consulta
{
    public class Consulta2Model
    {
        // Dados do paciente
        public PacienteModel Paciente { get; set; }
        public RelatoClinicoModel RelatoClinico { get; set; }

        // Dados Variáveis nas consultas
        public ConsultaVariavelModel ConsultaVariavel { get; set; }
        
        public ConsultaVariavelQueixaModel ConsultaVariavelQueixa { get; set; }
        public IEnumerable<ConsultaVariavelQueixaModel> ListaConsultaVariavelQueixa { get; set; }
        public int IdSistema { get; set; }
    }
}