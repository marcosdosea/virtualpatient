using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorTermorregulacaoTest and is intended
    ///to contain all GerenciadorTermorregulacaoTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorTermorregulacaoTest
    {

        /// <summary>
        ///Teste para Atualizar aba de Termorregulação
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        public void AtualizarTestValido()
        {
            long idConsultaVariavel = 82;
            GerenciadorTermorregulacao termoGerenciador = GerenciadorTermorregulacao.GetInstance();
            TermorregulacaoModel termo = termoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(termo);
            termo.Temperatura = 38.00;
            termo.TemperaturaPele = ListaTemperaturaPele.Normotermica;
            termo.Sudorese = false;
            termo.Calafrio = true;
            termo.Piloerecao = false;

            termoGerenciador.Atualizar(termo);

            TermorregulacaoModel termoAtualizado = termoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(termoAtualizado);
            Assert.Equals(termoAtualizado.IdConsultaVariavel, 82);
            Assert.Equals(termoAtualizado.TemperaturaPele, ListaTemperaturaPele.Normotermica);
            Assert.Equals(termoAtualizado.Sudorese, false);
            Assert.Equals(termoAtualizado.Calafrio, true);
            Assert.Equals(termoAtualizado.Piloerecao, false);
        }

        public void AtualizarTestInvalido()
        {
            long idConsultaVariavel = 82;
            GerenciadorTermorregulacao termoGerenciador = GerenciadorTermorregulacao.GetInstance();
            TermorregulacaoModel termo = termoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(termo);
            idConsultaVariavel = -1;
            termo.Temperatura = 38.00;
            termo.TemperaturaPele = ListaTemperaturaPele.Normotermica;
            termo.Sudorese = false;
            termo.Calafrio = true;
            termo.Piloerecao = false;

            termoGerenciador.Atualizar(termo);

            TermorregulacaoModel termoAtualizado = termoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(termoAtualizado);
            Assert.Equals(termoAtualizado.IdConsultaVariavel, 82);
            Assert.Equals(termoAtualizado.TemperaturaPele, ListaTemperaturaPele.Normotermica);
            Assert.Equals(termoAtualizado.Sudorese, false);
            Assert.Equals(termoAtualizado.Calafrio, true);
            Assert.Equals(termoAtualizado.Piloerecao, false);
        }
    }
}
