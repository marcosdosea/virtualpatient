using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorAreaAtuacao
    {
        public static GerenciadorAreaAtuacao gAreaAtuacao;

        private GerenciadorAreaAtuacao()
        {
        }

        public static GerenciadorAreaAtuacao GetInstance()
        {
            if (gAreaAtuacao == null)
            {
                gAreaAtuacao = new GerenciadorAreaAtuacao();
            }
            return gAreaAtuacao;
        }

        /// <summary>
        /// inserir dados da areaAtuacao
        /// </summary>
        /// <param name="areaAtuacao"></param>
        /// <returns></returns>
        public int Inserir(AreaAtuacaoModel areaAtuacao)
        {
            var repAreaAtuacao = new RepositorioGenerico<tb_area_atuacao>();
            tb_area_atuacao _tb_area_atuacao = new tb_area_atuacao();
            try
            {
                Atribuir(areaAtuacao, _tb_area_atuacao);

                repAreaAtuacao.Inserir(_tb_area_atuacao);
                repAreaAtuacao.SaveChanges();

                return _tb_area_atuacao.IdAreaAtuacao;
            }
            catch (Exception e)
            {
                throw new NegocioException("AreaAtuacao", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da AreaAtuacao
        /// </summary>
        /// <param name="areaAtuacao"></param>
        public void Atualizar(AreaAtuacaoModel areaAtuacao)
        {
            try
            {
                var repAreaAtuacao = new RepositorioGenerico<tb_area_atuacao>();
                tb_area_atuacao _tb_area_atuacao = repAreaAtuacao.ObterEntidade(d => d.IdAreaAtuacao == areaAtuacao.IdAreaAtuacao);
                Atribuir(areaAtuacao, _tb_area_atuacao);

                repAreaAtuacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AreaAtuacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da AreaAtuacao
        /// </summary>
        /// <param name="idAreaAtuacao"></param>
        public void Remover(int idAreaAtuacao)
        {
            try
            {
                var repAreaAtuacao = new RepositorioGenerico<tb_area_atuacao>();
                repAreaAtuacao.Remover(d => d.IdAreaAtuacao == idAreaAtuacao);
                repAreaAtuacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AreaAtuacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AreaAtuacaoModel> GetQuery()
        {
            var repAreaAtuacao = new RepositorioGenerico<tb_area_atuacao>();
            var pvEntities = (pvEntities)repAreaAtuacao.ObterContexto();
            var query = from areaAtuacao in pvEntities.tb_area_atuacao
                        select new AreaAtuacaoModel
                        {
                            IdAreaAtuacao = areaAtuacao.IdAreaAtuacao,
                            AreaAtuacao = areaAtuacao.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as areaAtuações cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AreaAtuacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém AreaAtuacao com o código especificiado
        /// </summary>
        /// <param name="idAreaAtuacao"></param>
        /// <returns></returns>
        public AreaAtuacaoModel Obter(int idAreaAtuacao)
        {
            return GetQuery().Where(areaAtuacao => areaAtuacao.IdAreaAtuacao == idAreaAtuacao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do areaAtuacao
        /// </summary>
        /// <param name="areaAtuacao"></param>
        /// <returns></returns>
        public IEnumerable<AreaAtuacaoModel> ObterPorNome(string descricaoAreaAtuacao)
        {
            return GetQuery().Where(areaAtuacao => areaAtuacao.AreaAtuacao.StartsWith(descricaoAreaAtuacao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="areaAtuacao"></param>
        /// <param name="_tb_area_atuacao"></param>
        private static void Atribuir(AreaAtuacaoModel areaAtuacao, tb_area_atuacao _tb_area_atuacao)
        {
            _tb_area_atuacao.Descricao = areaAtuacao.AreaAtuacao;
        }
    }
}