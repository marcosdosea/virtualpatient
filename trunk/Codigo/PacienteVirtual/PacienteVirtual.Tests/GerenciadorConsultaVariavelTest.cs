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

        [TestMethod()]
        public void PV44AtualizarDadosComplementaresValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorConsultaVariavel gerenciadorConsultaVariavel = GerenciadorConsultaVariavel.GetInstance();
            ConsultaVariavelModel consultaVariavel = gerenciadorConsultaVariavel.Obter(idConsultaVariavel);
            Assert.IsNotNull(consultaVariavel);
            consultaVariavel.DescricaoDadosComplementares = "Nada a acrescentar";

            gerenciadorConsultaVariavel.Atualizar(consultaVariavel);

            ConsultaVariavelModel consultaVariavelAtualizada = gerenciadorConsultaVariavel.Obter(idConsultaVariavel);
            Assert.Equals(consultaVariavelAtualizada.DescricaoDadosComplementares, "Nada a acrescentar");
        }

        public void PV46AtualizarOutrosAchadosValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorConsultaVariavel gerenciadorConsultaVariavel = GerenciadorConsultaVariavel.GetInstance();
            ConsultaVariavelModel consultaVariavel = gerenciadorConsultaVariavel.Obter(idConsultaVariavel);
            Assert.IsNotNull(consultaVariavel);
            consultaVariavel.DescricaoOutrosAchados = "O paciente apresentou febre alta";

            gerenciadorConsultaVariavel.Atualizar(consultaVariavel);

            ConsultaVariavelModel consultaVariavelAtualizada = gerenciadorConsultaVariavel.Obter(idConsultaVariavel);
            Assert.Equals(consultaVariavelAtualizada.DescricaoOutrosAchados, "O paciente apresentou febre alta");
        }
    }
}
