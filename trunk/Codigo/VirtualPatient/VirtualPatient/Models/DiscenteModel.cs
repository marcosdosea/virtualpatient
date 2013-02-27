using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VirtualPatient.Models
{
    public class DiscenteModel
    {

        [Required(ErrorMessage = "Por favor insira um número")]
        [ScaffoldColumn(false)]
        public int Id { get; set; }//ID do Aluno

        [Required(ErrorMessage = "Por favor insira seu nome")]
        [Display(Name = "Primeiro nome")]
        public string PrimeiroNome { get; set; }//Nome

        [Display(Name = "Sobre nome")]
        public string SobreNome { get; set; }//Sobre Nome

        [Required(ErrorMessage = "Insirá um email")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Insira um e-mail valido")]
        public string Email { get; set; }//Email

       [DataType(DataType.Password)]
        public String passWord { get; set; }
    }
}