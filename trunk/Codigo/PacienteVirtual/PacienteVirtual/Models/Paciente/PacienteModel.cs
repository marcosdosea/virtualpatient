using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class PacienteModel
    {
        public PacienteModel() { }  
        public PacienteModel(int idPaciente, string nomePaciente, byte[] foto, int quantRelatos)
        {
            IdPaciente = idPaciente;
            NomePaciente = nomePaciente;
            Foto = foto;
            QuantRelatos = quantRelatos;
        }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo_paciente", ResourceType = typeof(Mensagem))]
        public int IdPaciente { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "nome_paciente", ResourceType = typeof(Mensagem))]
        public String NomePaciente { get; set; }

        // [Required]
        [Display(Name = "foto", ResourceType = typeof(Mensagem))]
        public byte[] Foto { get; set; }

        public int QuantRelatos { get; set; }

    }
}