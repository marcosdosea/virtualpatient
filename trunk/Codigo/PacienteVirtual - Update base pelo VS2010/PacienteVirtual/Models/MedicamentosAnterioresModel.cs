using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class MedicamentosAnterioresModel
    {

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "consulta_variavel"/**, ResourceType = typeof(Mensagem)*/)]
        public Int64 IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "medicamento_codigo", ResourceType = typeof(Mensagem))]
        public Int32 IdMedicamento { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "indicacao"/**, ResourceType = typeof(Mensagem)*/)]
        public string Indicacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "resposta"/**, ResourceType = typeof(Mensagem)*/)]
        public string Resposta { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "periodo"/**, ResourceType = typeof(Mensagem)*/)]
        public string Periodo { get; set; }

    }
}