using System;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    [Serializable]
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
        [StringLength(100)]
        public String NomePaciente { get; set; }

        // [Required]
        [Display(Name = "foto", ResourceType = typeof(Mensagem))]
        public byte[] Foto { get; set; }

        public int QuantRelatos { get; set; }

    }
}