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
                modelState.AddModelError("ErroRitmo", "Gabarito: \"" + oxigenacaoGabarito.Ritmo + "\"");
            }
            if (oxigenacao.Dispineia != oxigenacaoGabarito.Dispineia)
            {
                modelState.AddModelError("Dispineia", "Gabarito: " + (oxigenacaoGabarito.Dispineia.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Taquipneia != oxigenacaoGabarito.Taquipneia)
            {
                modelState.AddModelError("Taquipneia", "Gabarito: " + (oxigenacaoGabarito.Taquipneia.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Bradipneia != oxigenacaoGabarito.Bradipneia)
            {
                modelState.AddModelError("Bradipneia", "Gabarito: " + (oxigenacaoGabarito.Bradipneia.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.CheyneStokes != oxigenacaoGabarito.CheyneStokes)
            {
                modelState.AddModelError("CheyneStokes", "Gabarito: " + (oxigenacaoGabarito.CheyneStokes.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Kussmaul != oxigenacaoGabarito.Kussmaul)
            {
                modelState.AddModelError("Kussmaul", "Gabarito: " + (oxigenacaoGabarito.Kussmaul.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Epistaxe != oxigenacaoGabarito.Epistaxe)
            {
                modelState.AddModelError("Epistaxe", "Gabarito: " + (oxigenacaoGabarito.Epistaxe.Equals(true) ? "Sim" : "Não"));
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
                modelState.AddModelError("ErroSimetriaToracica", "Gabarito: \"" + oxigenacaoGabarito.SimetriaToracica + "\"");
            }
            if (oxigenacao.PeitoDePombo != oxigenacaoGabarito.PeitoDePombo)
            {
                modelState.AddModelError("PeitoDePombo", "Gabarito: " + (oxigenacaoGabarito.PeitoDePombo.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Funil != oxigenacaoGabarito.Funil)
            {
                modelState.AddModelError("Funil", "Gabarito: " + (oxigenacaoGabarito.Funil.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Lordose != oxigenacaoGabarito.Lordose)
            {
                modelState.AddModelError("Lordose", "Gabarito: " + (oxigenacaoGabarito.Lordose.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Cifose != oxigenacaoGabarito.Cifose)
            {
                modelState.AddModelError("Cifose", "Gabarito: " + (oxigenacaoGabarito.Cifose.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Escoliose != oxigenacaoGabarito.Escoliose)
            {
                modelState.AddModelError("Escoliose", "Gabarito: " + (oxigenacaoGabarito.Escoliose.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.TiragemIntercostal != oxigenacaoGabarito.TiragemIntercostal)
            {
                modelState.AddModelError("TiragemIntercostal", "Gabarito: " + (oxigenacaoGabarito.TiragemIntercostal.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.Expansibilidade != oxigenacaoGabarito.Expansibilidade)
            {
                modelState.AddModelError("ErroExpansibilidade", "Gabarito: \"" + oxigenacaoGabarito.Expansibilidade + "\"");
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
                modelState.AddModelError("Tosse", "Gabarito: " + (oxigenacaoGabarito.Tosse.Equals(true) ? "Sim" : "Não"));
            }
            if (oxigenacao.FrequenciaTosse != oxigenacaoGabarito.FrequenciaTosse)
            {
                modelState.AddModelError("ErroFrequenciaTosse", "Gabarito: \"" + oxigenacaoGabarito.FrequenciaTosse + "\"");
            }
            if (oxigenacao.TipoTosse != oxigenacaoGabarito.TipoTosse)
            {
                modelState.AddModelError("ErroTipoTosse", "Gabarito: \"" + oxigenacaoGabarito.TipoTosse + "\"");
            }
            Global.CorrecaoDeStrings("AspectoSecrecao", oxigenacao.AspectoSecrecao, oxigenacaoGabarito.AspectoSecrecao, modelState);

            if (oxigenacao.Percursao != oxigenacaoGabarito.Percursao)
            {
                modelState.AddModelError("ErroPercursao", "Gabarito: \"" + oxigenacaoGabarito.Percursao + "\"");
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
                throw new DadosException("oxigenacao", e.Message, e);
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
                throw new DadosException("oxigenacao", e.Message, e);
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
                throw new DadosException("oxigenacao", e.Message, e);
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
                            Dispineia = oxigenacao.Dispineia,
                            Taquipneia = oxigenacao.Taquipneia,
                            Bradipneia = oxigenacao.Bradipneia,
                            Kussmaul = oxigenacao.Kussmaul,
                            CheyneStokes = oxigenacao.CheyneStokes,
                            Epistaxe = oxigenacao.Epistaxe,
                            ObstrucaoNasal = oxigenacao.ObstrucaoNasal,
                            Coriza = oxigenacao.Coriza,
                            DesvioDeSepto = oxigenacao.DesvioDeSepto,
                            Palidez = oxigenacao.Palidez,
                            LabioCianotico = oxigenacao.LabioCianotico,
                            Funil = oxigenacao.Funil,
                            Lordose = oxigenacao.Lordose,
                            Cifose = oxigenacao.Cifose,
                            Escoliose = oxigenacao.Escoliose,
                            TiragemIntercostal = oxigenacao.TiragemIntercostal,
                            SimetriaToracica = (oxigenacao.SimetriaToracica == "Simetrico" ? ListaSimetriaToracica.Simetrico : (oxigenacao.SimetriaToracica == "AssimetricoBilateral" ? ListaSimetriaToracica.AssimetricoBilateral : ListaSimetriaToracica.AssimetricoUnilateral)),
                            Expansibilidade = (oxigenacao.Expansibilidade == "Preservada" ? ListaExpansibilidade.Preservada : ListaExpansibilidade.Diminuida),
                            EnfizemaSubcutaneo = oxigenacao.EnfizemaSubcutaneo,
                            PresencaFremito = oxigenacao.PresencaFremito,
                            Tosse = oxigenacao.Tosse,
                            FrequenciaTosse = (oxigenacao.FrequenciaTosse == "NaoSeAplica" ? ListaFrequenciaTosse.NaoSeAplica : (oxigenacao.FrequenciaTosse == "Noturna" ? ListaFrequenciaTosse.Noturna : (oxigenacao.FrequenciaTosse == "Frequente" ? ListaFrequenciaTosse.Frequente : ListaFrequenciaTosse.Esporadica))),
                            TipoTosse = (oxigenacao.TipoTosse == "NaoSeAplica" ? ListaTipoTosse.NaoSeAplica : (oxigenacao.TipoTosse == "Produtiva" ? ListaTipoTosse.Produtiva : ListaTipoTosse.Seca)),
                            AspectoSecrecao = oxigenacao.AspectoSecrecao,
                            Percursao = (oxigenacao.Percursao == "Ar" ? ListaPercursao.Ar : (oxigenacao.Percursao == "Massa" ? ListaPercursao.Massa : ListaPercursao.Liquido)),
                            GangliosPalpaveis = oxigenacao.GangliosPalpaveis,
                            GangliosDolorosos = oxigenacao.GangliosDolorosos,
                            GangliosLocalizar = oxigenacao.GangliosLocalizar
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
            _oxigenacaoE.Dispineia = oxigenacao.Dispineia;
            _oxigenacaoE.Taquipneia = oxigenacao.Taquipneia;
            _oxigenacaoE.Bradipneia = oxigenacao.Bradipneia;
            _oxigenacaoE.Kussmaul = oxigenacao.Kussmaul;
            _oxigenacaoE.CheyneStokes = oxigenacao.CheyneStokes;
            _oxigenacaoE.Epistaxe = oxigenacao.Epistaxe;
            _oxigenacaoE.ObstrucaoNasal = oxigenacao.ObstrucaoNasal;
            _oxigenacaoE.Coriza = oxigenacao.Coriza;
            _oxigenacaoE.DesvioDeSepto = oxigenacao.DesvioDeSepto;
            _oxigenacaoE.Palidez = oxigenacao.Palidez;
            _oxigenacaoE.LabioCianotico = oxigenacao.LabioCianotico;
            _oxigenacaoE.Funil = oxigenacao.Funil;
            _oxigenacaoE.Lordose = oxigenacao.Lordose;
            _oxigenacaoE.Cifose = oxigenacao.Cifose;
            _oxigenacaoE.Escoliose = oxigenacao.Escoliose;
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
        }
    }
}