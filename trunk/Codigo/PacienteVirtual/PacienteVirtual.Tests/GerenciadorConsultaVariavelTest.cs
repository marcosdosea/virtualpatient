using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorConsultaVariavelTest and is intended
    ///to contain all GerenciadorConsultaVariavelTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorConsultaVariavelTest
    {


        /// <summary>
        ///A test for Atualizar
        ///</summary>
        // Teste para Atualizar aba de Clínico Internação 
        [TestMethod()]
        public void AtualizarTest()
        {
            long idConsultaFixo = 6;
            GerenciadorConsultaVariavel consultaVariavel = GerenciadorConsultaVariavel.GetInstance();
            ConsultaVariavelModel clinicoInternacao = consultaVariavel.Obter(idConsultaFixo);
            Assert.IsNotNull(clinicoInternacao);
            clinicoInternacao.IdConsultaVariavel = 2;
            clinicoInternacao.IdTurma = 1;
            clinicoInternacao.IdPessoa = 1;
            clinicoInternacao.IdRelato = 1;
            clinicoInternacao.IdRazaoEncontro = 3;
            clinicoInternacao.IdEstadoConsulta = 2;

            consultaVariavel.Atualizar(clinicoInternacao);

            ConsultaVariavelModel clinicoInternacaoAtualizado = consultaVariavel.Obter(idConsultaFixo);
            Assert.IsNotNull(clinicoInternacaoAtualizado);
            Assert.Equals(clinicoInternacaoAtualizado.IdConsultaVariavel, 1);
            Assert.Equals(clinicoInternacaoAtualizado.IdTurma, 1);
            Assert.Equals(clinicoInternacaoAtualizado.IdPessoa, 1);
            Assert.Equals(clinicoInternacaoAtualizado.IdRelato, 1);
            Assert.Equals(clinicoInternacaoAtualizado.IdRazaoEncontro, 3);
            Assert.Equals(clinicoInternacaoAtualizado.IdEstadoConsulta, 2);
        }
    }
}
