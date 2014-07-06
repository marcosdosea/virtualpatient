using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorConsciencia
    {
        private static GerenciadorConsciencia gConsciencia;

        private GerenciadorConsciencia() { }

        public static GerenciadorConsciencia GetInstance()
        {
            if (gConsciencia == null)
            {
                gConsciencia = new GerenciadorConsciencia();
            }
            return gConsciencia;
        }

        /// <summary>
        /// Faz correção de Consciencia de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(ConscienciaModel consciencia, ConscienciaModel conscienciaGabarito, ModelStateDictionary modelState)
        {
            if (consciencia.AberturaOcular != conscienciaGabarito.AberturaOcular)
            {
                modelState.AddModelError("AberturaOcular", "Gabarito: \"" + conscienciaGabarito.AberturaOcular + "\"");
            }
            if (consciencia.MelhorRespostaVerbal != conscienciaGabarito.MelhorRespostaVerbal)
            {
                modelState.AddModelError("MelhorRespostaVerbal", "Gabarito: \"" + conscienciaGabarito.MelhorRespostaVerbal + "\"");
            }
            if (consciencia.AvaliacaoConscienciaGlasgow != conscienciaGabarito.AvaliacaoConscienciaGlasgow)
            {
                modelState.AddModelError("AvaliacaoConscienciaGlasgow", "Gabarito: \"" + conscienciaGabarito.AvaliacaoConscienciaGlasgow + "\"");
            }
            if (consciencia.MelhorRespostaMotora != conscienciaGabarito.MelhorRespostaMotora)
            {
                modelState.AddModelError("MelhorRespostaMotora", "Gabarito: \"" + conscienciaGabarito.MelhorRespostaMotora + "\"");
            }
            if (consciencia.AvaliacaoSedacao != conscienciaGabarito.AvaliacaoSedacao)
            {
                modelState.AddModelError("AvaliacaoSedacao", "Gabarito: \"" + conscienciaGabarito.AvaliacaoSedacao + "\"");
            }
        } 

        /// <summary>
        /// Insere dados da Consciencia
        /// </summary>
        /// <param name="consciencia"></param>
        /// <returns></returns>
        public long Inserir(ConscienciaModel consciencia)
        {
            var repConsciencia = new RepositorioGenerico<tb_consciencia>();
            tb_consciencia _tb_consciencia = new tb_consciencia();
            try
            {
                Atribuir(consciencia, _tb_consciencia);

                repConsciencia.Inserir(_tb_consciencia);
                repConsciencia.SaveChanges();

                return _tb_consciencia.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Consciencia", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do consciencia
        /// </summary>
        /// <param name="consciencia"></param>
        public void Atualizar(ConscienciaModel consciencia)
        {
            try
            {
                var repConsciencia = new RepositorioGenerico<tb_consciencia>();
                tb_consciencia _tb_consciencia = repConsciencia.ObterEntidade(t => t.IdConsultaVariavel == consciencia.IdConsultaVariavel);
                Atribuir(consciencia, _tb_consciencia);

                repConsciencia.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Consciencia", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do consciencia especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repConsciencia = new RepositorioGenerico<tb_consciencia>();
                repConsciencia.Remover(t => t.IdConsultaVariavel == idConsultaVariavel);
                repConsciencia.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Consciencia", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ConscienciaModel> GetQuery()
        {
            var repConsciencia = new RepositorioGenerico<tb_consciencia>();
            var pvEntities = (pvEntities)repConsciencia.ObterContexto();
            var query = from consciencia in pvEntities.tb_consciencia
                        select new ConscienciaModel
                        {
                            IdConsultaVariavel = consciencia.IdConsultaVariavel,
                            AberturaOcular = (consciencia.AberturaOcular == "Espontanea" ? ListaAberturaOcular.Espontanea : consciencia.AberturaOcular ==
                                "EstimuloVerbal" ? ListaAberturaOcular.EstimuloVerbal : consciencia.AberturaOcular == "Dor" ? ListaAberturaOcular.Dor : 
                                (consciencia.AberturaOcular == "NenhumaResposta" ? ListaAberturaOcular.NenhumaResposta : ListaAberturaOcular.NaoSeAplica)),
                            MelhorRespostaMotora = (consciencia.MelhorRespostaMotora == "ObedeceComandoVerbal" ? ListaMelhorRespostaMotora.ObedeceComandoVerbal :
                                consciencia.MelhorRespostaMotora == "LocalizaDor" ? ListaMelhorRespostaMotora.LocalizaDor : consciencia.MelhorRespostaMotora ==
                                "FlexaoRetirada" ? ListaMelhorRespostaMotora.FlexaoRetirada : consciencia.MelhorRespostaMotora == "FlexaoAnormal" ?
                                ListaMelhorRespostaMotora.FlexaoAnormal : consciencia.MelhorRespostaMotora == "ExtensaoAnormal" ? ListaMelhorRespostaMotora.ExtensaoAnormal :
                                (consciencia.MelhorRespostaMotora == "NenhumaResposta" ? ListaMelhorRespostaMotora.NenhumaResposta : ListaMelhorRespostaMotora.NaoSeAplica)),
                            MelhorRespostaVerbal = (consciencia.MelhorRespostaVerbal == "Orientado" ? ListaMelhorRespostaVerbal.Orientado :
                                consciencia.MelhorRespostaVerbal == "ConversacaoConfusa" ? ListaMelhorRespostaVerbal.ConversacaoConfusa :
                                consciencia.MelhorRespostaVerbal == "FalaInadequada" ? ListaMelhorRespostaVerbal.FalaInadequada :
                                consciencia.MelhorRespostaVerbal == "SonsIncopativeis" ? ListaMelhorRespostaVerbal.SonsIncopativeis :
                                (consciencia.MelhorRespostaVerbal == "NenhumaResposta" ? ListaMelhorRespostaVerbal.NenhumaResposta : ListaMelhorRespostaVerbal.NaoSeAplica)),
                            AvaliacaoSedacao = (consciencia.AvaliacaoSedacao == "Grau1" ? ListaAvaliacaoSedacao.Grau1 : consciencia.AvaliacaoSedacao ==
                                "Grau2" ? ListaAvaliacaoSedacao.Grau2 : consciencia.AvaliacaoSedacao == "Grau3" ? ListaAvaliacaoSedacao.Grau3 :
                                consciencia.AvaliacaoSedacao == "Grau4" ? ListaAvaliacaoSedacao.Grau4 : consciencia.AvaliacaoSedacao == "Grau5" ?
                                ListaAvaliacaoSedacao.Grau5 : (consciencia.AvaliacaoSedacao == "Grau6" ? ListaAvaliacaoSedacao.Grau6 : ListaAvaliacaoSedacao.NaoSeAplica)),
                            AvaliacaoConscienciaGlasgow = consciencia.AvaliacaoConscienciaGlasgow
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as consciencias cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConscienciaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém consciencias com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public ConscienciaModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(c => c.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consciencia"></param>
        /// <param name="_tb_consciencia"></param>
        private static void Atribuir(ConscienciaModel consciencia, tb_consciencia _tb_consciencia)
        {
            _tb_consciencia.IdConsultaVariavel = consciencia.IdConsultaVariavel;
            _tb_consciencia.AberturaOcular = consciencia.AberturaOcular.ToString();
            _tb_consciencia.MelhorRespostaMotora = consciencia.MelhorRespostaMotora.ToString();
            _tb_consciencia.MelhorRespostaVerbal = consciencia.MelhorRespostaVerbal.ToString();
            _tb_consciencia.AvaliacaoSedacao = consciencia.AvaliacaoSedacao.ToString();
            _tb_consciencia.AvaliacaoConscienciaGlasgow = consciencia.AvaliacaoConscienciaGlasgow;
        }
    }
}