using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class QueixaModel
    {
        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "codigo"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdQueixa { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Descrição da Queixa"/**, ResourceType = typeof(Mensagem)*/)]
        public string DescricaoQueixa { get; set; }


        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Código do sistema"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdSistema { get; set; }

        [Display(Name = "Nome do sistema"/**, ResourceType = typeof(Mensagem)*/)]
        public string NomeSistema { get; set; }
    }
}