using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.App_GlobalResources;

namespace PacienteVirtual.Models
{
    public class RelatoClinicoModel
    {
        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Código"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdRelato { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Código do paciente"/**, ResourceType = typeof(Mensagem)*/)]
        public int IdPaciente { get; set; }


        //[Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Nome do paciente"/**, ResourceType = typeof(Mensagem)*/)]
        public String NomePaciente { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Ordem cronológica"/**, ResourceType = typeof(Mensagem)*/)]
        public int OrdemCronologica { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Relato em texto"/**, ResourceType = typeof(Mensagem)*/)]
        public String RelatoTextual { get; set; }

        //[Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "Relato em vídeo"/**, ResourceType = typeof(Mensagem)*/)]
        public byte[] RelatoVideo { get; set; }

        [Required/**(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")*/]
        [Display(Name = "Nível de dificuldade"/**, ResourceType = typeof(Mensagem)*/)]
        public int NivelDificuldade { get; set; }

    }
}