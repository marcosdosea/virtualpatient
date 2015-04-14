using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;
using System.Collections.Generic;
using System.Linq;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorPessoaTest and is intended
    ///to contain all GerenciadorPessoaTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorPessoaTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion



        /// <summary>
        ///A test for Atualizar
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [UrlToTest("http://localhost:29774/")]
        public void AtualizarTest()
        {
            GerenciadorPessoa target = GerenciadorPessoa.GetInstance();
            PessoaModel pessoa = GerenciadorPessoa.GetInstance().Obter(1);
            PessoaModel pessoaCriada = new PessoaModel();   
            pessoaCriada.Cpf = "99687844515";
            pessoaCriada.IdPessoa = 1;
            pessoaCriada.IdUser = 1;
            pessoaCriada.Nome = "Administrador";
            pessoa.Nome = "Administrador";
            target.Atualizar(pessoa);
            Assert.AreEqual(pessoa, pessoaCriada);
        }

        /// <summary>
        ///Um teste de GetQuery
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [UrlToTest("http://localhost:29774/")]
        [DeploymentItem("PacienteVirtual.dll")]
        public void GetQueryTest()
        {
            PessoaModel pessoa = GerenciadorPessoa.GetInstance().Obter(1);
            PessoaModel pessoaCriada = new PessoaModel();
            pessoaCriada.Cpf = "99687844515";
            pessoaCriada.IdPessoa = 1;
            pessoaCriada.IdUser = 1;
            pessoaCriada.Nome = "Administrador";
            pessoa.Nome = "Administrador";
            Assert.AreEqual(pessoa, pessoaCriada);
        }

        /// <summary>
        ///A test for Inserir
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [UrlToTest("http://localhost:29774/")]
        public void InserirTest()
        {
            GerenciadorPessoa target = GerenciadorPessoa.GetInstance();
            PessoaModel pessoaCriada = new PessoaModel();
            pessoaCriada.Cpf = "99687844515";
            pessoaCriada.IdPessoa = 1;
            pessoaCriada.IdUser = 1;
            pessoaCriada.Nome = "Administrador";
            target.Inserir(pessoaCriada);
            PessoaModel actual = target.Obter(1);
            Assert.AreEqual(pessoaCriada, actual);
        }

        /// <summary>
        ///A test for Obter
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        public void ObterTest()
        {
            PessoaModel pessoaBanco = GerenciadorPessoa.GetInstance().Obter(1);
            PessoaModel pessoaCriada = new PessoaModel();
            pessoaCriada.Cpf = "99687844515";
            pessoaCriada.IdPessoa = 1;
            pessoaCriada.IdUser = 1;
            pessoaCriada.Nome = "Admin";
            Assert.AreEqual(pessoaBanco, pessoaCriada);
        }


        /// <summary>
        ///A test for ObterPorCPF
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        public void ObterPorCPFTest()
        {
            PessoaModel pessoaBanco = GerenciadorPessoa.GetInstance().ObterPorCPF("99687844515");
            PessoaModel pessoaCriada = new PessoaModel();
            pessoaCriada.Cpf = "99687844515";
            pessoaCriada.IdPessoa = 1;
            pessoaCriada.IdUser = 1;
            pessoaCriada.Nome = "Admin";
            Assert.AreEqual(pessoaBanco, pessoaCriada);
        }

        /// <summary>
        ///A test for ObterPorNome
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        public void ObterPorNomeTest()
        {
            PessoaModel pessoaBanco = GerenciadorPessoa.GetInstance().ObterPorNome("Admin");
            PessoaModel pessoaCriada = new PessoaModel();
            pessoaCriada.Cpf = "99687844515";
            pessoaCriada.IdPessoa = 1;
            pessoaCriada.IdUser = 1;
            pessoaCriada.Nome = "Admin";
            Assert.AreEqual(pessoaBanco, pessoaCriada);
        }

    }
}
