using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dados;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorOcupacao
    {
        private static GerenciadorOcupacao gOcupacao;

        private GerenciadorOcupacao()
        {
        }

        public static GerenciadorOcupacao GetInstance()
        {
            if (gOcupacao == null)
            {
                gOcupacao = new GerenciadorOcupacao();
            }
            return gOcupacao;
        }

        /// <summary>
        /// Insere dados do ocupacao
        /// </summary>
        /// <param name="ocupacao"></param>
        /// <returns></returns>
        public int Inserir(OcupacaoModel ocupacao)
        {
            var repOcupacao = new RepositorioGenerico<OcupacaoE>();
            OcupacaoE _ocupacaoE = new OcupacaoE();
            try
            {
                Atribuir(ocupacao, _ocupacaoE);

                repOcupacao.Inserir(_ocupacaoE);
                repOcupacao.SaveChanges();

                return _ocupacaoE.IdOcupacao;
            }
            catch (Exception e)
            {
                throw new DadosException("Ocupacao", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do ocupacao
        /// </summary>
        /// <param name="ocupacao"></param>
        public void Atualizar(OcupacaoModel ocupacao)
        {
            try
            {
                var repOcupacao = new RepositorioGenerico<OcupacaoE>();
                OcupacaoE _ocupacaoE = repOcupacao.ObterEntidade(d => d.IdOcupacao == ocupacao.IdOcupacao);
                Atribuir(ocupacao, _ocupacaoE);

                repOcupacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Ocupacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do ocupacao
        /// </summary>
        /// <param name="idOcupacao"></param>
        public void Remover(int idOcupacao)
        {
            try
            {
                var repOcupacao = new RepositorioGenerico<OcupacaoE>();
                repOcupacao.Remover(d => d.IdOcupacao == idOcupacao);
                repOcupacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Ocupacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<OcupacaoModel> GetQuery()
        {
            var repOcupacao = new RepositorioGenerico<OcupacaoE>();
            var pvEntities = (pvEntities)repOcupacao.ObterContexto();
            var query = from ocupacao in pvEntities.tb_ocupacao
                        select new OcupacaoModel
                        {
                            IdOcupacao = ocupacao.IdOcupacao,
                            Descricao = ocupacao.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os ocupacao cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<OcupacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ocupacao com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public OcupacaoModel Obter(int idOcupacao)
        {
            return GetQuery().Where(ocupacao => ocupacao.IdOcupacao == idOcupacao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém ocupaçoes que iniciam com o descrição
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<OcupacaoModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(ocupacao => ocupacao.Descricao.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="ocupacao"></param>
        /// <param name="_ocupacaoE"></param>
        private static void Atribuir(OcupacaoModel ocupacao, OcupacaoE _ocupacaoE)
        {
            _ocupacaoE.Descricao = ocupacao.Descricao;
        }
    }
}