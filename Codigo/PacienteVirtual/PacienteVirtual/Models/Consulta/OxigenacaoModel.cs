using System;
using System.ComponentModel.DataAnnotations;
using Resources;
using System.Collections.Generic;

namespace PacienteVirtual.Models.Consulta
{
    public class OxigenacaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public int IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "frequencia_respiratoria", ResourceType = typeof(Mensagem))]
        public int FequenciaResporatoria { get; set; }

        [Display(Name = "ritmo", ResourceType = typeof(Mensagem))]
        public IEnumerable<string> ListaRitmo { get; set; }
    }
}