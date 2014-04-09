using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPatologia
    {
        public static GerenciadorPatologia gPatologia;

        private GerenciadorPatologia()
        {
        }

        public static GerenciadorPatologia GetInstance()
        {
            if (gPatologia == null)
            {
                gPatologia = new GerenciadorPatologia();
            }
            return gPatologia;
        }

        /// <summary>
        /// inserir dados da patologia
        /// </summary>
        /// <param name="patologia"></param>
        /// <returns></returns>
        public long Inserir(PatologiaModel patologia)
        {
            var repPatologia = new RepositorioGenerico<tb_patologia>();
            tb_patologia _tb_patologia = new tb_patologia();
            try
            {
                Atribuir(patologia, _tb_patologia);

                repPatologia.Inserir(_tb_patologia);
                repPatologia.SaveChanges();

                return _tb_patologia.IdPatologia;
            }
            catch (Exception e)
            {
                throw new NegocioException("Patologia", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da patologia
        /// </summary>
        /// <param name="patologia"></param>
        public void Atualizar(PatologiaModel patologia)
        {
            try
            {
                var repPatologia = new RepositorioGenerico<tb_patologia>();
                tb_patologia _tb_patologia = repPatologia.ObterEntidade(d => d.IdPatologia == patologia.IdPatologia);
                Atribuir(patologia, _tb_patologia);

                repPatologia.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Patologia", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da patologia
        /// </summary>
        /// <param name="idpatologia"></param>
        public void Remover(long idpatologia)
        {
            try
            {
                var repPatologia = new RepositorioGenerico<tb_patologia>();
                repPatologia.Remover(d => d.IdPatologia == idpatologia);
                repPatologia.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Patologia", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PatologiaModel> GetQuery()
        {
            var repPatologia = new RepositorioGenerico<tb_patologia>();
            var pvEntities = (pvEntities)repPatologia.ObterContexto();
            var query = from patologia in pvEntities.tb_patologia
                        select new PatologiaModel
                        {
                            IdPatologia = patologia.IdPatologia,
                            Descricao = patologia.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os patologias cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PatologiaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém patologia com o código especificiado
        /// </summary>
        /// <param name="idpatologia"></param>
        /// <returns></returns>
        public PatologiaModel Obter(long idpatologia)
        {
            return GetQuery().Where(patologia => patologia.IdPatologia == idpatologia).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir da descricao da patologia
        /// </summary>
        /// <param name="patologia"></param>
        /// <returns></returns>
        public IEnumerable<PatologiaModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(patologia => patologia.Descricao.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="patologia"></param>
        /// <param name="_tb_patologia"></param>
        private static void Atribuir(PatologiaModel patologia, tb_patologia _tb_patologia)
        {
            _tb_patologia.Descricao = patologia.Descricao;
        }
    }
}