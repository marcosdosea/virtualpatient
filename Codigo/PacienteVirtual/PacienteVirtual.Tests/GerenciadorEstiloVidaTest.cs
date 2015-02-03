using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorEstiloVidaTest and is intended
    ///to contain all GerenciadorEstiloVidaTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorEstiloVidaTest
    {

        /// <summary>
        ///A test for Atualizar
        ///</summary>
        [TestMethod()]
        public void AtualizarTest()
        {
            long idConsultaVariavel = 21;
            GerenciadorEstiloVida estiloVida = GerenciadorEstiloVida.GetInstance();
            EstiloVidaModel estiloModel = estiloVida.Obter(idConsultaVariavel);
            Assert.IsNotNull(estiloModel);
            estiloModel.TabacoConsumo = false;
            estiloModel.TabacoUso = 4;
            estiloModel.TabacoParou = "30 anos";
            estiloModel.CafeConsumo = true;
            estiloModel.CafeUso = 2;
            estiloModel.AlcoolConsumo = true;
            estiloModel.AlcoolUso = 4;

            estiloVida.Atualizar(estiloModel);

            EstiloVidaModel estiloModelAtualizado = estiloVida.Obter(idConsultaVariavel);
            Assert.IsNotNull(estiloModelAtualizado);
            Assert.Equals(estiloModelAtualizado.IdConsultaVariavel, 21);
            Assert.Equals(estiloModelAtualizado.TabacoConsumo, false);
            Assert.Equals(estiloModelAtualizado.TabacoUso, 4);
            Assert.Equals(estiloModelAtualizado.TabacoParou, "30 anos");
            Assert.Equals(estiloModelAtualizado.CafeConsumo, true);
            Assert.Equals(estiloModelAtualizado.CafeUso, 2);
            Assert.Equals(estiloModelAtualizado.AlcoolConsumo, true);
            Assert.Equals(estiloModelAtualizado.AlcoolUso, 4);
        }
    }
}
