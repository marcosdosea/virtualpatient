using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorSituacaoQueixa
    {
        public static GerenciadorSituacaoQueixa gSituacaoQueixa;

        private GerenciadorSituacaoQueixa()
        {
        }

        public static GerenciadorSituacaoQueixa GetInstance()
        {
            if (gSituacaoQueixa == null)
            {
                gSituacaoQueixa = new GerenciadorSituacaoQueixa();
            }
            return gSituacaoQueixa;
        }

        /// <summary>
        /// inserir dados da situacaoQueixa
        /// </summary>
        /// <param name="situacaoQueixa"></param>
        /// <returns></returns>
        public int Inserir(SituacaoQueixaModel situacaoQueixa)
        {
            var repSituacaoQueixa = new RepositorioGenerico<tb_situacao_queixa>();
            tb_situacao_queixa _tb_situacao_queixa = new tb_situacao_queixa();
            try
            {
                Atribuir(situacaoQueixa, _tb_situacao_queixa);

                repSituacaoQueixa.Inserir(_tb_situacao_queixa);
                repSituacaoQueixa.SaveChanges();

                return _tb_situacao_queixa.IdSituacaoQueixa;
            }
            catch (Exception e)
            {
                throw new NegocioException("SituacaoQueixa", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da SituacaoQueixa
        /// </summary>
        /// <param name="situacaoQueixa"></param>
        public void Atualizar(SituacaoQueixaModel situacaoQueixa)
        {
            try
            {
                var repSituacaoQueixa = new RepositorioGenerico<tb_situacao_queixa>();
                tb_situacao_queixa _tb_situacao_queixa = repSituacaoQueixa.ObterEntidade(d => d.IdSituacaoQueixa == situacaoQueixa.IdSituacaoQueixa);
                Atribuir(situacaoQueixa, _tb_situacao_queixa);

                repSituacaoQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("SituacaoQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da SituacaoQueixa
        /// </summary>
        /// <param name="idSituacaoQueixa"></param>
        public void Remover(int idSituacaoQueixa)
        {
            try
            {
                var repSituacaoQueixa = new RepositorioGenerico<tb_situacao_queixa>();
                repSituacaoQueixa.Remover(d => d.IdSituacaoQueixa == idSituacaoQueixa);
                repSituacaoQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("SituacaoQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<SituacaoQueixaModel> GetQuery()
        {
            var repSituacaoQueixa = new RepositorioGenerico<tb_situacao_queixa>();
            var pvEntities = (pvEntities)repSituacaoQueixa.ObterContexto();
            var query = from tb_situacao_queixa in pvEntities.tb_situacao_queixa
                        select new SituacaoQueixaModel
                        {
                            IdSituacaoQueixa = tb_situacao_queixa.IdSituacaoQueixa,
                            DescricaoSituacao = tb_situacao_queixa.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as situações queixas cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SituacaoQueixaModel> ObterTodos()
        {
            return GetQuery().ToList().OrderBy(qm => qm.DescricaoSituacao);
        }

        /// <summary>
        /// Obtém SituacaoQueixa com o código especificiado
        /// </summary>
        /// <param name="idSituacaoQueixa"></param>
        /// <returns></returns>
        public SituacaoQueixaModel Obter(int idSituacaoQueixa)
        {
            return GetQuery().Where(sq => sq.IdSituacaoQueixa == idSituacaoQueixa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir da descricção
        /// </summary>
        /// <param name="descricao"></param>
        /// <returns></returns>
        public IEnumerable<SituacaoQueixaModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(sq => sq.DescricaoSituacao.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="situacaoQueixa"></param>
        /// <param name="_tb_situacao_queixa"></param>
        private static void Atribuir(SituacaoQueixaModel situacaoQueixa, tb_situacao_queixa _tb_situacao_queixa)
        {
            _tb_situacao_queixa.Descricao = situacaoQueixa.DescricaoSituacao;
        }
    }
}