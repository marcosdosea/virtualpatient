using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ProductCatalog
    {
        public int? SelectedDominioId { get; set; }
        public int? SelectedClasseDominioId { get; set; }

        public IEnumerable<DominioDiagnosticoModel> Dominio { get; set; }
        public IEnumerable<ClasseDiagnosticoModel> ClasseDominio { get; set; }
        public IEnumerable<DiagnosticoModel> Diagnostico { get; set; }

    }
}