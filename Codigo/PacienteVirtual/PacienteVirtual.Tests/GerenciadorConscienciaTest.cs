using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    /// <summary>
    /// Summary description for GerenciadorConscienciaTest
    /// </summary>
    [TestClass]
    public class GerenciadorConscienciaTest
    {

        [TestMethod()]
        public void PV19_AtualizarAvaliacaoNivelConscienciaInvalido()
        {
            long idConsultaVariavel = 100;
            GerenciadorConsciencia gerenciadorConsciencia = GerenciadorConsciencia.GetInstance();
            ConscienciaModel consciencia = gerenciadorConsciencia.Obter(idConsultaVariavel);
            Assert.IsNotNull(consciencia);
            consciencia.AberturaOcular = ListaAberturaOcular.EstimuloVerbal;
            consciencia.AvaliacaoConscienciaGlasgow = 3;
            consciencia.AvaliacaoSedacao = ListaAvaliacaoSedacao.Grau4;
            consciencia.MelhorRespostaMotora = ListaMelhorRespostaMotora.FlexaoRetirada;
            consciencia.MelhorRespostaVerbal = ListaMelhorRespostaVerbal.Orientado;
            consciencia.IdConsultaVariavel = -2;

            try
            {
                gerenciadorConsciencia.Atualizar(consciencia);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }

            ConscienciaModel conscienciaAtualizada = gerenciadorConsciencia.Obter(idConsultaVariavel);
            Assert.Equals(conscienciaAtualizada.AberturaOcular, ListaAberturaOcular.NenhumaResposta);
            Assert.Equals(conscienciaAtualizada.AvaliacaoConscienciaGlasgow, 0);
            Assert.Equals(conscienciaAtualizada.AvaliacaoSedacao, ListaAvaliacaoSedacao.Grau1);
            Assert.Equals(conscienciaAtualizada.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(conscienciaAtualizada.MelhorRespostaMotora, ListaMelhorRespostaMotora.NenhumaResposta);
            Assert.Equals(conscienciaAtualizada.MelhorRespostaVerbal, ListaMelhorRespostaVerbal.NenhumaResposta);
        }

    }
}
