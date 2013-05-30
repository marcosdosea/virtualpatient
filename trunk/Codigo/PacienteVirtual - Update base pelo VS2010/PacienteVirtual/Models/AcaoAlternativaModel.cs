using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PacienteVirtual.Models
{
    public class AcaoAlternativaModel
    {
        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "codigo"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdAcaoAlternativa { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Descricao da ação"/**, ResourceType = typeof(Mensagem)*/)]
        public String DescricaoAcao { get; set; }
    }
}