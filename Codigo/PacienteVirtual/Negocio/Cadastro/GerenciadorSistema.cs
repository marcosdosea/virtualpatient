using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Persistence;
using Negocio;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorSistema
    {
        public static GerenciadorSistema gSistema;

        private GerenciadorSistema()
        {
        }

        public static GerenciadorSistema GetInstance()
        {
            if (gSistema == null)
            {
                gSistema = new GerenciadorSistema();
            }
            return gSistema;
        }

        /// <summary>
        /// inserir dados da Sistema
        /// </summary>
        /// <param name="sistema"></param>
        /// <returns></returns>
        public int Inserir(SistemaModel sistema)
        {
            var repSistema = new RepositorioGenerico<SistemaE>();
            SistemaE _tb_sistema = new SistemaE();
            try
            {
                Atribuir(sistema, _tb_sistema);

                repSistema.Inserir(_tb_sistema);
                repSistema.SaveChanges();

                return _tb_sistema.IdSistema;
            }
            catch (Exception e)
            {
                throw new NegocioException("Sistema", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Sistema
        /// </summary>
        /// <param name="sistema"></param>
        public void Atualizar(SistemaModel sistema)
        {
            try
            {
                var repSistema = new RepositorioGenerico<SistemaE>();
                SistemaE _tb_sistema = repSistema.ObterEntidade(d => d.IdSistema == sistema.IdSistema);
                Atribuir(sistema, _tb_sistema);

                repSistema.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Sistema", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Sistema
        /// </summary>
        /// <param name="idSistema"></param>
        public void Remover(int idSistema)
        {
            try
            {
                var repSistema = new RepositorioGenerico<SistemaE>();
                repSistema.Remover(d => d.IdSistema == idSistema);
                repSistema.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Sistema", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<SistemaModel> GetQuery()
        {
            var repSistema = new RepositorioGenerico<SistemaE>();
            var pvEntities = (pvEntities)repSistema.ObterContexto();
            var query = from sistema in pvEntities.tb_sistema
                        select new SistemaModel
                        {
                            IdSistema = sistema.IdSistema,
                            NomeSistema = sistema.NomeSistema
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os sistema cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SistemaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém sistema com o código especificiado
        /// </summary>
        /// <param name="idSistema"></param>
        /// <returns></returns>
        public SistemaModel Obter(int idSistema)
        {
            return GetQuery().Where(sistema => sistema.IdSistema == idSistema).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do nomeSistema
        /// </summary>
        /// <param name="nomeSistema"></param>
        /// <returns></returns>
        public IEnumerable<SistemaModel> ObterPorNome(string nomeSistema)
        {
            return GetQuery().Where(sistema => sistema.NomeSistema.StartsWith(nomeSistema)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="sistema"></param>
        /// <param name="_tb_sistema"></param>
        private static void Atribuir(SistemaModel sistema, SistemaE _tb_sistema)
        {
            _tb_sistema.NomeSistema = sistema.NomeSistema;
        }
    }
}