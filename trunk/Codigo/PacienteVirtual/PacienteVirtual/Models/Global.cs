using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Controllers;
using System.Text;
using System.Globalization;

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


        //metodo para remover acentuação
        public static string RemoverAcentuacao(string text)
        {
            StringBuilder sbReturn = new StringBuilder();
            var arrayText = text.Normalize(NormalizationForm.FormD).ToCharArray();

            foreach (char letter in arrayText)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(letter) != UnicodeCategory.NonSpacingMark)
                    sbReturn.Append(letter);
            }
            return sbReturn.ToString();
        }

        //método para validar o CPF
        public static bool validarCPF(string CPF)
        {
            int[] mt1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] mt2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string TempCPF;
            string Digito;
            int soma;
            int resto;

            CPF = CPF.Trim();
            CPF = CPF.Replace(".", "").Replace("-", "");

            if (CPF.Length != 11)
                return false;

            TempCPF = CPF.Substring(0, 9);
            soma = 0;
            for (int i = 0; i < 9; i++)
                soma += int.Parse(TempCPF[i].ToString()) * mt1[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            Digito = resto.ToString();
            TempCPF = TempCPF + Digito;
            soma = 0;

            for (int i = 0; i < 10; i++)
                soma += int.Parse(TempCPF[i].ToString()) * mt2[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            Digito = Digito + resto.ToString();

            return CPF.EndsWith(Digito);
        }
    }
        
}