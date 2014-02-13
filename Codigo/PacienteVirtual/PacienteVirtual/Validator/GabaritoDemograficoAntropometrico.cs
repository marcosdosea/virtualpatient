using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PacienteVirtual.Controllers;
using PacienteVirtual.Models;

namespace PacienteVirtual.Validator 
{
    public class GabaritoDemograficoAntropometrico : ValidationAttribute
    {
        public GabaritoDemograficoAntropometrico(params string[] propertyNames)
        {
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (SessionController.EmCorrecao)
            {
                DemograficosAntropometricosModel demograficosAntropometricosGabarito = SessionController.DemograficosAntropometricos; //SessionController.ConsultaGabarito;
                
                var model = (DemograficosAntropometricosModel)validationContext.ObjectInstance;
                if (model.Nome.Equals(demograficosAntropometricosGabarito.Nome)) // aqui iria comparar com o gabarito
                {
                    return new ValidationResult("Nome difere do gabarito. O valor correto seria " + demograficosAntropometricosGabarito.Nome + ".", new List<string> { "nome" });
                }
                
                return ValidationResult.Success;

            }
            return null;
        }
    }
}