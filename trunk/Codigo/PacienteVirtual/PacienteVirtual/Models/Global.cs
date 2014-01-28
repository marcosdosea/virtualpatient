    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Controllers;

namespace PacienteVirtual.Models
{
    public class Global
    {

        public static void ZeraSessaoConsulta()
        {
            // zerando sessão para ir no banco ir pegar os dados com o devido IdVariavel
            SessionController.Sistema = 0;
            SessionController.IdGrupoIntervencao = 0;
            SessionController.ConsultaFixo = null;
            SessionController.ConsultaVariavel = null;
            SessionController.DemograficosAntropometricos = null;
            SessionController.EstiloVida = null;
            SessionController.ExamesFisicos = null;
            SessionController.ExperienciaMedicamentos = null;
            SessionController.Historia = null;
            SessionController.ListaBebidas = null;
            SessionController.ListaConsultaParametro = null;
            SessionController.ListaConsultaVariavelQueixa = null;
            SessionController.ListaDiarioPessoal = null;
            SessionController.ListaMedicamentoNaoPrescrito = null;
            SessionController.ListaMedicamentos = null;
            SessionController.ListaMedicamentosAnteriores = null;
            SessionController.ListaMedicamentosPrescritos = null;
            SessionController.Paciente = null;
            SessionController.RelatoClinico = null;
            SessionController.ListaAlergia = null;
            SessionController.ListaQueixaMedicamento = null;
            SessionController.ListaIntervencaoConsulta = null;
            SessionController.ListaCarta = null;
            SessionController.Abas1 = 0;
            SessionController.Abas2 = -1;
            /////////////////////////////////////////////////////////////////
        }

        public const long CODIGO_USUARIO_PADRAO = 1;
        public const string NOME_USUARIO_PADRAO = "PV";
        public const string SENHA_USUARIO_PADRAO = "PV";

        public const int ID_TURMA = 1;
        public const int ID_PESSOA = 1;
        public const int IDRELATO = 1;

        public const int AguardandoPreenchimento = 1;
        public const int EmPreenchimento = 2;
        public const int EnviadoParaCorrecao = 3;
        public const int GabaritoDisponivel = 4;
        public const int EmCorrecaoPeloTutor = 5;
        public const int AguardandoCorrecaoDoAluno = 6;
        public const int Finalizado = 7;

        // roles
        public const int Administrador = 1;
        public const int Usuario = 2;
        public const int Tutor = 3;

        public const int IdRazaoEncontro = 1;

    }
        
}