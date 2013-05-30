using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class RazaoEncontroModel
    {
        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "codigo"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdRazaoEncontro { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Descrição da razão"/**, ResourceType = typeof(Mensagem)*/)]
        public String DescricaoRazao { get; set; }
    }
}