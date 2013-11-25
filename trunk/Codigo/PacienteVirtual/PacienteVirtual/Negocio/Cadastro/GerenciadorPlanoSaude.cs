using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPlanoSaude
    {
        private static GerenciadorPlanoSaude gPlanoSaude;

        private GerenciadorPlanoSaude()
        {
        }

        public static GerenciadorPlanoSaude GetInstance()
        {
            if (gPlanoSaude == null)
            {
                gPlanoSaude = new GerenciadorPlanoSaude();
            }
            return gPlanoSaude;
        }

        /// <summary>
        /// Insere dados do planoSaude
        /// </summary>
        /// <param name="planoSaude"></param>
        /// <returns></returns>
        public int Inserir(PlanoSaudeModel planoSaude)
        {
            var repPlanoSaude = new RepositorioGenerico<tb_plano_saude>();
            tb_plano_saude _planoSaudeE = new tb_plano_saude();
            try
            {
                Atribuir(planoSaude, _planoSaudeE);

                repPlanoSaude.Inserir(_planoSaudeE);
                repPlanoSaude.SaveChanges();

                return _planoSaudeE.IdPlanoSaude;
            }
            catch (Exception e)
            {
                throw new DadosException("PlanoSaude", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do planoSaude
        /// </summary>
        /// <param name="planoSaude"></param>
        public void Atualizar(PlanoSaudeModel planoSaude)
        {
            try
            {
                var repPlanoSaude = new RepositorioGenerico<tb_plano_saude>();
                tb_plano_saude _planoSaudeE = repPlanoSaude.ObterEntidade(d => d.IdPlanoSaude == planoSaude.IdPlanoSaude);
                Atribuir(planoSaude, _planoSaudeE);

                repPlanoSaude.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PlanoSaude", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do planoSaude
        /// </summary>
        /// <param name="idPlanoSaude"></param>
        public void Remover(int idPlanoSaude)
        {
            try
            {
                var repPlanoSaude = new RepositorioGenerico<tb_plano_saude>();
                repPlanoSaude.Remover(d => d.IdPlanoSaude == idPlanoSaude);
                repPlanoSaude.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PlanoSaude", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PlanoSaudeModel> GetQuery()
        {
            var repPlanoSaude = new RepositorioGenerico<tb_plano_saude>();
            var pvEntities = (pvEntities)repPlanoSaude.ObterContexto();
            var query = from planoSaude in pvEntities.tb_plano_saude
                        select new PlanoSaudeModel
                        {
                            IdPlanoSaude = planoSaude.IdPlanoSaude,
                            Nome = planoSaude.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os planoSaude cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PlanoSaudeModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém planoSaude com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public PlanoSaudeModel Obter(int idPlanoSaude)
        {
            return GetQuery().Where(planoSaude => planoSaude.IdPlanoSaude == idPlanoSaude).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém planos de saúde que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<PlanoSaudeModel> ObterPorNome(string nome)
        {
            return GetQuery().Where(planoSaude => planoSaude.Nome.StartsWith(nome)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="planoSaude"></param>
        /// <param name="_planoSaudeE"></param>
        private static void Atribuir(PlanoSaudeModel planoSaude, tb_plano_saude _planoSaudeE)
        {
            _planoSaudeE.Nome = planoSaude.Nome;
        }
    }
}