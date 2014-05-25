using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Controllers;
using System.Text;
using System.Globalization;
using System.Web.Mvc;

namespace PacienteVirtual.Models
{
    public class Global
    {
        public const string cursoEnfermagem = "Bacharelado em Enfermagem";
        public const string cursoFarmacia = "Bacharelado em Farmácia";
        public const int idCursoEnfermagem = 2;
        public const int idCursoFarmacia = 1;

        public const int abaCarta = 3;
        public const int abaConsultaParametro = 11;
        public const int abaRazaoEncontro = 2;
        public const int abaRevisaoSistema = 12;
        public const int abaClassificacaoPRM = 1;
        public const int abaDemoAntrop = 1;
        public const int abaDiarioPessoal = 4;
        public const int abaEstiloVida = 4;
        public const int abaExamesFisicos = 10;
        public const int abaAlergia = 5;
        public const int abaExpMed = 3;
        public const int abaHistoria = 9;
        public const int abaIntervencao = 2;
        public const int abaMedNaoPresc = 7;
        public const int abaMedPresc = 6;
        public const int abaMedAnte = 8;

        public const int NaoSelecionado = -1;
        public const int ValorInteiroNulo = 0;
        public const double ValorDoubleNulo = 0.0;
        public const int ValorInicial = 1;
        public const string stringVazia = "";
        public const string CharVazia = " ";
        public const int ValorInicialDadosExpMed = 3;

        public const string stringUsuarioRole = "usuario";
        public const string stringAdministradorRole = "administrador";
        public const string stringTutorRole = "tutor";
        public const string stringAdministradorEnfermagem = "administrador_farmacia";
        public const string stringAdministradorFarmacia = "administrador_enfermagem";

        public static void ZeraSessaoConsulta()
        {
            // zerando sessão para ir no banco ir pegar os dados com o devido IdVariavel
            SessionController.Sistema = 0;
            SessionController.IdGrupoIntervencao = 0;
            SessionController.ConsultaFixo = null;
            SessionController.ConsultaVariavel = null;
            SessionController.DemograficosAntropometricos = null;
            SessionController.Paciente = null;
            SessionController.RelatoClinico = null;
            SessionController.ErroConsultaVariavelQueixa2 = "";
            SessionController.ErroQueixaMedicamento = "";
            SessionController.Abas1 = 0;
            SessionController.Abas2 = -1;

            if (SessionController.DadosTurmaPessoa.Curso.Equals(cursoFarmacia))
            {
                ZeraSessaoConsultaFarmacia();
            }
            else 
            {
                ZeraSessaoConsultaEnfermagem();
            }
        }

        private static void ZeraSessaoConsultaEnfermagem()
        {
            SessionController.ClinicoInternacao = null;
            SessionController.ListaClinicoInternacaoAlergia = null;
            SessionController.ListaAntecedentesFamiliares = null;
            SessionController.ListaAntecedentesPatologicos = null;
            SessionController.ListaPatologiasAtuais = null;
            SessionController.PsicoEspiritual = null;
            SessionController.Higiene = null;
            SessionController.IntegridadeTecidual = null;
            SessionController.Oxigenacao = null;
            SessionController.Termorregulacao = null;
            SessionController.Nutricao = null;
            SessionController.Comunicacao = null;
            SessionController.Sensorial = null;
            SessionController.OutrasNecessidades = null;
            SessionController.Sexualidade = null;
        }

        private static void ZeraSessaoConsultaFarmacia()
        {
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
            SessionController.ListaAlergia = null;
            SessionController.ListaQueixaMedicamento = null;
            SessionController.ListaIntervencaoConsulta = null;
            SessionController.ListaCarta = null;
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
        public const int GabaritoEmPreenchimento = 8;

        // roles
        public const int Administrador = 1;
        public const int Usuario = 2;
        public const int Tutor = 3;
        public const int AdministradorEnfermagem = 4;
        public const int AdministradorFarmacia = 5;

        public const int IdRazaoEncontro = 1;

        public const int TurmaAdminEnfermagem = 4;
        public const int TurmaAdminFarmacia = 5;

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

        //metodo para correção de string já adicionando no ModelState
        public static void CorrecaoDeStrings(string variavelModel,string resposta, string gabarito, ModelStateDictionary modelState)
        {
            if (resposta == null || resposta.Equals(""))
            {
                if (gabarito != null || !gabarito.Equals(""))
                {
                    modelState.AddModelError(variavelModel, "Gabarito: \"" + gabarito + "\"");
                }
            }
            else
            {
                if (gabarito == null || gabarito.Equals(""))
                {
                    modelState.AddModelError(variavelModel, "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
                else if (!Global.RemoverAcentuacao(resposta.ToLower()).Equals(Global.RemoverAcentuacao(gabarito.ToLower())))
                {
                    modelState.AddModelError(variavelModel, "Gabarito: \"" + gabarito + "\"");
                }
            }
        }

    }
        
}