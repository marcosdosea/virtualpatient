using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorParametroClinico
    {
        public static GerenciadorParametroClinico gParamentoClinico;

        private GerenciadorParametroClinico()
        {
        }

        public static GerenciadorParametroClinico GetInstance()
        {
            if (gParamentoClinico == null)
            {
                gParamentoClinico = new GerenciadorParametroClinico();
            }
            return gParamentoClinico;
        }

        /// <summary>
        /// inserir dados da parametroClinico
        /// </summary>
        /// <param name="parametroClinico"></param>
        /// <returns></returns>
        public int Inserir(ParametroClinicoModel parametroClinico)
        {
            var repParametroClinico = new RepositorioGenerico<tb_parametro_clinico>();
            tb_parametro_clinico _tb_parametro_clinico = new tb_parametro_clinico();
            try
            {
                Atribuir(parametroClinico, _tb_parametro_clinico);

                repParametroClinico.Inserir(_tb_parametro_clinico);
                repParametroClinico.SaveChanges();

                return _tb_parametro_clinico.IdParametroClinico;
            }
            catch (Exception e)
            {
                throw new NegocioException("ParametroClinico", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da ParamentoClinico
        /// </summary>
        /// <param name="parametroClinico"></param>
        public void Atualizar(ParametroClinicoModel parametroClinico)
        {
            try
            {
                var repParametroClinico = new RepositorioGenerico<tb_parametro_clinico>();
                tb_parametro_clinico _tb_parametro_clinico = repParametroClinico.ObterEntidade(d => d.IdParametroClinico == parametroClinico.IdParametroClinico);
                Atribuir(parametroClinico, _tb_parametro_clinico);

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
        /// <param name="idParametroClinico"></param>
        public void Remover(int idParametroClinico)
        {
            try
            {
                var repParametroClinico = new RepositorioGenerico<tb_parametro_clinico>();
                repParametroClinico.Remover(d => d.IdParametroClinico == idParametroClinico);
                repParametroClinico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ParamentoClinico", e.Message, e);
            }
        }

        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(int parametro1)
        {
            if (parametro1 == 0)
            {
                throw new NegocioException("Atenção! Você esqueceu de selecionar uma ou mais campos.");
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ParametroClinicoModel> GetQuery()
        {
            var repParametroClinico = new RepositorioGenerico<tb_parametro_clinico>();
            var pvEntities = (pvEntities)repParametroClinico.ObterContexto();
            var query = from parametroClinico in pvEntities.tb_parametro_clinico
                        select new ParametroClinicoModel
                        {
                            IdParametroClinico = parametroClinico.IdParametroClinico,
                            ParametroClinico = parametroClinico.ParametroClinico
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os ParametrosClinicos cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ParametroClinicoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ParamentoClinico com o código especificiado
        /// </summary>
        /// <param name="idParametroClinico"></param>
        /// <returns></returns>
        public ParametroClinicoModel Obter(int idParametroClinico)
        {
            return GetQuery().Where(parametroClinico => parametroClinico.IdParametroClinico == idParametroClinico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do pClinico
        /// </summary>
        /// <param name="pClinico"></param>
        /// <returns></returns>
        public IEnumerable<ParametroClinicoModel> ObterPorNome(string pClinico)
        {
            return GetQuery().Where(parametroClinico => parametroClinico.ParametroClinico.StartsWith(pClinico)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="parametroClinico"></param>
        /// <param name="_tb_parametro_clinico"></param>
        private static void Atribuir(ParametroClinicoModel parametroClinico, tb_parametro_clinico _tb_parametro_clinico)
        {
            _tb_parametro_clinico.ParametroClinico = parametroClinico.ParametroClinico;
        }
    }
}