using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;
using System.Linq;
using System.Collections.Generic;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorTurmaPessoaTest and is intended
    ///to contain all GerenciadorTurmaPessoaTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorTurmaPessoaTest
    {


        /// <summary>
        ///A test for Inserir
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:29774/")]
        public void InserirTest()
        {
            GerenciadorTurmaPessoa_Accessor target = new GerenciadorTurmaPessoa_Accessor();
            TurmaPessoaModel tpCriada = new TurmaPessoaModel();
            tpCriada.IdTurma = 1;
            tpCriada.IdPessoa = 5;
            tpCriada.IdRole = 3;
            tpCriada.Ativa = true;
            target.Inserir(tpCriada);
            TurmaPessoaModel actual = target.ObterPorTurmaPessoa(1,5);
            Assert.AreEqual(tpCriada, actual);
        }

        /// <summary>
        ///A test for ObterAlunosPorTurma
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:29774/")]
        public void ObterAlunosPorTurmaTest()
        {
            IEnumerable<TurmaPessoaModel> tpBanco = GerenciadorTurmaPessoa.GetInstance().ObterAlunosPorTurma(2);
            List<TurmaPessoaModel> tpCriada = new List<TurmaPessoaModel>();
            TurmaPessoaModel tp1 = new TurmaPessoaModel();
            tp1.IdTurma = 2;
            tp1.IdPessoa = 5;
            tp1.IdRole = 3;
            tp1.Ativa = true;
            tpCriada.Add(tp1);
            TurmaPessoaModel tp2 = new TurmaPessoaModel();
            tp2.IdTurma = 2;
            tp2.IdPessoa = 11;
            tp2.IdRole = 3;
            tp2.Ativa = true;
            tpCriada.Add(tp2);
            Assert.AreEqual(tpBanco, tpCriada);
        }

        /// <summary>
        ///A test for ObterTurmasPorPessoa
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:29774/")]
        public void ObterTurmasPorPessoaTest()
        {
            IEnumerable<TurmaPessoaModel> tpBanco = GerenciadorTurmaPessoa.GetInstance().ObterTurmasPorPessoa(12);
            List<TurmaPessoaModel> tpCriada = new List<TurmaPessoaModel>();
            TurmaPessoaModel tp1 = new TurmaPessoaModel();
            tp1.IdTurma = 1;
            tp1.IdPessoa = 12;
            tp1.IdRole = 3;
            tp1.Ativa = true;
            tpCriada.Add(tp1);
            Assert.AreEqual(tpBanco, tpCriada);
        }

        /// <summary>
        ///A test for QuantidadeSolicitacoesNaturma
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:29774/")]
        public void QuantidadeSolicitacoesNaturmaTest()
        {
            int qtdSolicitacoes = GerenciadorTurmaPessoa.GetInstance().QuantidadeSolicitacoesNaturma(10, 2);
            GerenciadorTurmaPessoa_Accessor target = new GerenciadorTurmaPessoa_Accessor();
            int idPessoa = 10; 
            int idTurma = 3; 
            int expected = 0;
            int actual;
            actual = target.QuantidadeSolicitacoesNaturma(idPessoa, idTurma);
            Assert.AreEqual(expected, actual);
        }
    }
}
