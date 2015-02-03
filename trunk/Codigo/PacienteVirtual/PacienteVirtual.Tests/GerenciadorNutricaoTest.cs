using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorNutricaoTest and is intended
    ///to contain all GerenciadorNutricaoTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorNutricaoTest
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
            GerenciadorNutricao nutricaoGerenciador = GerenciadorNutricao.GetInstance();
            NutricaoModel nutricao = nutricaoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(nutricao);
            nutricao.Peso = 0;
            nutricao.Altura = 0;
            nutricao.EstadoNutricional = ListaEstadoNutricional.PesoNormal;
            nutricao.NutricaoOral = false;
            nutricao.Disfagia = false;
            nutricao.DificuldadeMastigar= false;
            nutricao.SangramentoGengival= false;
            nutricao.AusenciaDentes= false;
            nutricao.Nausea = false;
            nutricao.Emese= false;
            nutricao.Pirose= false;
            nutricao.IngestaHidrica = false;
            nutricao.IngestaHidricaValor = 0;
            nutricao.RestricaoHidricaValor = 0;
            nutricao.RestricaoHidrica = false;
            nutricao.SemRestricao = true;
            nutricao.RestricaoAlimentar = false;
            nutricao.RestricaoAlimentarTexto= null;
            nutricao.HabitosAlimentares= null;
            nutricao.DispositivosAlimentacao= ListaDispositivosAlimentacao.NaoSeAplica;
            nutricao.Instalada= Convert.ToDateTime("03/07/2014");
            nutricao.SemRestricaoAlimentar = false;

            nutricaoGerenciador.Atualizar(nutricao);

            NutricaoModel nutricaoAtualizado = nutricaoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(nutricaoAtualizado);
            Assert.Equals(nutricaoAtualizado.IdConsultaVariavel, 82);
            Assert.Equals(nutricaoAtualizado.Peso, 0);
            Assert.Equals(nutricaoAtualizado.Altura, 0);
            Assert.Equals(nutricaoAtualizado.NutricaoOral, false);
            Assert.Equals(nutricaoAtualizado.Disfagia, false);
            Assert.Equals(nutricaoAtualizado.DificuldadeMastigar, false);
            Assert.Equals(nutricaoAtualizado.SangramentoGengival, false);
            Assert.Equals(nutricaoAtualizado.AusenciaDentes, false);
            Assert.Equals(nutricaoAtualizado.Nausea, false);
            Assert.Equals(nutricaoAtualizado.Emese, false);
            Assert.Equals(nutricaoAtualizado.Pirose, false);
            Assert.Equals(nutricaoAtualizado.IngestaHidrica, false);
            Assert.Equals(nutricaoAtualizado.IngestaHidricaValor, 0);
            Assert.Equals(nutricaoAtualizado.SemRestricao, true);
            Assert.Equals(nutricaoAtualizado.RestricaoAlimentar, false);
            Assert.Equals(nutricaoAtualizado.RestricaoAlimentarTexto, null);
            Assert.Equals(nutricaoAtualizado.HabitosAlimentares, null);
            Assert.Equals(nutricaoAtualizado.DispositivosAlimentacao, ListaDispositivosAlimentacao.NaoSeAplica);
            Assert.Equals(nutricaoAtualizado.Instalada, Convert.ToDateTime("03/07/2014"));
            Assert.Equals(nutricaoAtualizado.SemRestricaoAlimentar, false);
        }

        public void AtualizarTestInvalido()
        {
            long idConsultaVariavel = 82;
            GerenciadorNutricao nutricaoGerenciador = GerenciadorNutricao.GetInstance();
            NutricaoModel nutricao = nutricaoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(nutricao);
            idConsultaVariavel = -1;
            nutricao.Peso = 0;
            nutricao.Altura = 0;
            nutricao.EstadoNutricional = ListaEstadoNutricional.PesoNormal;
            nutricao.NutricaoOral = false;
            nutricao.Disfagia = false;
            nutricao.DificuldadeMastigar = false;
            nutricao.SangramentoGengival = false;
            nutricao.AusenciaDentes = false;
            nutricao.Nausea = false;
            nutricao.Emese = false;
            nutricao.Pirose = false;
            nutricao.IngestaHidrica = false;
            nutricao.IngestaHidricaValor = 0;
            nutricao.RestricaoHidricaValor = 0;
            nutricao.RestricaoHidrica = false;
            nutricao.SemRestricao = true;
            nutricao.RestricaoAlimentar = false;
            nutricao.RestricaoAlimentarTexto = null;
            nutricao.HabitosAlimentares = null;
            nutricao.DispositivosAlimentacao = ListaDispositivosAlimentacao.NaoSeAplica;
            nutricao.Instalada = Convert.ToDateTime("03/07/2014");
            nutricao.SemRestricaoAlimentar = false;

            nutricaoGerenciador.Atualizar(nutricao);

            NutricaoModel nutricaoAtualizado = nutricaoGerenciador.Obter(idConsultaVariavel);
            Assert.IsNotNull(nutricaoAtualizado);
            Assert.Equals(nutricaoAtualizado, nutricao);
        }
    }
}
