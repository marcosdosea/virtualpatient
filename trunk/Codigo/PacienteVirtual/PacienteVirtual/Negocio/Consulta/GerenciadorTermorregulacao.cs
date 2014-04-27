using System;
using System.Collections.Generic;
using System.Linq;
using Persistence;
using PacienteVirtual.Models;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorTermorregulacao
    {
        private static GerenciadorTermorregulacao gTermorregulacao;

        private GerenciadorTermorregulacao() { }

        public static GerenciadorTermorregulacao GetInstance()
        {
            if (gTermorregulacao == null)
            {
                gTermorregulacao = new GerenciadorTermorregulacao();
            }
            return gTermorregulacao;
        }

        /// <summary>
        /// Faz correção de Termorregulacao de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas()
        {
            
        }

        /// <summary>
        /// Insere dados do termorregulacao
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <returns></returns>
        public long Inserir(TermorregulacaoModel termorregulacao)
        {
            var reptermorregulacao = new RepositorioGenerico<tb_termorregulacao>();
            tb_termorregulacao _termorregulacaoE = new tb_termorregulacao();
            try
            {
                Atribuir(termorregulacao, _termorregulacaoE);

                reptermorregulacao.Inserir(_termorregulacaoE);
                reptermorregulacao.SaveChanges();

                return _termorregulacaoE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("termorregulacao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do oxigenacao
        /// </summary>
        /// <param name="oxigenacao"></param>
        public void Atualizar(TermorregulacaoModel termorregulacao)
        {
            try
            {
                var reptermorregulacao = new RepositorioGenerico<tb_termorregulacao>();
                tb_termorregulacao _termorregulacaoE = reptermorregulacao.ObterEntidade(t => t.IdConsultaVariavel == termorregulacao.IdConsultaVariavel);
                Atribuir(termorregulacao, _termorregulacaoE);

                reptermorregulacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("termorregulacao", e.Message, e);
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
                var reptermorregulacao = new RepositorioGenerico<tb_termorregulacao>();
                reptermorregulacao.Remover(t => t.IdConsultaVariavel == idConsultaVariavel);
                reptermorregulacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("termorregulacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<TermorregulacaoModel> GetQuery()
        {
            var reptermorregulacao = new RepositorioGenerico<tb_termorregulacao>();
            var pvEntities = (pvEntities)reptermorregulacao.ObterContexto();
            var query = from termorregulacao in pvEntities.tb_termorregulacao
                        select new TermorregulacaoModel
                        {
                            Temperatura = (double)termorregulacao.Temperatura,
                            TemperaturaPele = ListaTemperaturaPele.Quente,
                            Sudorese = termorregulacao.Sudorese,
                            Calafrio = termorregulacao.Calafrio,
                            Piloerecao = termorregulacao.Piloerecao,
                            IdConsultaVariavel = termorregulacao.IdConsultaVariavel
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os termorregulacao cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TermorregulacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém termorregulacao com o código da consulta fixa especificiado
        /// </summary>
        /// <returns></returns>
        public TermorregulacaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(termorregulacao => termorregulacao.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="_termorregulacaoE"></param>
        private static void Atribuir(TermorregulacaoModel termorregulacao, tb_termorregulacao _termorregulacaoE)
        {
            _termorregulacaoE.IdConsultaVariavel = termorregulacao.IdConsultaVariavel;
            _termorregulacaoE.Temperatura = (decimal)termorregulacao.Temperatura;
            _termorregulacaoE.TemperaturaPele = ListaTemperaturaPele.Quente.ToString();
            _termorregulacaoE.Sudorese = termorregulacao.Sudorese;
            _termorregulacaoE.Calafrio = termorregulacao.Calafrio;
            _termorregulacaoE.Piloerecao = termorregulacao.Piloerecao;
        }
    }
}