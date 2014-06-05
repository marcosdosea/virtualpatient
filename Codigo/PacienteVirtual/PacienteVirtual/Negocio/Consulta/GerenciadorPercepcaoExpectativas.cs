using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPercepcaoExpectativas
    {
        private static GerenciadorPercepcaoExpectativas gCirculacao;

        private GerenciadorPercepcaoExpectativas() { }

        public static GerenciadorPercepcaoExpectativas GetInstance()
        {
            if (gCirculacao == null)
            {
                gCirculacao = new GerenciadorPercepcaoExpectativas();
            }
            return gCirculacao;
        }

        /// <summary>
        /// Faz correção de PercepcaoExpectativas de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="percepcaoExpectativas"></param>
        /// <param name="peGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(PercepcaoExpectativasModel percepcaoExpectativas, PercepcaoExpectativasModel peGabarito, ModelStateDictionary modelState)
        {
            Global.CorrecaoDeStrings("duvidasQuestionamentos", percepcaoExpectativas.duvidasQuestionamentos, peGabarito.duvidasQuestionamentos, modelState);
            Global.CorrecaoDeStrings("quantoDoenca", percepcaoExpectativas.quantoDoenca, peGabarito.quantoDoenca, modelState);
        } 

        /// <summary>
        /// Insere dados da PercepcaoExpectativas
        /// </summary>
        /// <param name="percepcaoExpectativas"></param>
        /// <returns></returns>
        public long Inserir(PercepcaoExpectativasModel percepcaoExpectativas)
        {
            var repPercepcaoExpextativas = new RepositorioGenerico<tb_percepcao_expectativas>();
            tb_percepcao_expectativas _tb_percepcao_expectativas = new tb_percepcao_expectativas();
            try
            {
                Atribuir(percepcaoExpectativas, _tb_percepcao_expectativas);

                repPercepcaoExpextativas.Inserir(_tb_percepcao_expectativas);
                repPercepcaoExpextativas.SaveChanges();

                return _tb_percepcao_expectativas.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("PercepcaoExpectativas", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do percepcaoExpectativas
        /// </summary>
        /// <param name="percepcaoExpectativas"></param>
        public void Atualizar(PercepcaoExpectativasModel percepcaoExpectativas)
        {
            try
            {
                var repPercepcaoExpextativas = new RepositorioGenerico<tb_percepcao_expectativas>();
                tb_percepcao_expectativas _tb_percepcao_expectativas = repPercepcaoExpextativas.ObterEntidade(c => c.IdConsultaVariavel == percepcaoExpectativas.IdConsultaVariavel);
                Atribuir(percepcaoExpectativas, _tb_percepcao_expectativas);

                repPercepcaoExpextativas.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PercepcaoExpectativas", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do percepcaoExpectativas especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repPercepcaoExpextativas = new RepositorioGenerico<tb_percepcao_expectativas>();
                repPercepcaoExpextativas.Remover(c => c.IdConsultaVariavel == idConsultaVariavel);
                repPercepcaoExpextativas.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PercepcaoExpectativas", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PercepcaoExpectativasModel> GetQuery()
        {
            var repPercepcaoExpextativas = new RepositorioGenerico<tb_percepcao_expectativas>();
            var pvEntities = (pvEntities)repPercepcaoExpextativas.ObterContexto();
            var query = from percepcaoExpectativas in pvEntities.tb_percepcao_expectativas
                        select new PercepcaoExpectativasModel
                        {
                            IdConsultaVariavel = percepcaoExpectativas.IdConsultaVariavel,
                            quantoDoenca = percepcaoExpectativas.quantoDoenca,
                            duvidasQuestionamentos = percepcaoExpectativas.duvidasQuestionamentos
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as PercepcaoExpectativas cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PercepcaoExpectativasModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém percepcaoExpectativas com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public PercepcaoExpectativasModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(c => c.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="percepcaoExpectativas"></param>
        /// <param name="_tb_percepcao_expectativas"></param>
        private static void Atribuir(PercepcaoExpectativasModel percepcaoExpectativas, tb_percepcao_expectativas _tb_percepcao_expectativas)
        {
            _tb_percepcao_expectativas.IdConsultaVariavel = percepcaoExpectativas.IdConsultaVariavel;
            _tb_percepcao_expectativas.quantoDoenca = percepcaoExpectativas.quantoDoenca;
            _tb_percepcao_expectativas.duvidasQuestionamentos = percepcaoExpectativas.duvidasQuestionamentos;
        }
    }
}