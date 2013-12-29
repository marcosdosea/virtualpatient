using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorNaturalidade
    {
        public static GerenciadorNaturalidade gNaturalidade;

        private GerenciadorNaturalidade()
        {
        }

        public static GerenciadorNaturalidade GetInstance()
        {
            if (gNaturalidade == null)
            {
                gNaturalidade = new GerenciadorNaturalidade();
            }
            return gNaturalidade;
        }

        /// <summary>
        /// inserir dados da naturalidade
        /// </summary>
        /// <param name="naturalidade"></param>
        /// <returns></returns>
        public int Inserir(NaturalidadeModel naturalidade)
        {
            var repNaturalidade = new RepositorioGenerico<tb_naturalidade>();
            tb_naturalidade _tb_naturalidade = new tb_naturalidade();
            try
            {
                Atribuir(naturalidade, _tb_naturalidade);

                repNaturalidade.Inserir(_tb_naturalidade);
                repNaturalidade.SaveChanges();

                return _tb_naturalidade.IdNaturalidade;
            }
            catch (Exception e)
            {
                throw new NegocioException("Naturalidade", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Naturalidade
        /// </summary>
        /// <param name="naturalidade"></param>
        public void Atualizar(NaturalidadeModel naturalidade)
        {
            try
            {
                var repNaturalidade = new RepositorioGenerico<tb_naturalidade>();
                tb_naturalidade _tb_naturalidade = repNaturalidade.ObterEntidade(d => d.IdNaturalidade == naturalidade.IdNaturalidade);
                Atribuir(naturalidade, _tb_naturalidade);

                repNaturalidade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Naturalidade", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Naturalidade
        /// </summary>
        /// <param name="idNaturalidade"></param>
        public void Remover(int idNaturalidade)
        {
            try
            {
                var repNaturalidade = new RepositorioGenerico<tb_naturalidade>();
                repNaturalidade.Remover(d => d.IdNaturalidade == idNaturalidade);
                repNaturalidade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Naturalidade", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<NaturalidadeModel> GetQuery()
        {
            var repNaturalidade = new RepositorioGenerico<tb_naturalidade>();
            var pvEntities = (pvEntities)repNaturalidade.ObterContexto();
            var query = from naturalidade in pvEntities.tb_naturalidade
                        select new NaturalidadeModel
                        {
                            IdNaturalidade = naturalidade.IdNaturalidade,
                            Naturalidade = naturalidade.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as naturalidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<NaturalidadeModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Naturalidade com o código especificiado
        /// </summary>
        /// <param name="idNaturalidade"></param>
        /// <returns></returns>
        public NaturalidadeModel Obter(int idNaturalidade)
        {
            return GetQuery().Where(naturalidade => naturalidade.IdNaturalidade == idNaturalidade).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do naturalidade
        /// </summary>
        /// <param name="naturalidade"></param>
        /// <returns></returns>
        public IEnumerable<NaturalidadeModel> ObterPorNome(string descricaoNaturalidade)
        {
            return GetQuery().Where(naturalidade => naturalidade.Naturalidade.StartsWith(descricaoNaturalidade)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="naturalidade"></param>
        /// <param name="_tb_naturalidade"></param>
        private static void Atribuir(NaturalidadeModel naturalidade, tb_naturalidade _tb_naturalidade)
        {
            _tb_naturalidade.Descricao = naturalidade.Naturalidade;
        }
    }
}