using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorEstadoCivil
    {
        public static GerenciadorEstadoCivil gEstadoCivil;

        private GerenciadorEstadoCivil()
        {
        }

        public static GerenciadorEstadoCivil GetInstance()
        {
            if (gEstadoCivil == null)
            {
                gEstadoCivil = new GerenciadorEstadoCivil();
            }
            return gEstadoCivil;
        }

        /// <summary>
        /// inserir dados da estadoCivil
        /// </summary>
        /// <param name="estadoCivil"></param>
        /// <returns></returns>
        public int Inserir(EstadoCivilModel estadoCivil)
        {
            var repEstadoCivil = new RepositorioGenerico<tb_estado_civil>();
            tb_estado_civil _tb_estado_civil = new tb_estado_civil();
            try
            {
                Atribuir(estadoCivil, _tb_estado_civil);

                repEstadoCivil.Inserir(_tb_estado_civil);
                repEstadoCivil.SaveChanges();

                return _tb_estado_civil.IdEstadoCivil;
            }
            catch (Exception e)
            {
                throw new NegocioException("EstadoCivil", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da EstadoCivil
        /// </summary>
        /// <param name="estadoCivil"></param>
        public void Atualizar(EstadoCivilModel estadoCivil)
        {
            try
            {
                var repEstadoCivil = new RepositorioGenerico<tb_estado_civil>();
                tb_estado_civil _tb_estado_civil = repEstadoCivil.ObterEntidade(d => d.IdEstadoCivil == estadoCivil.IdEstadoCivil);
                Atribuir(estadoCivil, _tb_estado_civil);

                repEstadoCivil.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("EstadoCivil", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da EstadoCivil
        /// </summary>
        /// <param name="idEstadoCivil"></param>
        public void Remover(int idEstadoCivil)
        {
            try
            {
                var repEstadoCivil = new RepositorioGenerico<tb_estado_civil>();
                repEstadoCivil.Remover(d => d.IdEstadoCivil == idEstadoCivil);
                repEstadoCivil.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("EstadoCivil", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<EstadoCivilModel> GetQuery()
        {
            var repEstadoCivil = new RepositorioGenerico<tb_estado_civil>();
            var pvEntities = (pvEntities)repEstadoCivil.ObterContexto();
            var query = from estadoCivil in pvEntities.tb_estado_civil
                        select new EstadoCivilModel
                        {
                            IdEstadoCivil = estadoCivil.IdEstadoCivil,
                            EstadoCivil = estadoCivil.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as estadosCivis cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EstadoCivilModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém EstadoCivil com o código especificiado
        /// </summary>
        /// <param name="idEstadoCivil"></param>
        /// <returns></returns>
        public EstadoCivilModel Obter(int idEstadoCivil)
        {
            return GetQuery().Where(estadoCivil => estadoCivil.IdEstadoCivil == idEstadoCivil).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do estadoCivil
        /// </summary>
        /// <param name="estadoCivil"></param>
        /// <returns></returns>
        public IEnumerable<EstadoCivilModel> ObterPorNome(string descricaoEstadoCivil)
        {
            return GetQuery().Where(estadoCivil => estadoCivil.EstadoCivil.StartsWith(descricaoEstadoCivil)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="estadoCivil"></param>
        /// <param name="_tb_estado_civil"></param>
        private static void Atribuir(EstadoCivilModel estadoCivil, tb_estado_civil _tb_estado_civil)
        {
            _tb_estado_civil.Descricao = estadoCivil.EstadoCivil;
        }
    }
}