using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorExperienciaMedicamentosTest and is intended
    ///to contain all GerenciadorExperienciaMedicamentosTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorExperienciaMedicamentosTest
    {


        /// <summary>
        ///A test for Atualizar
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        public void AtualizarTestValido()
        {
            long idConsultaFixo = 6;
            GerenciadorExperienciaMedicamentos experieciaMed = GerenciadorExperienciaMedicamentos.GetInstance();
            ExperienciaMedicamentosModel experienciaModel = experieciaMed.Obter(idConsultaFixo);
            Assert.IsNotNull(experienciaModel);
            AtualizarCombos(experienciaModel);
            AtualizarChecks(experienciaModel);


            experieciaMed.Atualizar(experienciaModel);

            ExperienciaMedicamentosModel experienciaModelAtualizado = experieciaMed.Obter(idConsultaFixo);
            Assert.IsNotNull(experienciaModelAtualizado);
            Assert.Equals(experienciaModelAtualizado.IdRespostaComportamento, 3);
            Assert.Equals(experienciaModelAtualizado.IdRespostaCultural, 3);
            Assert.Equals(experienciaModelAtualizado.IdRespostaEsperaTratamento, 3);
            Assert.Equals(experienciaModelAtualizado.IdRespostaGrauEntendimento, 3);
            Assert.Equals(experienciaModelAtualizado.IdRespostaIncorporadoPlano, 3);
            Assert.Equals(experienciaModelAtualizado.IdRespostaPreocupacoes, 3);
            Assert.Equals(experienciaModelAtualizado.AtencaoComportamento, false);
            Assert.Equals(experienciaModelAtualizado.AtencaoCultural, false);
            Assert.Equals(experienciaModelAtualizado.AtencaoEsperaTratamento, false);
            Assert.Equals(experienciaModelAtualizado.AtencaoGrauEntendimento, false);
            Assert.Equals(experienciaModelAtualizado.AtencaoPreocupacoes, false);
        }

        private static void AtualizarChecks(ExperienciaMedicamentosModel experienciaModel)
        {
            experienciaModel.AtencaoComportamento = false;
            experienciaModel.AtencaoCultural = false;
            experienciaModel.AtencaoEsperaTratamento = false;
            experienciaModel.AtencaoGrauEntendimento = false;
            experienciaModel.AtencaoPreocupacoes = false;
        }

        private static void AtualizarCombos(ExperienciaMedicamentosModel experienciaModel)
        {
            experienciaModel.IdRespostaComportamento = 3;
            experienciaModel.IdRespostaCultural = 3;
            experienciaModel.IdRespostaEsperaTratamento = 3;
            experienciaModel.IdRespostaGrauEntendimento = 3;
            experienciaModel.IdRespostaIncorporadoPlano = 3;
            experienciaModel.IdRespostaPreocupacoes = 3;
        }


        public void AtualizarTestInvalido()
        {
            long idConsultaFixo = 6;
            GerenciadorExperienciaMedicamentos experieciaMed = GerenciadorExperienciaMedicamentos.GetInstance();
            ExperienciaMedicamentosModel experienciaModel = experieciaMed.Obter(idConsultaFixo);
            Assert.IsNotNull(experienciaModel);
            AtualizarCombos(experienciaModel);
            AtualizarChecks(experienciaModel);
            experienciaModel.IdRespostaPreocupacoes = 123;

            experieciaMed.Atualizar(experienciaModel);

            ExperienciaMedicamentosModel experienciaModelAtualizado = experieciaMed.Obter(idConsultaFixo);
            Assert.IsNotNull(experienciaModelAtualizado);
            Assert.Equals(experienciaModel, experienciaModelAtualizado);
        }
    }
}
