    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class Global
    {
        public const long CODIGO_USUARIO_PADRAO = 1;
        public const string NOME_USUARIO_PADRAO = "PV";
        public const string SENHA_USUARIO_PADRAO = "PV";

        public const int ID_TURMA = 1;
        public const int ID_PESSOA = 1;
        public const int IDRELATO = 1;

        public const int AguardandoPreenchimento = 1;
        public const int EmPreenchimento = 2;
        public const int AguardandoCorrecao = 3;
        public const int GabaritoDisponivel = 4;

        // roles
        public const int Administrador = 1;
        public const int Usuario = 2;
        public const int Tutor = 3;

        public const int IdRazaoEncontro = 1;

    }
        
}