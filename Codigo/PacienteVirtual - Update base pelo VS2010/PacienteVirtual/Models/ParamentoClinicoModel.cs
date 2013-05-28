using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class ParamentoClinicoModel
    {
        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "codigo"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdParamentoClinico { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Paramento clínico"/**, ResourceType = typeof(Mensagem)*/)]
        public String ParamentoClinico { get; set; }
    }
}