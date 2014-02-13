using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.Controllers;
using PacienteVirtual.Models;

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
                //ConsultaVariavelModel consultaGabarito = SessionController.ConsultaGabarito;
                ConsultaVariavelModel consulta = SessionController.ConsultaVariavel;
                
                var model = (RazaoEncontroModel) validationContext.ObjectInstance;
                if (model.IdRazaoEncontro != 1) // aqui iria comparar com o gabarito
                {
                }
                return ValidationResult.Success;

            }
            return null;
        }
    }
}