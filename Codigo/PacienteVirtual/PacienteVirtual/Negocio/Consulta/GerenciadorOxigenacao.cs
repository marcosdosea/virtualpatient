using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorOxigenacao
    {
        private static GerenciadorOxigenacao gOxigenacao;

        private GerenciadorOxigenacao() { }

        public static GerenciadorOxigenacao GetInstance()
        {
            if (gOxigenacao == null)
            {
                gOxigenacao = new GerenciadorOxigenacao();
            }
            return gOxigenacao;
        }

        /// <summary>
        /// Faz correção de Oxigenacao de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(OxigenacaoModel oxigenacao, OxigenacaoModel oxigenacaoGabarito, ModelStateDictionary modelState)
        {
            if (oxigenacao.FequenciaResporatoria != oxigenacaoGabarito.FequenciaResporatoria)
            {
                modelState.AddModelError("FequenciaResporatoria", "Gabarito: \"" + oxigenacaoGabarito.FrequenciaTosse + "\"");
            }
            if (oxigenacao.Ritmo != oxigenacaoGabarito.Ritmo)
            {
                modelState.AddModelError("ErroRitmo", "Gabarito: \"" + oxigenacaoGabarito.Ritmo.ToString() + "\"");
            }
            if (oxigenacao.PadraoRespiratorio != oxigenacaoGabarito.PadraoRespiratorio)
            {
                modelState.AddModelError("ErroPadraoResp", "Gabarito: \"" + oxigenacaoGabarito.PadraoRespiratorio.ToString() + "\"");
            }
            if (oxigenacao.DesvioDeSepto != oxigenacaoGabarito.DesvioDeSepto)
            {
                modelState.AddModelError("DesvioDeSepto", "Gabarito: " + (oxigenacaoGabarito.DesvioDeSepto.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Palidez != oxigenacaoGabarito.Palidez)
            {
                modelState.AddModelError("Palidez", "Gabarito: " + (oxigenacaoGabarito.Palidez.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.LabioCianotico != oxigenacaoGabarito.LabioCianotico)
            {
                modelState.AddModelError("LabioCianotico", "Gabarito: " + (oxigenacaoGabarito.LabioCianotico.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.ObstrucaoNasal != oxigenacaoGabarito.ObstrucaoNasal)
            {
                modelState.AddModelError("ObstrucaoNasal", "Gabarito: " + (oxigenacaoGabarito.ObstrucaoNasal.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Coriza != oxigenacaoGabarito.Coriza)
            {
                modelState.AddModelError("Coriza", "Gabarito: " + (oxigenacaoGabarito.Coriza.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.SimetriaToracica != oxigenacaoGabarito.SimetriaToracica)
            {
                modelState.AddModelError("ErroSimetriaToracica", "Gabarito: \"" + oxigenacaoGabarito.SimetriaToracica.ToString() + "\"");
            }
            if (oxigenacao.TiposTorax != oxigenacaoGabarito.TiposTorax)
            {
                modelState.AddModelError("ErroTiposTorax", "Gabarito: \"" + oxigenacaoGabarito.TiposTorax.ToString() + "\"");
            }
            if (oxigenacao.TiragemIntercostal != oxigenacaoGabarito.TiragemIntercostal)
            {
                modelState.AddModelError("TiragemIntercostal", "Gabarito: " + (oxigenacaoGabarito.TiragemIntercostal.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Expansibilidade != oxigenacaoGabarito.Expansibilidade)
            {
                modelState.AddModelError("ErroExpansibilidade", "Gabarito: \"" + oxigenacaoGabarito.Expansibilidade.ToString() + "\"");
            }
            if (oxigenacao.EnfizemaSubcutaneo != oxigenacaoGabarito.EnfizemaSubcutaneo)
            {
                modelState.AddModelError("EnfizemaSubcutaneo", "Gabarito: " + (oxigenacaoGabarito.EnfizemaSubcutaneo.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.PresencaFremito != oxigenacaoGabarito.PresencaFremito)
            {
                modelState.AddModelError("PresencaFremito", "Gabarito: " + (oxigenacaoGabarito.PresencaFremito.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Tosse != oxigenacaoGabarito.Tosse)
            {
                modelState.AddModelError("Tosse", "Gabarito: " + (oxigenacaoGabarito.Tosse.Equals("S") ? "Sim" : "Não"));
            }
            if (oxigenacao.FrequenciaTosse != oxigenacaoGabarito.FrequenciaTosse)
            {
                modelState.AddModelError("ErroFrequenciaTosse", "Gabarito: \"" + oxigenacaoGabarito.FrequenciaTosse.ToString() + "\"");
            }
            if (oxigenacao.TipoTosse != oxigenacaoGabarito.TipoTosse)
            {
                modelState.AddModelError("ErroTipoTosse", "Gabarito: \"" + oxigenacaoGabarito.TipoTosse.ToString() + "\"");
            }
            Global.CorrecaoDeStrings("AspectoSecrecao", oxigenacao.AspectoSecrecao, oxigenacaoGabarito.AspectoSecrecao, modelState);

            if (oxigenacao.Percursao != oxigenacaoGabarito.Percursao)
            {
                modelState.AddModelError("ErroPercursao", "Gabarito: \"" + oxigenacaoGabarito.Percursao.ToString() + "\"");
            }
            if (oxigenacao.GangliosPalpaveis != oxigenacaoGabarito.GangliosPalpaveis)
            {
                modelState.AddModelError("GangliosPalpaveis", "Gabarito: " + (oxigenacaoGabarito.GangliosPalpaveis.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.GangliosDolorosos != oxigenacaoGabarito.GangliosDolorosos)
            {
                modelState.AddModelError("GangliosDolorosos", "Gabarito: " + (oxigenacaoGabarito.GangliosDolorosos.Equals(true) ? "Sim" : "Não"));
            }

            Global.CorrecaoDeStrings("GangliosLocalizar", oxigenacao.GangliosLocalizar, oxigenacaoGabarito.GangliosLocalizar, modelState);
            if (oxigenacao.AuscultaPulmonar != oxigenacaoGabarito.AuscultaPulmonar)
            {
                modelState.AddModelError("ErroAscultaPulmonar", "Gabarito: \"" + oxigenacaoGabarito.AuscultaPulmonar.ToString() + "\"");
            }
        }

        /// <summary>
        /// Insere dados do oxigenacao
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <returns></returns>
        public long Inserir(OxigenacaoModel oxigenacao)
        {
            var repoxigenacao = new RepositorioGenerico<tb_oxiginecao>();
            tb_oxiginecao _oxigenacaoE = new tb_oxiginecao();
            try
            {
                Atribuir(oxigenacao, _oxigenacaoE);

                repoxigenacao.Inserir(_oxigenacaoE);
                repoxigenacao.SaveChanges();

                return _oxigenacaoE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Oxigenacao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do oxigenacao
        /// </summary>
        /// <param name="oxigenacao"></param>
        public void Atualizar(OxigenacaoModel oxigenacao)
        {
            try
            {
                var repoxigenacao = new RepositorioGenerico<tb_oxiginecao>();
                tb_oxiginecao _oxigenacaoE = repoxigenacao.ObterEntidade(o => o.IdConsultaVariavel == oxigenacao.IdConsultaVariavel);
                Atribuir(oxigenacao, _oxigenacaoE);

                repoxigenacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Oxigenacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do oxigenacao especificando a consulta fixa
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repoxigenacao = new RepositorioGenerico<tb_oxiginecao>();
                repoxigenacao.Remover(o => o.IdConsultaVariavel == idConsultaVariavel);
                repoxigenacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Oxigenacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<OxigenacaoModel> GetQuery()
        {
            var repoxigenacao = new RepositorioGenerico<tb_oxiginecao>();
            var pvEntities = (pvEntities)repoxigenacao.ObterContexto();
            var query = from oxigenacao in pvEntities.tb_oxiginecao
                        select new OxigenacaoModel
                        {
                            IdConsultaVariavel = oxigenacao.IdConsultaVariavel,
                            FequenciaResporatoria = oxigenacao.FrequeciaRespiratoria,
                            Ritmo = (oxigenacao.Ritmo == "Regular" ? ListaRitmo.Regular : ListaRitmo.Irregular),
                            PadraoRespiratorio = (oxigenacao.PadraoRespiratorio == "Eupineico" ? ListaPadraoRespiratorio.Eupineico : (oxigenacao.PadraoRespiratorio == "Dispneia" ? ListaPadraoRespiratorio.Dispneia : (oxigenacao.PadraoRespiratorio == "Taquipneia" ? ListaPadraoRespiratorio.Taquipneia : (oxigenacao.PadraoRespiratorio == "CheyneStokes" ? ListaPadraoRespiratorio.CheyneStokes : ListaPadraoRespiratorio.Kussmaul)))),
                            ObstrucaoNasal = oxigenacao.ObstrucaoNasal,
                            Coriza = oxigenacao.Coriza,
                            DesvioDeSepto = oxigenacao.DesvioDeSepto,
                            Palidez = oxigenacao.Palidez,
                            LabioCianotico = oxigenacao.LabioCianotico,
                            TiposTorax =  (oxigenacao.TiposTorax == "Barril" ? ListaTiposTorax.Barril : (oxigenacao.TiposTorax == "PeitoDePombo" ? ListaTiposTorax.PeitoDePombo : (oxigenacao.TiposTorax == "Funil" ? ListaTiposTorax.Funil : (oxigenacao.TiposTorax == "Lordose" ? ListaTiposTorax.Lordose : (oxigenacao.TiposTorax == "Cifose" ? ListaTiposTorax.Cifose : ListaTiposTorax.Escoliose))))),
                            TiragemIntercostal = oxigenacao.TiragemIntercostal,
                            SimetriaToracica = (oxigenacao.SimetriaToracica == "Simetrico" ? ListaSimetriaToracica.Simetrico : 
                                oxigenacao.SimetriaToracica == "AssimetricoBilateral" ? ListaSimetriaToracica.AssimetricoBilateral : 
                                ListaSimetriaToracica.AssimetricoUnilateral),
                            Expansibilidade = (oxigenacao.Expansibilidade == "Preservada" ? ListaExpansibilidade.Preservada : 
                                ListaExpansibilidade.Diminuida),
                            EnfizemaSubcutaneo = oxigenacao.EnfizemaSubcutaneo,
                            PresencaFremito = oxigenacao.PresencaFremito,
                            Tosse = oxigenacao.Tosse,
                            FrequenciaTosse = (oxigenacao.FrequenciaTosse == "NaoSeAplica" ? ListaFrequenciaTosse.NaoSeAplica : 
                                oxigenacao.FrequenciaTosse == "Noturna" ? ListaFrequenciaTosse.Noturna : oxigenacao.FrequenciaTosse == "Frequente" ? 
                                ListaFrequenciaTosse.Frequente : ListaFrequenciaTosse.Esporadica),
                            TipoTosse = (oxigenacao.TipoTosse == "NaoSeAplica" ? ListaTipoTosse.NaoSeAplica : oxigenacao.TipoTosse == "Produtiva" ? 
                                ListaTipoTosse.Produtiva : ListaTipoTosse.Seca),
                            AspectoSecrecao = oxigenacao.AspectoSecrecao,
                            Percursao = (oxigenacao.Percursao == "Ar" ? ListaPercursao.Ar : oxigenacao.Percursao == "Massa" ? ListaPercursao.Massa : 
                                ListaPercursao.Liquido),
                            GangliosPalpaveis = oxigenacao.GangliosPalpaveis,
                            GangliosDolorosos = oxigenacao.GangliosDolorosos,
                            GangliosLocalizar = oxigenacao.GangliosLocalizar,
                            AuscultaPulmonar = (oxigenacao.AuscultaPulmonar == "VesicularPresente" ? ListaAuscultaPulmonar.VesicularPresente : (oxigenacao.AuscultaPulmonar == "VesicularDiminuido" ? ListaAuscultaPulmonar.VesicularDiminuido : (oxigenacao.AuscultaPulmonar == "Roncos" ? ListaAuscultaPulmonar.Roncos : (oxigenacao.AuscultaPulmonar == "Estertores" ? ListaAuscultaPulmonar.Estertores : (oxigenacao.AuscultaPulmonar == "Sibilos" ? ListaAuscultaPulmonar.Sibilos : (oxigenacao.AuscultaPulmonar == "Estridor" ? ListaAuscultaPulmonar.Estridor : ListaAuscultaPulmonar.AtritoPleural))))))
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os oxigenacao cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<OxigenacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém oxigenacao com o código da consulta fixa especificiado
        /// </summary>
        /// <returns></returns>
        public OxigenacaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(oxigenacao => oxigenacao.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="_oxigenacaoE"></param>
        private static void Atribuir(OxigenacaoModel oxigenacao, tb_oxiginecao _oxigenacaoE)
        {
            _oxigenacaoE.IdConsultaVariavel = oxigenacao.IdConsultaVariavel;
            _oxigenacaoE.FrequeciaRespiratoria = oxigenacao.FequenciaResporatoria;
            _oxigenacaoE.Ritmo = oxigenacao.Ritmo.ToString();
            _oxigenacaoE.PadraoRespiratorio = oxigenacao.PadraoRespiratorio.ToString();
            _oxigenacaoE.ObstrucaoNasal = oxigenacao.ObstrucaoNasal;
            _oxigenacaoE.Coriza = oxigenacao.Coriza;
            _oxigenacaoE.DesvioDeSepto = oxigenacao.DesvioDeSepto;
            _oxigenacaoE.Palidez = oxigenacao.Palidez;
            _oxigenacaoE.LabioCianotico = oxigenacao.LabioCianotico;
            _oxigenacaoE.TiposTorax = oxigenacao.TiposTorax.ToString();
            _oxigenacaoE.TiragemIntercostal = oxigenacao.TiragemIntercostal;
            _oxigenacaoE.SimetriaToracica = oxigenacao.SimetriaToracica.ToString();
            _oxigenacaoE.Expansibilidade = oxigenacao.Expansibilidade.ToString();
            _oxigenacaoE.EnfizemaSubcutaneo = oxigenacao.EnfizemaSubcutaneo;
            _oxigenacaoE.PresencaFremito = oxigenacao.PresencaFremito;
            _oxigenacaoE.Tosse = oxigenacao.Tosse;
            _oxigenacaoE.FrequenciaTosse = oxigenacao.FrequenciaTosse.ToString();
            _oxigenacaoE.TipoTosse = oxigenacao.TipoTosse.ToString();
            _oxigenacaoE.AspectoSecrecao = oxigenacao.AspectoSecrecao;
            _oxigenacaoE.Percursao = oxigenacao.Percursao.ToString();
            _oxigenacaoE.GangliosPalpaveis = oxigenacao.GangliosPalpaveis;
            _oxigenacaoE.GangliosDolorosos = oxigenacao.GangliosDolorosos;
            _oxigenacaoE.GangliosLocalizar = oxigenacao.GangliosLocalizar;
            _oxigenacaoE.AuscultaPulmonar = oxigenacao.AuscultaPulmonar.ToString();
        }
    }
}