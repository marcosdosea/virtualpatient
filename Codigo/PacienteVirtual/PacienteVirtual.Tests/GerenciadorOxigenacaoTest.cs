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
    /// Summary description for GerenciadorOxigenacaoTest
    /// </summary>
    [TestClass]
    public class GerenciadorOxigenacaoTest
    {

        [TestMethod()]
        public void PV20_AtualizarOxigenacaoValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorOxigenacao gerenciadorOxigenacao = GerenciadorOxigenacao.GetInstance();
            OxigenacaoModel oxigenacao = gerenciadorOxigenacao.Obter(idConsultaVariavel);
            Assert.IsNotNull(oxigenacao);
            oxigenacao.AspectoSecrecao = ListaAspectoSecrecao.Amarelada;
            oxigenacao.AuscultaPulmonar = ListaAuscultaPulmonar.Roncos;
            oxigenacao.Coriza = true;
            oxigenacao.DesvioDeSepto = true;
            oxigenacao.EnfizemaSubcutaneo = false;
            oxigenacao.Expansibilidade = ListaExpansibilidade.Diminuida;
            oxigenacao.FequenciaResporatoria = 5;
            oxigenacao.FrequenciaTosse = ListaFrequenciaTosse.Frequente;
            oxigenacao.GangliosDolorosos = true;
            oxigenacao.GangliosLocalizar = "Abaixo";
            oxigenacao.GangliosPalpaveis = false;
            oxigenacao.LabioCianotico = false;
            oxigenacao.ObstrucaoNasal = true;
            oxigenacao.PadraoRespiratorio = ListaPadraoRespiratorio.Eupineico;
            oxigenacao.Palidez = true;
            oxigenacao.Percursao = ListaPercursao.Ar;
            oxigenacao.PresencaFremito = false;
            oxigenacao.Ritmo = ListaRitmo.Regular;
            oxigenacao.SimetriaToracica = ListaSimetriaToracica.Simetrico;
            oxigenacao.TiposTorax = ListaTiposTorax.Funil;
            oxigenacao.TipoTosse = ListaTipoTosse.Seca;
            oxigenacao.TiragemIntercostal = false;
            oxigenacao.Tosse = "N";

            gerenciadorOxigenacao.Atualizar(oxigenacao);

            OxigenacaoModel oxigenacaoAtualizada = gerenciadorOxigenacao.Obter(idConsultaVariavel);
            Assert.Equals(oxigenacao.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(oxigenacaoAtualizada.AspectoSecrecao, ListaAspectoSecrecao.Amarelada);
            Assert.Equals(oxigenacaoAtualizada.AuscultaPulmonar, ListaAuscultaPulmonar.Roncos);
            Assert.Equals(oxigenacaoAtualizada.Coriza, true);
            Assert.Equals(oxigenacaoAtualizada.DesvioDeSepto, true);
            Assert.Equals(oxigenacaoAtualizada.EnfizemaSubcutaneo, false);
            Assert.Equals(oxigenacaoAtualizada.Expansibilidade, ListaExpansibilidade.Diminuida);
            Assert.Equals(oxigenacaoAtualizada.FequenciaResporatoria, 5);
            Assert.Equals(oxigenacaoAtualizada.FrequenciaTosse, ListaFrequenciaTosse.Frequente);
            Assert.Equals(oxigenacaoAtualizada.GangliosDolorosos, true);
            Assert.Equals(oxigenacaoAtualizada.GangliosLocalizar, "Abaixo");
            Assert.Equals(oxigenacaoAtualizada.GangliosPalpaveis, false);
            Assert.Equals(oxigenacaoAtualizada.LabioCianotico, false);
            Assert.Equals(oxigenacaoAtualizada.ObstrucaoNasal, true);
            Assert.Equals(oxigenacaoAtualizada.PadraoRespiratorio, ListaPadraoRespiratorio.Eupineico);
            Assert.Equals(oxigenacaoAtualizada.Palidez, true);
            Assert.Equals(oxigenacaoAtualizada.Percursao, ListaPercursao.Ar);
            Assert.Equals(oxigenacaoAtualizada.PresencaFremito, false);
            Assert.Equals(oxigenacaoAtualizada.Ritmo, ListaRitmo.Regular);
            Assert.Equals(oxigenacaoAtualizada.SimetriaToracica, ListaSimetriaToracica.Simetrico);
            Assert.Equals(oxigenacaoAtualizada.TiposTorax, ListaTiposTorax.Funil);
            Assert.Equals(oxigenacaoAtualizada.TipoTosse, ListaTipoTosse.Seca);
            Assert.Equals(oxigenacaoAtualizada.TiragemIntercostal, false);
            Assert.Equals(oxigenacaoAtualizada.Tosse, "N");
        }

        [TestMethod()]
        public void PV21_AtualizarOxigenacaoInvalida()
        {
            long idConsultaVariavel = 100;
            GerenciadorOxigenacao gerenciadorOxigenacao = GerenciadorOxigenacao.GetInstance();
            OxigenacaoModel oxigenacao = gerenciadorOxigenacao.Obter(idConsultaVariavel);
            Assert.IsNotNull(oxigenacao);
            oxigenacao.AspectoSecrecao = ListaAspectoSecrecao.Amarelada;
            oxigenacao.AuscultaPulmonar = ListaAuscultaPulmonar.Roncos;
            oxigenacao.Coriza = true;
            oxigenacao.DesvioDeSepto = true;
            oxigenacao.EnfizemaSubcutaneo = false;
            oxigenacao.Expansibilidade = ListaExpansibilidade.Diminuida;
            oxigenacao.FequenciaResporatoria = 5;
            oxigenacao.FrequenciaTosse = ListaFrequenciaTosse.Frequente;
            oxigenacao.GangliosDolorosos = true;
            oxigenacao.GangliosLocalizar = null;
            oxigenacao.GangliosPalpaveis = false;
            oxigenacao.LabioCianotico = false;
            oxigenacao.ObstrucaoNasal = true;
            oxigenacao.PadraoRespiratorio = ListaPadraoRespiratorio.Eupineico;
            oxigenacao.Palidez = true;
            oxigenacao.Percursao = ListaPercursao.Ar;
            oxigenacao.PresencaFremito = false;
            oxigenacao.Ritmo = ListaRitmo.Regular;
            oxigenacao.SimetriaToracica = ListaSimetriaToracica.Simetrico;
            oxigenacao.TiposTorax = ListaTiposTorax.Funil;
            oxigenacao.TipoTosse = ListaTipoTosse.Seca;
            oxigenacao.TiragemIntercostal = false;
            oxigenacao.Tosse = null;

            try
            {
                gerenciadorOxigenacao.Atualizar(oxigenacao);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }

            OxigenacaoModel oxigenacaoAtualizada = gerenciadorOxigenacao.Obter(idConsultaVariavel);
            Assert.Equals(oxigenacao.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(oxigenacaoAtualizada.AspectoSecrecao, ListaAspectoSecrecao.NaoSeAplica);
            Assert.Equals(oxigenacaoAtualizada.AuscultaPulmonar, ListaAuscultaPulmonar.VesicularPresente);
            Assert.Equals(oxigenacaoAtualizada.Coriza, false);
            Assert.Equals(oxigenacaoAtualizada.DesvioDeSepto, false);
            Assert.Equals(oxigenacaoAtualizada.EnfizemaSubcutaneo, false);
            Assert.Equals(oxigenacaoAtualizada.Expansibilidade, ListaExpansibilidade.Preservada);
            Assert.Equals(oxigenacaoAtualizada.FequenciaResporatoria, 0);
            Assert.Equals(oxigenacaoAtualizada.FrequenciaTosse, ListaFrequenciaTosse.NaoSeAplica);
            Assert.Equals(oxigenacaoAtualizada.GangliosDolorosos, false);
            Assert.Equals(oxigenacaoAtualizada.GangliosLocalizar, "");
            Assert.Equals(oxigenacaoAtualizada.GangliosPalpaveis, false);
            Assert.Equals(oxigenacaoAtualizada.LabioCianotico, false);
            Assert.Equals(oxigenacaoAtualizada.ObstrucaoNasal, false);
            Assert.Equals(oxigenacaoAtualizada.PadraoRespiratorio, ListaPadraoRespiratorio.Eupineico);
            Assert.Equals(oxigenacaoAtualizada.Palidez, false);
            Assert.Equals(oxigenacaoAtualizada.Percursao, ListaPercursao.Ar);
            Assert.Equals(oxigenacaoAtualizada.PresencaFremito, false);
            Assert.Equals(oxigenacaoAtualizada.Ritmo, ListaRitmo.Regular);
            Assert.Equals(oxigenacaoAtualizada.SimetriaToracica, ListaSimetriaToracica.Simetrico);
            Assert.Equals(oxigenacaoAtualizada.TiposTorax, ListaTiposTorax.Barril);
            Assert.Equals(oxigenacaoAtualizada.TipoTosse, ListaTipoTosse.NaoSeAplica);
            Assert.Equals(oxigenacaoAtualizada.TiragemIntercostal, false);
            Assert.Equals(oxigenacaoAtualizada.Tosse, "N");
        }
    }
}
