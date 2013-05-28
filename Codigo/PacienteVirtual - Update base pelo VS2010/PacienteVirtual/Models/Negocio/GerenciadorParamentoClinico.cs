using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;
using Negocio;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorParamentoClinico
    {
        public static GerenciadorParamentoClinico gParamentoClinico;

        private GerenciadorParamentoClinico()
        {
        }

        public static GerenciadorParamentoClinico GetInstance()
        {
            if (gParamentoClinico == null)
            {
                gParamentoClinico = new GerenciadorParamentoClinico();
            }
            return gParamentoClinico;
        }

        /// <summary>
        /// inserir dados da paramentoClinico
        /// </summary>
        /// <param name="paramentoClinico"></param>
        /// <returns></returns>
        public int Inserir(ParamentoClinicoModel paramentoClinico)
        {
            var repParametroClinico = new RepositorioGenerico<ParamentoClinicoE>();
            ParamentoClinicoE _tb_parametro_clinico = new ParamentoClinicoE();
            try
            {
                Atribuir(paramentoClinico, _tb_parametro_clinico);

                repParametroClinico.Inserir(_tb_parametro_clinico);
                repParametroClinico.SaveChanges();

                return _tb_parametro_clinico.IdParamentoClinico;
            }
            catch (Exception e)
            {
                throw new NegocioException("ParamentoClinico", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da ParamentoClinico
        /// </summary>
        /// <param name="paramentoClinico"></param>
        public void Atualizar(ParamentoClinicoModel paramentoClinico)
        {
            try
            {
                var repParametroClinico = new RepositorioGenerico<ParamentoClinicoE>();
                ParamentoClinicoE _tb_parametro_clinico = repParametroClinico.ObterEntidade(d => d.IdParamentoClinico == paramentoClinico.IdParamentoClinico);
                Atribuir(paramentoClinico, _tb_parametro_clinico);

                repParametroClinico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ParamentoClinico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da ParamentoClinico
        /// </summary>
        /// <param name="idParamentoClinico"></param>
        public void Remover(int idParamentoClinico)
        {
            try
            {
                var repParametroClinico = new RepositorioGenerico<ParamentoClinicoE>();
                repParametroClinico.Remover(d => d.IdParamentoClinico == idParamentoClinico);
                repParametroClinico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ParamentoClinico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ParamentoClinicoModel> GetQuery()
        {
            var repParametroClinico = new RepositorioGenerico<ParamentoClinicoE>();
            var pvEntities = (pvEntities)repParametroClinico.ObterContexto();
            var query = from paramentoClinico in pvEntities.tb_parametro_clinico
                        select new ParamentoClinicoModel
                        {
                            IdParamentoClinico = paramentoClinico.IdParamentoClinico,
                            ParamentoClinico = paramentoClinico.ParametroClinico
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os niveis cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ParamentoClinicoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ParamentoClinico com o código especificiado
        /// </summary>
        /// <param name="idParamentoClinico"></param>
        /// <returns></returns>
        public ParamentoClinicoModel Obter(int idParamentoClinico)
        {
            return GetQuery().Where(paramentoClinico => paramentoClinico.IdParamentoClinico == idParamentoClinico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do pClinico
        /// </summary>
        /// <param name="pClinico"></param>
        /// <returns></returns>
        public IEnumerable<ParamentoClinicoModel> ObterPorNome(string pClinico)
        {
            return GetQuery().Where(paramentoClinico => paramentoClinico.ParamentoClinico.StartsWith(pClinico)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="paramentoClinico"></param>
        /// <param name="_tb_parametro_clinico"></param>
        private static void Atribuir(ParamentoClinicoModel paramentoClinico, ParamentoClinicoE _tb_parametro_clinico)
        {
            _tb_parametro_clinico.ParametroClinico = paramentoClinico.ParamentoClinico;
        }
    }
}