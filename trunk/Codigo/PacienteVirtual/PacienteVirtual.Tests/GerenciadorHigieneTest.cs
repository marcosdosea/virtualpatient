using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorHigieneTest and is intended
    ///to contain all GerenciadorHigieneTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorHigieneTest
    {
        /// <summary>
        ///A test for Atualizar
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        public void AtualizarTestValido()
        {
            long idConsultaVariavel = 82;
            GerenciadorHigiene higieneGerenciador = GerenciadorHigiene.GetInstance();
            HigieneModel higiene = higieneGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(higiene);
            higiene.Satisfatoria = true;
            higiene.NecessitaHigieneIntima = true;
            higiene.NecessitaBanhoLeito = true;
            higiene.CabelosPediculose = false;
            higiene.CabelosSeborreia = false;
            higiene.CabelosAlopecia = false;
            higiene.CabelosQuebradicos = false;
            higiene.OralRessecamento = false;
            higiene.OralHalitose = false;
            higiene.OralLinguaSaburrosa = false;
            higiene.OralCarie = false;
            higiene.OralUlceracao = false;

            higieneGerenciador.Atualizar(higiene);

            HigieneModel higieneAtualizado = higieneGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(higieneAtualizado);
            Assert.Equals(higieneAtualizado.IdConsultaVariavel, 82);
            Assert.Equals(higieneAtualizado.Satisfatoria, true);
            Assert.Equals(higieneAtualizado.NecessitaHigieneIntima, true);
            Assert.Equals(higieneAtualizado.NecessitaBanhoLeito, true);
            Assert.Equals(higieneAtualizado.CabelosPediculose, false);
            Assert.Equals(higieneAtualizado.CabelosSeborreia, false);
            Assert.Equals(higieneAtualizado.CabelosAlopecia, false);
            Assert.Equals(higieneAtualizado.CabelosQuebradicos, false);
            Assert.Equals(higieneAtualizado.OralHalitose, false);
            Assert.Equals(higieneAtualizado.OralLinguaSaburrosa, false);
            Assert.Equals(higieneAtualizado.OralCarie, false);
            Assert.Equals(higieneAtualizado.OralUlceracao, false);
        }


        public void AtualizarTestInvalido()
        {
            long idConsultaVariavel = 82;
            GerenciadorHigiene higieneGerenciador = GerenciadorHigiene.GetInstance();
            HigieneModel higiene = higieneGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(higiene);
            idConsultaVariavel = -1;
            higiene.Satisfatoria = true;
            higiene.NecessitaHigieneIntima = true;
            higiene.NecessitaBanhoLeito = true;
            higiene.CabelosPediculose = false;
            higiene.CabelosSeborreia = false;
            higiene.CabelosAlopecia = false;
            higiene.CabelosQuebradicos = false;
            higiene.OralRessecamento = false;
            higiene.OralHalitose = false;
            higiene.OralLinguaSaburrosa = false;
            higiene.OralCarie = false;
            higiene.OralUlceracao = false;

            higieneGerenciador.Atualizar(higiene);

            HigieneModel higieneAtualizado = higieneGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(higieneAtualizado);
            Assert.Equals(higieneAtualizado, higiene);
        }
    }
}
