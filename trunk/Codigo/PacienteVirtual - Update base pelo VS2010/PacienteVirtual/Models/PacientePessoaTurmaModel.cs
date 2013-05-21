using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class PacientePessoaTurmaModel
    {

        public int IdPessoa { get; set; }

        public int IdTurma { get; set; }

        public int IdPaciente { get; set; }

        public long IdConsultaFixo { get; set; }

        public long IdConsultaVariavel { get; set; }

        public int GrupoAtividades { get; set; }

        public int EstadoPreenchimento { get; set; }
    }
}