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
    /// Summary description for GerenciadorPsicoEspiritualTest
    /// </summary>
    [TestClass]
    public class GerenciadorPsicoEspiritualTest
    {
        [TestMethod()]
        public void PV40AtualizarNecessidadesPsicoespirituaisValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorPsicoEspiritual gerenciadorPsicoEspiritual = GerenciadorPsicoEspiritual.GetInstance();
            PsicoEspiritualModel psicoEspiritual = gerenciadorPsicoEspiritual.Obter(idConsultaVariavel);
            Assert.IsNotNull(psicoEspiritual);
            psicoEspiritual.IdConsultaVariavel = 100;
            psicoEspiritual.Ansiedade = true;
            psicoEspiritual.Apatico = false;
            psicoEspiritual.BaixoAutoEstima = true;
            psicoEspiritual.BuscaAssistenciaEspiritual = true;
            psicoEspiritual.Choro = false;
            psicoEspiritual.CrencaReligiosa = null;
            psicoEspiritual.DisturbiosSono = false;
            psicoEspiritual.EspecificaAssistenciaEspiritual = null;
            psicoEspiritual.Estresse = true;
            psicoEspiritual.PreocupacaoMorte = true;
            psicoEspiritual.Raiva = true;

            try
            {
                gerenciadorPsicoEspiritual.Atualizar(psicoEspiritual);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }

            PsicoEspiritualModel psicoEspiritualAtualizado = gerenciadorPsicoEspiritual.Obter(idConsultaVariavel);

            Assert.Equals(psicoEspiritualAtualizado.Ansiedade, false);
            Assert.Equals(psicoEspiritualAtualizado.Apatico, false);
            Assert.Equals(psicoEspiritualAtualizado.BaixoAutoEstima, false);
            Assert.Equals(psicoEspiritualAtualizado.BuscaAssistenciaEspiritual, false);
            Assert.Equals(psicoEspiritualAtualizado.Choro, false);
            Assert.IsNull(psicoEspiritualAtualizado.CrencaReligiosa);
            Assert.Equals(psicoEspiritualAtualizado.DisturbiosSono, false);
            Assert.IsNull(psicoEspiritualAtualizado.EspecificaAssistenciaEspiritual);
            Assert.Equals(psicoEspiritualAtualizado.Estresse, false);
            Assert.Equals(psicoEspiritualAtualizado.HumorDeprimido, false);
            Assert.Equals(psicoEspiritualAtualizado.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(psicoEspiritualAtualizado.Negacao, false);
            Assert.Equals(psicoEspiritualAtualizado.PreocupacaoMorte, false);
            Assert.Equals(psicoEspiritualAtualizado.Raiva, false);
        }

        [TestMethod()]
        public void PV41AtualizarNecessidadesPsicoespirituaisInvalida()
        {
            long idConsultaVariavel = 100;
            GerenciadorPsicoEspiritual gerenciadorPsicoEspiritual = GerenciadorPsicoEspiritual.GetInstance();
            PsicoEspiritualModel psicoEspiritual = gerenciadorPsicoEspiritual.Obter(idConsultaVariavel);
            Assert.IsNotNull(psicoEspiritual);
            psicoEspiritual.IdConsultaVariavel = -1;
            psicoEspiritual.Ansiedade = true;
            psicoEspiritual.Apatico = false;
            psicoEspiritual.BaixoAutoEstima = true;
            psicoEspiritual.BuscaAssistenciaEspiritual = true;
            psicoEspiritual.Choro = false;
            psicoEspiritual.CrencaReligiosa = null;
            psicoEspiritual.DisturbiosSono = false;
            psicoEspiritual.EspecificaAssistenciaEspiritual = null;
            psicoEspiritual.Estresse = true;
            psicoEspiritual.PreocupacaoMorte = true;
            psicoEspiritual.Raiva = true;

            try
            {
                gerenciadorPsicoEspiritual.Atualizar(psicoEspiritual);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }

            PsicoEspiritualModel psicoEspiritualAtualizado = gerenciadorPsicoEspiritual.Obter(idConsultaVariavel);
            Assert.Equals(psicoEspiritualAtualizado.Ansiedade, false);
            Assert.Equals(psicoEspiritualAtualizado.Apatico, false);
            Assert.Equals(psicoEspiritualAtualizado.BaixoAutoEstima, false);
            Assert.Equals(psicoEspiritualAtualizado.BuscaAssistenciaEspiritual, false);
            Assert.Equals(psicoEspiritualAtualizado.Choro, false);
            Assert.IsNull(psicoEspiritualAtualizado.CrencaReligiosa);
            Assert.Equals(psicoEspiritualAtualizado.DisturbiosSono, false);
            Assert.IsNull(psicoEspiritualAtualizado.EspecificaAssistenciaEspiritual);
            Assert.Equals(psicoEspiritualAtualizado.Estresse, false);
            Assert.Equals(psicoEspiritualAtualizado.HumorDeprimido, false);
            Assert.Equals(psicoEspiritualAtualizado.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(psicoEspiritualAtualizado.Negacao, false);
            Assert.Equals(psicoEspiritualAtualizado.PreocupacaoMorte, false);
            Assert.Equals(psicoEspiritualAtualizado.Raiva, false);
        }
    }
}
