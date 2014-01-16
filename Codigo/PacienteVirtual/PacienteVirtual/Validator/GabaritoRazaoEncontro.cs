using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.Controllers;

namespace PacienteVirtual.Validator
{
    public class GabaritoRazaoEncontro : ValidationAttribute
    {
        public GabaritoRazaoEncontro(params string[] propertyNames)
        {
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (SessionController.EmCorrecao)
            {
                if (!value.Equals(1)) // pega valor do gabarito disponível na sessão
                    return new ValidationResult(this.FormatErrorMessage(validationContext.DisplayName));
            }
            return null;
        }
    }
}