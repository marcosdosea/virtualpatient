using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorBebida
    {
        public static GerenciadorBebida gBebida;

        private GerenciadorBebida()
        {
        }

        public static GerenciadorBebida GetInstance()
        {
            if (gBebida == null)
            {
                gBebida = new GerenciadorBebida();
            }
            return gBebida;
        }

        /// <summary>
        /// inserir dados da bebida
        /// </summary>
        /// <param name="bebida"></param>
        /// <returns></returns>
        public int Inserir(BebidaModel bebida)
        {
            var repBebida = new RepositorioGenerico<tb_bebida>();
            tb_bebida _tb_bebida = new tb_bebida();
            try
            {
                Atribuir(bebida, _tb_bebida);

                repBebida.Inserir(_tb_bebida);
                repBebida.SaveChanges();

                return _tb_bebida.IdBebida;
            }
            catch (Exception e)
            {
                throw new NegocioException("Bebida", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Bebida
        /// </summary>
        /// <param name="bebida"></param>
        public void Atualizar(BebidaModel bebida)
        {
            try
            {
                var repBebida = new RepositorioGenerico<tb_bebida>();
                tb_bebida _tb_bebida = repBebida.ObterEntidade(d => d.IdBebida == bebida.IdBebida);
                Atribuir(bebida, _tb_bebida);

                repBebida.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Bebida", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Bebida
        /// </summary>
        /// <param name="idBebida"></param>
        public void Remover(int idBebida)
        {
            try
            {
                var repBebida = new RepositorioGenerico<tb_bebida>();
                repBebida.Remover(d => d.IdBebida == idBebida);
                repBebida.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Bebida", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<BebidaModel> GetQuery()
        {
            var repBebida = new RepositorioGenerico<tb_bebida>();
            var pvEntities = (pvEntities)repBebida.ObterContexto();
            var query = from bebida in pvEntities.tb_bebida
                        select new BebidaModel
                        {
                            IdBebida = bebida.IdBebida,
                            Nome = bebida.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os niveis cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<BebidaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Bebida com o código especificiado
        /// </summary>
        /// <param name="idBebida"></param>
        /// <returns></returns>
        public BebidaModel Obter(int idBebida)
        {
            return GetQuery().Where(bebida => bebida.IdBebida == idBebida).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<BebidaModel> ObterPorNome(string nome)
        {
            return GetQuery().Where(bebida => bebida.Nome.StartsWith(nome)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="bebida"></param>
        /// <param name="_tb_bebida"></param>
        private static void Atribuir(BebidaModel bebida, tb_bebida _tb_bebida)
        {
            _tb_bebida.Nome = bebida.Nome;
        }
    }
}