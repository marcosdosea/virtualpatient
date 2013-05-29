﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorResposta
    {
        private static GerenciadorResposta gResposta;

        private GerenciadorResposta() { }

        public static GerenciadorResposta GetInstance()
        {
            if (gResposta == null)
            {
                gResposta = new GerenciadorResposta();
            }
            return gResposta;
        }

        /// <summary>
        /// Insere dados do resposta
        /// </summary>
        /// <param name="resposta"></param>
        /// <returns></returns>
        public int Inserir(RespostaModel resposta)
        {
            var repCurso = new RepositorioGenerico<RespostaE>();
            RespostaE _respostaE = new RespostaE();
            try
            {
                Atribuir(resposta, _respostaE);

                repCurso.Inserir(_respostaE);
                repCurso.SaveChanges();

                return _respostaE.IdResposta;
            }
            catch (Exception e)
            {
                throw new DadosException("Resposta", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do resposta
        /// </summary>
        /// <param name="resposta"></param>
        public void Atualizar(RespostaModel resposta)
        {
            try
            {
                var repCurso = new RepositorioGenerico<RespostaE>();
                RespostaE _respostaE = repCurso.ObterEntidade(c => c.IdResposta == resposta.IdResposta);
                Atribuir(resposta, _respostaE);

                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Resposta", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do resposta
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int idResposta)
        {
            //if (idResposta == 1)
            //    throw new NegocioException("A resposta não pode ser removido.");
            try
            {
                var repCurso = new RepositorioGenerico<RespostaE>();
                repCurso.Remover(c => c.IdResposta == idResposta);
                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Resposta", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<RespostaModel> GetQuery()
        {
            var repCurso = new RepositorioGenerico<RespostaE>();
            var pvEntities = (pvEntities)repCurso.ObterContexto();
            var query = from tb_resposta in pvEntities.tb_resposta
                        join tb_pergunta in pvEntities.tb_pergunta
                        on tb_resposta.IdPergunta equals tb_pergunta.IdPergunta
                        select new RespostaModel
                        {
                            IdResposta = tb_resposta.IdResposta,
                            IdPergunta = tb_resposta.IdPergunta,
                            Resposta = tb_resposta.Resposta,
                            Pergunta = tb_pergunta.Pergunta
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os resposta cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<RespostaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém resposta com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public RespostaModel Obter(int idResposta)
        {
            return GetQuery().Where(resposta => resposta.IdResposta == idResposta).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém respostas que iniciam com nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<RespostaModel> ObterPorNome(string nomeResposta)
        {
            return GetQuery().Where(resposta => resposta.Resposta.StartsWith(nomeResposta)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="resposta"></param>
        /// <param name="_respostaE"></param>
        private static void Atribuir(RespostaModel resposta, RespostaE _respostaE)
        {
            _respostaE.Resposta = resposta.Resposta;
            _respostaE.IdPergunta = resposta.IdPergunta;
        }
    }
}