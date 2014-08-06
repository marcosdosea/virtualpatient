using System;

namespace PacienteVirtual.Models
{
    public class EmailErroModel
    {

        public EmailErroModel(string mensagem)
        {
            this.Mensagem = mensagem;
            this.Titulo = "Titulo";
        }

        public EmailErroModel()
        {
            // TODO: Complete member initialization
        }
        public string Titulo { get; set; }

        public string Exception { get; set; }

        public string StackTrace { get; set; }

        public string Mensagem { get; set; }

        public string Email { get; set; }

        public string Erro { get; set; }

        public string View { get; set; }

        public string Usuario { get; set; }

        public DateTime Data { get; set; }
    }
}