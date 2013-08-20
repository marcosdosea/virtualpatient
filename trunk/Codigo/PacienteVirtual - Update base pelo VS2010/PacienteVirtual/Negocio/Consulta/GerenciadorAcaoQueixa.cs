using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Persistence;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorAcaoQueixa
    {
        private static GerenciadorAcaoQueixa gAcaoQueixa;

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
        /// Insere dados do AcaoQueixa
        /// </summary>
        /// <param name="acaoQueixa"></param>
        /// <returns></returns>
        public int Inserir(AcaoQueixaModel acaoQueixa)
        {
            var repAcaoQueixa = new RepositorioGenerico<AcaoQueixaE>();
            AcaoQueixaE _acaoQueixaE = new AcaoQueixaE();
            try
            {
                Atribuir(acaoQueixa, _acaoQueixaE);

                repAcaoQueixa.Inserir(_acaoQueixaE);
                repAcaoQueixa.SaveChanges();

                return _acaoQueixaE.IdAcaoQueixa;
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoQueixa", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do acaoQueixa
        /// </summary>
        /// <param name="acaoQueixa"></param>
        public void Atualizar(AcaoQueixaModel acaoQueixa)
        {
            try
            {
                var repAcaoQueixa = new RepositorioGenerico<AcaoQueixaE>();
                AcaoQueixaE _acaoQueixaE = repAcaoQueixa.ObterEntidade(d => d.IdAcaoQueixa == acaoQueixa.IdAcaoQueixa);
                Atribuir(acaoQueixa, _acaoQueixaE);

                repAcaoQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do AcaoQueixa
        /// </summary>
        /// <param name="idAcaoAlternativa"></param>
        public void Remover(int idAcaoQueixa)
        {
            try
            {
                var repAcaoQueixa = new RepositorioGenerico<AcaoQueixaE>();
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
            var repAcaoQueixa = new RepositorioGenerico<AcaoQueixaE>();
            var pvEntities = (pvEntities)repAcaoQueixa.ObterContexto();
            var query = from acaoQueixa in pvEntities.tb_acao_queixa
                        select new AcaoQueixaModel
                        {
                            IdAcaoQueixa = acaoQueixa.IdAcaoQueixa,
                            DescricaoAcao = acaoQueixa.DescricaoAcao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os acaoQueixa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AcaoQueixaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém acaoQueixa com o código especificiado
        /// </summary>
        /// <param name="idAcaoQueixa"></param>
        /// <returns></returns>
        public AcaoQueixaModel Obter(int idAcaoQueixa)
        {
            return GetQuery().Where(acaoQueixa => acaoQueixa.IdAcaoQueixa == idAcaoQueixa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém acaoQueixa que iniciam com o descricaoAcao
        /// </summary>
        /// <param name="descricaoAcao"></param>
        /// <returns></returns>
        public IEnumerable<AcaoQueixaModel> ObterPorNome(string descricaoAcao)
        {
            return GetQuery().Where(acaoQueixa => acaoQueixa.DescricaoAcao.StartsWith(descricaoAcao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="acaoQueixa"></param>
        /// <param name="_acaoQueixaE"></param>
        private static void Atribuir(AcaoQueixaModel acaoQueixa, AcaoQueixaE _acaoQueixaE)
        {
            _acaoQueixaE.DescricaoAcao = acaoQueixa.DescricaoAcao;
        }
    }
}