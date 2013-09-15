using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorQueixa
    {
        private static GerenciadorQueixa gQueixa;

        private GerenciadorQueixa() { }

        public static GerenciadorQueixa GetInstance()
        {
            if (gQueixa == null)
            {
                gQueixa = new GerenciadorQueixa();
            }
            return gQueixa;
        }

        /// <summary>
        /// Insere dados do Queixa
        /// </summary>
        /// <param name="queixa"></param>
        /// <returns></returns>
        public int Inserir(QueixaModel queixa)
        {
            var repQueixa = new RepositorioGenerico<tb_queixa>();
            tb_queixa _queixaE = new tb_queixa();
            try
            {
                Atribuir(queixa, _queixaE);

                repQueixa.Inserir(_queixaE);
                repQueixa.SaveChanges();

                return _queixaE.IdQueixa;
            }
            catch (Exception e)
            {
                throw new DadosException("Queixa", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do queixa
        /// </summary>
        /// <param name="queixa"></param>
        public void Atualizar(QueixaModel queixa)
        {
            try
            {
                var repQueixa = new RepositorioGenerico<tb_queixa>();
                tb_queixa _queixaE = repQueixa.ObterEntidade(c => c.IdQueixa == queixa.IdQueixa);
                Atribuir(queixa, _queixaE);

                repQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Queixa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do queixa
        /// </summary>
        /// <param name="idQueixa"></param>
        public void Remover(int idQueixa)
        {
            try
            {
                var repQueixa = new RepositorioGenerico<tb_queixa>();
                repQueixa.Remover(c => c.IdQueixa == idQueixa);
                repQueixa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Queixa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<QueixaModel> GetQuery()
        {
            var repQueixa = new RepositorioGenerico<tb_queixa>();
            var pvEntities = (pvEntities)repQueixa.ObterContexto();
            var query = from tb_queixa in pvEntities.tb_queixa
                        join tb_sistema in pvEntities.tb_sistema
                        on tb_queixa.IdSistema equals tb_sistema.IdSistema
                        select new QueixaModel
                        {
                            IdQueixa = tb_queixa.IdQueixa,
                            IdSistema = tb_queixa.IdSistema,
                            DescricaoQueixa = tb_queixa.DescricaoQueixa,
                            NomeSistema = tb_sistema.NomeSistema
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os curso cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<QueixaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém queixa com o código especificiado
        /// </summary>
        /// <param name="idQueixa"></param>
        /// <returns></returns>
        public QueixaModel Obter(int idQueixa)
        {
            return GetQuery().Where(queixa => queixa.IdQueixa == idQueixa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém queixas que iniciam com o descricaoQueixa
        /// </summary>
        /// <param name="descricaoQueixa"></param>
        /// <returns></returns>
        public IEnumerable<QueixaModel> ObterPorSistema(int idSistema)
        {
            return GetQuery().Where(queixa => queixa.IdSistema == idSistema).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="queixa"></param>
        /// <param name="_queixaE"></param>
        private static void Atribuir(QueixaModel queixa, tb_queixa _queixaE)
        {
            _queixaE.DescricaoQueixa = queixa.DescricaoQueixa;
            _queixaE.IdSistema = queixa.IdSistema;
        }
    }
}