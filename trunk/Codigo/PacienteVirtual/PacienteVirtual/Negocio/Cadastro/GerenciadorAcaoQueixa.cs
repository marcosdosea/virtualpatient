using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Persistence;
using Negocio;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Cadastro;

namespace PacienteVirtual.Negocio.Cadastro
{
    public class GerenciadorAcaoQueixa
    {
        public static GerenciadorAcaoQueixa gAcaoQueixa;

        private GerenciadorAcaoQueixa()
        {
        }

        public static GerenciadorAcaoQueixa GetInstance()
        {
            if (gAcaoQueixa == null)
            {
                gAcaoQueixa = new GerenciadorAcaoQueixa();
            }
            return gAcaoQueixa;
        }

        /// <summary>
        /// inserir dados da acaoQueixa
        /// </summary>
        /// <param name="acaoQueixa"></param>
        /// <returns></returns>
        public int Inserir(AcaoQueixaModel acaoQueixa)
        {
            var repAcaoQueixa = new RepositorioGenerico<tb_acao_queixa>();
            tb_acao_queixa _tb_acao_queixa = new tb_acao_queixa();
            try
            {
                Atribuir(acaoQueixa, _tb_acao_queixa);

                repAcaoQueixa.Inserir(_tb_acao_queixa);
                repAcaoQueixa.SaveChanges();

                return _tb_acao_queixa.IdAcaoQueixa;
            }
            catch (Exception e)
            {
                throw new NegocioException("AcaoQueixa", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da AcaoQueixa
        /// </summary>
        /// <param name="acaoQueixa"></param>
        public void Atualizar(AcaoQueixaModel acaoQueixa)
        {
            try
            {
                var repAcaoQueixa = new RepositorioGenerico<tb_acao_queixa>();
                tb_acao_queixa _tb_acao_queixa = repAcaoQueixa.ObterEntidade(d => d.IdAcaoQueixa == acaoQueixa.IdAcaoQueixa);
                Atribuir(acaoQueixa, _tb_acao_queixa);

                repAcaoQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da AcaoQueixa
        /// </summary>
        /// <param name="idAcaoQueixa"></param>
        public void Remover(int idAcaoQueixa)
        {
            try
            {
                var repAcaoQueixa = new RepositorioGenerico<tb_acao_queixa>();
                repAcaoQueixa.Remover(d => d.IdAcaoQueixa == idAcaoQueixa);
                repAcaoQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AcaoQueixaModel> GetQuery()
        {
            var repAcaoQueixa = new RepositorioGenerico<tb_acao_queixa>();
            var pvEntities = (pvEntities)repAcaoQueixa.ObterContexto();
            var query = from tb_acao_queixa in pvEntities.tb_acao_queixa
                        select new AcaoQueixaModel
                        {
                            IdAcaoQueixa = tb_acao_queixa.IdAcaoQueixa,
                            DescricaoAcao = tb_acao_queixa.DescricaoAcao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as ações queixas cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AcaoQueixaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém AcaoQueixa com o código especificiado
        /// </summary>
        /// <param name="idAcaoQueixa"></param>
        /// <returns></returns>
        public AcaoQueixaModel Obter(int idAcaoQueixa)
        {
            return GetQuery().Where(aq => aq.IdAcaoQueixa == idAcaoQueixa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir da descricção
        /// </summary>
        /// <param name="descricao"></param>
        /// <returns></returns>
        public IEnumerable<AcaoQueixaModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(aq => aq.DescricaoAcao.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="acaoQueixa"></param>
        /// <param name="_tb_acao_queixa"></param>
        private static void Atribuir(AcaoQueixaModel acaoQueixa, tb_acao_queixa _tb_acao_queixa)
        {
            _tb_acao_queixa.DescricaoAcao = acaoQueixa.DescricaoAcao;
        }
    }
}