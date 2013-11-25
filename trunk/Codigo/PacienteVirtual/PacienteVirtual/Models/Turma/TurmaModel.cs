using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public class TurmaModel
    {

        [Display(Name = "IdTurma: ")]
        public int IdTurma { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public string Codigo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "periodo", ResourceType = typeof(Mensagem))]
        public string Periodo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ativa", ResourceType = typeof(Mensagem))]
        public bool Ativa { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "disciplina", ResourceType = typeof(Mensagem))]
        public int IdDisciplina { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public int IdInstituicao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        public int IdCurso { get; set; }

        [Display(Name = "curso", ResourceType = typeof(Mensagem))]
        public string NomeCurso { get; set; }

        [Display(Name = "instituicao", ResourceType = typeof(Mensagem))]
        public string NomeInstituicao { get; set; }

        [Display(Name = "disciplina", ResourceType = typeof(Mensagem))]
        public string NomeDisciplina { get; set; }

    }
}