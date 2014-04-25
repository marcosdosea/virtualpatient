using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

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
        public void CorrigirRespostas()
        {
            
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
                            Ritmo = ListaRitmo.Regular,
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
                            SimetriaToracica = ListaSimetriaToracica.Simetrico,
                            Expansibilidade = ListaExpansibilidade.Preservada,
                            EnfizemaSubcutaneo = oxigenacao.EnfizemaSubcutaneo,
                            PresencaFremito = oxigenacao.PresencaFremito,
                            Tosse = oxigenacao.Tosse,
                            FrequenciaTosse = ListaFrequenciaTosse.NaoSeAplica,
                            TipoTosse = ListaTipoTosse.NaoSeAplica,
                            AspectoSecrecao = oxigenacao.AspectoSecrecao,
                            Percursao = ListaPercursao.Ar,
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