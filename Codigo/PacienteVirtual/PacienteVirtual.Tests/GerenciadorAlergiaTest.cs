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
    ///This is a test class for GerenciadorAlergiaTest and is intended
    ///to contain all GerenciadorAlergiaTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorAlergiaTest
    {



        /// <summary>
        ///Teste para Atualizar
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\nagem\\Desktop\\PV\\Codigo\\PacienteVirtual\\PacienteVirtual", "/")]
        [UrlToTest("http://localhost:29774/")]
        public void AtualizarTest()
        {
            GerenciadorAlergia target = GerenciadorAlergia.GetInstance();
            AlergiaModel alergia = GerenciadorAlergia.GetInstance().Obter(1);
            AlergiaModel alergiaCriada = new AlergiaModel();
            alergiaCriada.IdAlergia = 1;
            alergiaCriada.Alergia = "Não Relatou nada";
            alergia.Alergia = "Não Relatou nada";
            target.Atualizar(alergia);
            Assert.AreEqual(alergia, alergiaCriada);
        }


        /// <summary>
        ///A test for Inserir
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\nagem\\Desktop\\PV\\Codigo\\PacienteVirtual\\PacienteVirtual", "/")]
        [UrlToTest("http://localhost:29774/")]
        public void InserirTest()
        {
            GerenciadorAlergia target = GerenciadorAlergia.GetInstance();
            AlergiaModel alergiaCriada = new AlergiaModel();
            alergiaCriada.IdAlergia = 1;
            alergiaCriada.Alergia = "Não Relatou nada";
            target.Inserir(alergiaCriada);
            AlergiaModel actual = target.Obter(1);
            Assert.AreEqual(alergiaCriada, actual);
        }

        /// <summary>
        ///Teste para Obter
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\nagem\\Desktop\\PV\\Codigo\\PacienteVirtual\\PacienteVirtual", "/")]
        [UrlToTest("http://localhost:29774/")]
        public void ObterTest()
        {
            AlergiaModel alergiaBanco = GerenciadorAlergia.GetInstance().Obter(1);
            AlergiaModel alergiaCriada = new AlergiaModel();
            alergiaCriada.IdAlergia = 1;
            alergiaCriada.Alergia = "Não Relatou";
            Assert.AreEqual(alergiaBanco, alergiaCriada);
        }

        /// <summary>
        ///A test for ObterPorNome
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\nagem\\Desktop\\PV\\Codigo\\PacienteVirtual\\PacienteVirtual", "/")]
        [UrlToTest("http://localhost:29774/")]
        public void ObterPorNomeTest()
        {
            AlergiaModel alergiaBanco = (AlergiaModel)GerenciadorAlergia.GetInstance().ObterPorNome("Não Relatou");
            AlergiaModel alergiaCriada = new AlergiaModel();
            alergiaCriada.IdAlergia = 1;
            alergiaCriada.Alergia = "Não Relatou";
            Assert.AreEqual(alergiaBanco, alergiaCriada);
        }


        /// <summary>
        ///A test for Remover
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\nagem\\Desktop\\PV\\Codigo\\PacienteVirtual\\PacienteVirtual", "/")]
        [UrlToTest("http://localhost:29774/")]
        public void RemoverTest()
        {
            GerenciadorAlergia target = GerenciadorAlergia.GetInstance();
            AlergiaModel alergia = GerenciadorAlergia.GetInstance().Obter(1);
            target.Remover(1);
            Assert.IsNull(alergia);
        }
    }
}
