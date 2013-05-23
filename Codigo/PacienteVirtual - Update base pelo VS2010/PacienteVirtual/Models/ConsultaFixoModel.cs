using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using PacienteVirtual.App_GlobalResources;



namespace PacienteVirtual.Models
{
    public class ConsultaFixoModel
    {

        [Display(Name = "Código")]
        public long IdConsultaFixo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        //[LocalizarDisplayNomeAtributo("teste", NameResourceType = typeof(Mensagem))] // //Exemplo 1
        [Display(Name = "paciente", ResourceType = typeof(Mensagem))]
        public int IdPaciente { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "eh_gabarito", ResourceType = typeof(Mensagem))] //Exemplo 2
        public bool EhGabarito { get; set; }
    }
}