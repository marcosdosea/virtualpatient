using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class CursoModel
    {
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdCurso { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        [StringLength(45)]
        public string NomeCurso { get; set; }

    }
} 