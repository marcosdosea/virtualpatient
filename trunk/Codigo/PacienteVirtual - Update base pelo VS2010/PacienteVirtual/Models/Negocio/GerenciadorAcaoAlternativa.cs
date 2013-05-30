using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorAcaoAlternativa
    {
        private static GerenciadorAcaoAlternativa gAcaoAlternativa;

        private GerenciadorAcaoAlternativa()
        {
        }

        public static GerenciadorAcaoAlternativa GetInstance()
        {
            if (gAcaoAlternativa == null)
            {
                gAcaoAlternativa = new GerenciadorAcaoAlternativa();
            }
            return gAcaoAlternativa;
        }

        /// <summary>
        /// Insere dados do AcaoAlternativa
        /// </summary>
        /// <param name="acaoAlternativa"></param>
        /// <returns></returns>
        public int Inserir(AcaoAlternativaModel acaoAlternativa)
        {
            var repAcaoAlternativa = new RepositorioGenerico<AcaoAlternativaE>();
            AcaoAlternativaE _acaoAlternativaE = new AcaoAlternativaE();
            try
            {
                Atribuir(acaoAlternativa, _acaoAlternativaE);

                repAcaoAlternativa.Inserir(_acaoAlternativaE);
                repAcaoAlternativa.SaveChanges();

                return _acaoAlternativaE.IdAcaoAlternativa;
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoAlternativa", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do acaoAlternativa
        /// </summary>
        /// <param name="acaoAlternativa"></param>
        public void Atualizar(AcaoAlternativaModel acaoAlternativa)
        {
            try
            {
                var repAcaoAlternativa = new RepositorioGenerico<AcaoAlternativaE>();
                AcaoAlternativaE _acaoAlternativaE = repAcaoAlternativa.ObterEntidade(d => d.IdAcaoAlternativa == acaoAlternativa.IdAcaoAlternativa);
                Atribuir(acaoAlternativa, _acaoAlternativaE);

                repAcaoAlternativa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoAlternativa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do AcaoAlternativa
        /// </summary>
        /// <param name="idAcaoAlternativa"></param>
        public void Remover(int idAcaoAlternativa)
        {
            //if (idOcupacao == 1)
            //    throw new NegocioException("A ocupacao não pode ser removido.");
            try
            {
                var repAcaoAlternativa = new RepositorioGenerico<AcaoAlternativaE>();
                repAcaoAlternativa.Remover(d => d.IdAcaoAlternativa == idAcaoAlternativa);
                repAcaoAlternativa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AcaoAlternativa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AcaoAlternativaModel> GetQuery()
        {
            var repAcaoAlternativa = new RepositorioGenerico<AcaoAlternativaE>();
            var pvEntities = (pvEntities)repAcaoAlternativa.ObterContexto();
            var query = from acaoAlternativa in pvEntities.tb_acao_alternativa
                        select new AcaoAlternativaModel
                        {
                            IdAcaoAlternativa = acaoAlternativa.IdAcaoAlternativa,
                            DescricaoAcao = acaoAlternativa.DescricaoAcao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os acaoAlternativa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AcaoAlternativaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém acaoAlternativa com o código especificiado
        /// </summary>
        /// <param name="idAcaoAlternativa"></param>
        /// <returns></returns>
        public AcaoAlternativaModel Obter(int idAcaoAlternativa)
        {
            return GetQuery().Where(acaoAlternativa => acaoAlternativa.IdAcaoAlternativa == idAcaoAlternativa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém acaoalternativa que iniciam com o nome
        /// </summary>
        /// <param name="descricaoAcao"></param>
        /// <returns></returns>
        public IEnumerable<AcaoAlternativaModel> ObterPorNome(string descricaoAcao)
        {
            return GetQuery().Where(acaoAlternativa => acaoAlternativa.DescricaoAcao.StartsWith(descricaoAcao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="acaoAlternativa"></param>
        /// <param name="_acaoAlternativa"></param>
        private static void Atribuir(AcaoAlternativaModel acaoAlternativa, AcaoAlternativaE _acaoAlternativaE)
        {
            _acaoAlternativaE.DescricaoAcao = acaoAlternativa.DescricaoAcao;
        }
    }
}