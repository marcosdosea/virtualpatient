using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

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

        [Required]
        [Display(Name = "Código: ")]
        public int IdPaciente { get; set; }

        [Required]
        [Display(Name = "Nome do paciente: ")]
        public String NomePaciente { get; set; }

        // [Required]
        [Display(Name = "Foto do paciente: ")]
        public byte[] Foto { get; set; }

        public int QuantRelatos { get; set; }

    }
}