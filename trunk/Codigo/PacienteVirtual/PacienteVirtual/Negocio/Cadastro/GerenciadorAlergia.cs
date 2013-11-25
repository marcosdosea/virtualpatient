using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorAlergia
    {
        public static GerenciadorAlergia gAlergia;

        private GerenciadorAlergia()
        {
        }

        public static GerenciadorAlergia GetInstance()
        {
            if (gAlergia == null)
            {
                gAlergia = new GerenciadorAlergia();
            }
            return gAlergia;
        }

        /// <summary>
        /// inserir dados da alergia
        /// </summary>
        /// <param name="alergia"></param>
        /// <returns></returns>
        public int Inserir(AlergiaModel alergia)
        {
            var repAlergia = new RepositorioGenerico<tb_alergia>();
            tb_alergia _tb_alergia = new tb_alergia();
            try
            {
                Atribuir(alergia, _tb_alergia);

                repAlergia.Inserir(_tb_alergia);
                repAlergia.SaveChanges();

                return _tb_alergia.IdAlergia;
            }
            catch (Exception e)
            {
                throw new NegocioException("Alergia", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Alergia
        /// </summary>
        /// <param name="alergia"></param>
        public void Atualizar(AlergiaModel alergia)
        {
            try
            {
                var repAlergia = new RepositorioGenerico<tb_alergia>();
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(d => d.IdAlergia == alergia.IdAlergia);
                Atribuir(alergia, _tb_alergia);

                repAlergia.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Alergia", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Alergia
        /// </summary>
        /// <param name="idAlergia"></param>
        public void Remover(int idAlergia)
        {
            try
            {
                var repAlergia = new RepositorioGenerico<tb_alergia>();
                repAlergia.Remover(d => d.IdAlergia == idAlergia);
                repAlergia.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Alergia", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AlergiaModel> GetQuery()
        {
            var repAlergia = new RepositorioGenerico<tb_alergia>();
            var pvEntities = (pvEntities)repAlergia.ObterContexto();
            var query = from alergia in pvEntities.tb_alergia
                        select new AlergiaModel
                        {
                            IdAlergia = alergia.IdAlergia,
                            Alergia = alergia.Alergia
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os alergias cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AlergiaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Alergia com o código especificiado
        /// </summary>
        /// <param name="idAlergia"></param>
        /// <returns></returns>
        public AlergiaModel Obter(int idAlergia)
        {
            return GetQuery().Where(alergia => alergia.IdAlergia == idAlergia).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do alergia
        /// </summary>
        /// <param name="alergia"></param>
        /// <returns></returns>
        public IEnumerable<AlergiaModel> ObterPorNome(string alergia1)
        {
            return GetQuery().Where(alergia => alergia.Alergia.StartsWith(alergia1)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="alergia"></param>
        /// <param name="_tb_alergia"></param>
        private static void Atribuir(AlergiaModel alergia, tb_alergia _tb_alergia)
        {
            _tb_alergia.Alergia = alergia.Alergia;
        }
    }
}