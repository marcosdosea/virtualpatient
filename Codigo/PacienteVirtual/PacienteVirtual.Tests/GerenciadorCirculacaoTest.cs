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
    /// Summary description for GerenciadorCirculacaoTest
    /// </summary>
    [TestClass]
    public class GerenciadorCirculacaoTest
    {
        [TestMethod()]
        public void PV22_AtualizarCirculacaoValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorCirculacao gerenciadorCirculacao = GerenciadorCirculacao.GetInstance();
            CirculacaoModel circulacao = gerenciadorCirculacao.Obter(idConsultaVariavel);
            Assert.IsNotNull(circulacao);
            circulacao.CateterCentral = true;
            circulacao.CateterCentralData = DateTime.Now;
            circulacao.CateterCentralLocal = "Perna";
            circulacao.CateterData = DateTime.Now;
            circulacao.CateterLocal = "Tornozelo";
            circulacao.CateterPeriferico = true;
            circulacao.DissecacaoVenosaData = DateTime.Now;
            circulacao.DisseccaoVenosa = false;
            circulacao.DisseccaoVenosaLocal = "";
            circulacao.Edema = true;
            circulacao.EdemaLocalizar = "Calcanhar";
            circulacao.EnchimentoCapilar = ListaEnchimentoCapilar.Maior3;
            circulacao.Flebite = false;
            circulacao.FlebiteLocalizar = "";
            circulacao.Infiltracao = false;
            circulacao.InfiltracaoLocalizar = "";
            circulacao.P = 10;
            circulacao.PA = "Baixa";
            circulacao.RedeVenosaPulsosPalpaveis = true;
            circulacao.RedeVenosaSemAcesso = true;
            circulacao.RedeVenosaVisivel = false;
            circulacao.SinaisFlogisticos = true;
            circulacao.SinaisFlogisticosQuaisLocal = "Perna e Braço";
            circulacao.Varizes = false;

            gerenciadorCirculacao.Atualizar(circulacao);

            CirculacaoModel circulacaoAtualizada = gerenciadorCirculacao.Obter(idConsultaVariavel);
            Assert.Equals(circulacao.CateterCentral, true);
            Assert.Equals(circulacao.CateterCentralData, circulacao.CateterCentralData);
            Assert.Equals(circulacao.CateterCentralLocal, "Perna");
            Assert.Equals(circulacao.CateterData, circulacao.CateterData);
            Assert.Equals(circulacao.CateterLocal, "Tornozelo");
            Assert.Equals(circulacao.CateterPeriferico, true);
            Assert.Equals(circulacao.DissecacaoVenosaData, circulacao.DissecacaoVenosaData);
            Assert.Equals(circulacao.DisseccaoVenosa, false);
            Assert.Equals(circulacao.DisseccaoVenosaLocal, "");
            Assert.Equals(circulacao.Edema, true);
            Assert.Equals(circulacao.EdemaLocalizar, "Calcanhar");
            Assert.Equals(circulacao.EnchimentoCapilar, ListaEnchimentoCapilar.Maior3);
            Assert.Equals(circulacao.Flebite, false);
            Assert.Equals(circulacao.FlebiteLocalizar, "");
            Assert.Equals(circulacao.P, 10);
            Assert.Equals(circulacao.PA, "Baixa");
            Assert.Equals(circulacao.RedeVenosaPulsosPalpaveis, true);
            Assert.Equals(circulacao.RedeVenosaSemAcesso, true);
            Assert.Equals(circulacao.RedeVenosaVisivel, false);
            Assert.Equals(circulacao.SinaisFlogisticos, true);
            Assert.Equals(circulacao.SinaisFlogisticosQuaisLocal, "Perna e Braço");
            Assert.Equals(circulacao.Varizes, false);
        }

        [TestMethod()]
        public void PV23_AtualizarCirculacaoInvalida()
        {
            long idConsultaVariavel = 100;
            GerenciadorCirculacao gerenciadorCirculacao = GerenciadorCirculacao.GetInstance();
            CirculacaoModel circulacao = gerenciadorCirculacao.Obter(idConsultaVariavel);
            Assert.IsNotNull(circulacao);
            circulacao.IdConsultaVariavel = -5;
            circulacao.CateterCentralLocal = "Perna";
            circulacao.CateterLocal = null;
            circulacao.CateterPeriferico = true;
            circulacao.DisseccaoVenosa = false;
            circulacao.DisseccaoVenosaLocal = "";
            circulacao.Edema = true;
            circulacao.EdemaLocalizar = null;
            circulacao.EnchimentoCapilar = ListaEnchimentoCapilar.Maior3;
            circulacao.P = 10;
            circulacao.PA = "Baixa";
            circulacao.RedeVenosaPulsosPalpaveis = true;
            circulacao.RedeVenosaSemAcesso = true;
            circulacao.RedeVenosaVisivel = false;
            circulacao.SinaisFlogisticos = true;
            circulacao.SinaisFlogisticosQuaisLocal = null;
            circulacao.Varizes = false;

            try
            {
                gerenciadorCirculacao.Atualizar(circulacao);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }
            
            CirculacaoModel circulacaoAtualizada = gerenciadorCirculacao.Obter(idConsultaVariavel);
            Assert.Equals(circulacao.CateterCentral, false);
            Assert.Equals(circulacao.CateterCentralData, "0001-01-01 00:00:00");
            Assert.Equals(circulacao.CateterCentralLocal, "");
            Assert.Equals(circulacao.CateterData, "0001-01-01 00:00:00");
            Assert.Equals(circulacao.CateterLocal, "");
            Assert.Equals(circulacao.CateterPeriferico, false);
            Assert.Equals(circulacao.DissecacaoVenosaData, "0001-01-01 00:00:00");
            Assert.Equals(circulacao.DisseccaoVenosa, false);
            Assert.Equals(circulacao.DisseccaoVenosaLocal, "");
            Assert.Equals(circulacao.Edema, false);
            Assert.Equals(circulacao.EdemaLocalizar, "");
            Assert.Equals(circulacao.EnchimentoCapilar, ListaEnchimentoCapilar.MenorIgual3);
            Assert.Equals(circulacao.Flebite, false);
            Assert.Equals(circulacao.FlebiteLocalizar, "");
            Assert.Equals(circulacao.P, 0);
            Assert.Equals(circulacao.PA, "");
            Assert.Equals(circulacao.RedeVenosaPulsosPalpaveis, false);
            Assert.Equals(circulacao.RedeVenosaSemAcesso, false);
            Assert.Equals(circulacao.RedeVenosaVisivel, false);
            Assert.Equals(circulacao.SinaisFlogisticos, false);
            Assert.Equals(circulacao.SinaisFlogisticosQuaisLocal, "");
            Assert.Equals(circulacao.Varizes, false);
        }
    }
}
