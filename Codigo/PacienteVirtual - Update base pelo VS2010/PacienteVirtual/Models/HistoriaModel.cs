using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class HistoriaModel
    {

        public long IdConsultaFixo { get; set; }

        public string HistoriaMedicaPregressa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        public string HistoriaFamiliar { get; set; }
    }
}