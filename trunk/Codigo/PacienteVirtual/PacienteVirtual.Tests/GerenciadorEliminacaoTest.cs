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
    /// Summary description for GerenciadorEliminacaoTest
    /// </summary>
    [TestClass]
    public class GerenciadorEliminacaoTest
    {
        [TestMethod()]
        public void PV32_AtualizarNecessidadesPsicobiologicasEliminacaoValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorEliminacao gerenciadorEliminacao = GerenciadorEliminacao.GetInstance();
            EliminacaoModel eliminacao = gerenciadorEliminacao.Obter(idConsultaVariavel);
            Assert.IsNotNull(eliminacao);
            eliminacao.Cistostomia = true;
            eliminacao.ColoracaoUrinaria = ListaColoracaoUrinaria.LimpidaClara;
            eliminacao.CondicaoContinenciaUrinaria = ListaCondicaoContinenciaUrinaria.RetencaoUrinaria;
            eliminacao.DebitoUrinario = ListaDebitoUrinario.Normal;
            eliminacao.Disuria = false;
            eliminacao.EsforcoEvacuar = true;
            eliminacao.EstomasCirurgicos = ListaEstomasCirurgicos.NaoSeAplica;
            eliminacao.EvacuacoesDia = 4;
            eliminacao.Flatos = false;
            eliminacao.FormasAbdomem = ListaFormasAbdomem.Retraido;
            eliminacao.Hemorroidas = false;
            eliminacao.IncontinenciaFecal = true;
            eliminacao.PalpacaoAbodminal = ListaPalpacaoAbodminal.Tenso;
            eliminacao.PruridoAnal = false;
            eliminacao.SangramentoRetal = false;
            eliminacao.SonsIntestinais = ListaSonsIntestinais.Diminuidos;
            eliminacao.SVD = false;
            eliminacao.SVDInstalada = Convert.ToDateTime("11/11/2011");
            eliminacao.Tempo = "12:00";
            eliminacao.TiposFezes = ListaTiposFezes.Constipacao;
            eliminacao.TipoSonsPercussao = ListaTipoSonsPercussao.SomMacico;
            eliminacao.UltimaEvacuacao = Convert.ToDateTime("02/02/2015");

            gerenciadorEliminacao.Atualizar(eliminacao);

            EliminacaoModel eliminacaoAtualizada = gerenciadorEliminacao.Obter(idConsultaVariavel);
            Assert.Equals(eliminacaoAtualizada.Cistostomia, true);
            Assert.Equals(eliminacaoAtualizada.ColoracaoUrinaria, ListaColoracaoUrinaria.LimpidaClara);
            Assert.Equals(eliminacaoAtualizada.CondicaoContinenciaUrinaria, ListaCondicaoContinenciaUrinaria.RetencaoUrinaria);
            Assert.Equals(eliminacaoAtualizada.DebitoUrinario, ListaDebitoUrinario.Normal);
            Assert.Equals(eliminacaoAtualizada.Disuria, false);
            Assert.Equals(eliminacaoAtualizada.EsforcoEvacuar, true);
            Assert.Equals(eliminacaoAtualizada.EstomasCirurgicos, ListaEstomasCirurgicos.NaoSeAplica);
            Assert.Equals(eliminacaoAtualizada.EvacuacoesDia, 4);
            Assert.Equals(eliminacaoAtualizada.Flatos, false);
            Assert.Equals(eliminacaoAtualizada.FormasAbdomem, ListaFormasAbdomem.Retraido);
            Assert.Equals(eliminacaoAtualizada.Hemorroidas, false);
            Assert.Equals(eliminacaoAtualizada.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(eliminacaoAtualizada.IncontinenciaFecal, true);
            Assert.Equals(eliminacaoAtualizada.PalpacaoAbodminal, ListaPalpacaoAbodminal.Tenso);
            Assert.Equals(eliminacaoAtualizada.PruridoAnal, false);
            Assert.Equals(eliminacaoAtualizada.SangramentoRetal, false);
            Assert.Equals(eliminacaoAtualizada.SonsIntestinais, ListaSonsIntestinais.Diminuidos);
            Assert.Equals(eliminacaoAtualizada.SVD, false);
            Assert.Equals(eliminacaoAtualizada.SVDInstalada, Convert.ToDateTime("11/11/2011"));
            Assert.Equals(eliminacaoAtualizada.Tempo, "12:00");
            Assert.Equals(eliminacaoAtualizada.TiposFezes, ListaTiposFezes.Constipacao);
            Assert.Equals(eliminacaoAtualizada.TipoSonsPercussao, ListaTipoSonsPercussao.SomMacico);
            Assert.Equals(eliminacaoAtualizada.UltimaEvacuacao, Convert.ToDateTime("02/02/2015"));
        }

        [TestMethod()]
        public void PV33_AtualizarNecessidadesPsicobiologicasEliminacaoInvalida()
        {
            long idConsultaVariavel = 100;
            GerenciadorEliminacao gerenciadorEliminacao = GerenciadorEliminacao.GetInstance();
            EliminacaoModel eliminacao = gerenciadorEliminacao.Obter(idConsultaVariavel);
            Assert.IsNotNull(eliminacao);
            eliminacao.IdConsultaVariavel = -1;
            eliminacao.Cistostomia = true;
            eliminacao.ColoracaoUrinaria = ListaColoracaoUrinaria.LimpidaClara;
            eliminacao.CondicaoContinenciaUrinaria = ListaCondicaoContinenciaUrinaria.RetencaoUrinaria;
            eliminacao.EsforcoEvacuar = true;
            eliminacao.EstomasCirurgicos = ListaEstomasCirurgicos.NaoSeAplica;
            eliminacao.EvacuacoesDia = 4;
            eliminacao.Flatos = false;
            eliminacao.FormasAbdomem = ListaFormasAbdomem.Retraido;
            eliminacao.Hemorroidas = false;
            eliminacao.IncontinenciaFecal = true;
            eliminacao.PalpacaoAbodminal = ListaPalpacaoAbodminal.Tenso;
            eliminacao.SonsIntestinais = ListaSonsIntestinais.Diminuidos;

            try
            {
                gerenciadorEliminacao.Atualizar(eliminacao);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }

            EliminacaoModel eliminacaoAtualizada = gerenciadorEliminacao.Obter(idConsultaVariavel);
            Assert.Equals(eliminacaoAtualizada.Cistostomia, false);
            Assert.Equals(eliminacaoAtualizada.ColoracaoUrinaria, ListaColoracaoUrinaria.LimpidaClara);
            Assert.Equals(eliminacaoAtualizada.CondicaoContinenciaUrinaria, ListaCondicaoContinenciaUrinaria.IncontinenciaUrinaria);
            Assert.Equals(eliminacaoAtualizada.DebitoUrinario, ListaDebitoUrinario.NaoSeAplica);
            Assert.Equals(eliminacaoAtualizada.Disuria, false);
            Assert.Equals(eliminacaoAtualizada.EsforcoEvacuar, false);
            Assert.Equals(eliminacaoAtualizada.EstomasCirurgicos, ListaEstomasCirurgicos.NaoSeAplica);
            Assert.Equals(eliminacaoAtualizada.EvacuacoesDia, 0);
            Assert.Equals(eliminacaoAtualizada.Flatos, false);
            Assert.Equals(eliminacaoAtualizada.FormasAbdomem, ListaFormasAbdomem.Plano);
            Assert.Equals(eliminacaoAtualizada.Hemorroidas, false);
            Assert.Equals(eliminacaoAtualizada.IdConsultaVariavel, 100);
            Assert.Equals(eliminacaoAtualizada.IncontinenciaFecal, false);
            Assert.Equals(eliminacaoAtualizada.PalpacaoAbodminal, ListaPalpacaoAbodminal.Normotenso);
            Assert.Equals(eliminacaoAtualizada.PruridoAnal, false);
            Assert.Equals(eliminacaoAtualizada.SangramentoRetal, false);
            Assert.Equals(eliminacaoAtualizada.SonsIntestinais, ListaSonsIntestinais.Presentes);
            Assert.Equals(eliminacaoAtualizada.SVD, false);
            Assert.Equals(eliminacaoAtualizada.SVDInstalada, Convert.ToDateTime("15/07/2014"));
            Assert.Equals(eliminacaoAtualizada.Tempo, "");
            Assert.Equals(eliminacaoAtualizada.TiposFezes, ListaTiposFezes.FezesFormadas);
            Assert.Equals(eliminacaoAtualizada.TipoSonsPercussao, ListaTipoSonsPercussao.SomMacico);
            Assert.Equals(eliminacaoAtualizada.UltimaEvacuacao, Convert.ToDateTime("15/07/2014"));
        }
    }
}
