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

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "nome")]
        [LocalizarDisplayNomeAtributo("nome", NameResourceType = typeof(Mensagem))] // //Exemplo 1
        public int IdPaciente { get; set; }

        [Display(Name = "nome", ResourceType = typeof(Mensagem))] //Exemplo 2
        public bool EhGabarito { get; set; }
    }
}