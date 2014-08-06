using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using PacienteVirtual.Models.Cadastro;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorEspecialidade
    {
        public static GerenciadorEspecialidade gEspecialidade;

        private GerenciadorEspecialidade()
        {
        }

        public static GerenciadorEspecialidade GetInstance()
        {
            if (gEspecialidade == null)
            {
                gEspecialidade = new GerenciadorEspecialidade();
            }
            return gEspecialidade;
        }

        /// <summary>
        /// inserir dados da Especialidade
        /// </summary>
        /// <param name="alergia"></param>
        /// <returns></returns>
        public int Inserir(EspecialidadeModel especialidade)
        {
            var repEspecialidade = new RepositorioGenerico<tb_especialidade>();
            tb_especialidade _tb_especialidade = new tb_especialidade();
            try
            {
                Atribuir(especialidade, _tb_especialidade);

                repEspecialidade.Inserir(_tb_especialidade);
                repEspecialidade.SaveChanges();

                return _tb_especialidade.IdEspecialidade;
            }
            catch (Exception e)
            {
                throw new NegocioException("Especialidade", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Especialidade
        /// </summary>
        /// <param name="alergia"></param>
        public void Atualizar(EspecialidadeModel especialidade)
        {
            try
            {
                var repEspecialidade = new RepositorioGenerico<tb_especialidade>();
                tb_especialidade _tb_especialidade = repEspecialidade.ObterEntidade(d => d.IdEspecialidade == especialidade.IdEspecialidade);
                Atribuir(especialidade, _tb_especialidade);

                repEspecialidade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Especialidade", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Especialidade
        /// </summary>
        /// <param name="idEspecialidade"></param>
        public void Remover(int idEspecialidade)
        {
            try
            {
                var repEspecialidade = new RepositorioGenerico<tb_especialidade>();
                repEspecialidade.Remover(d => d.IdEspecialidade == idEspecialidade);
                repEspecialidade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Especialidade", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<EspecialidadeModel> GetQuery()
        {
            var repEspecialidade = new RepositorioGenerico<tb_especialidade>();
            var pvEntities = (pvEntities)repEspecialidade.ObterContexto();
            var query = from especialidade in pvEntities.tb_especialidade
                        select new EspecialidadeModel
                        {
                            IdEspecialidade = especialidade.IdEspecialidade,
                            Especialidade = especialidade.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as Especialidades cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EspecialidadeModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Especialidade com o código especificiado
        /// </summary>
        /// <param name="idEspecialidade"></param>
        /// <returns></returns>
        public EspecialidadeModel Obter(int idEspecialidade)
        {
            return GetQuery().Where(especialidade => especialidade.IdEspecialidade == idEspecialidade).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do especialidade
        /// </summary>
        /// <param name="alergia"></param>
        /// <returns></returns>
        public IEnumerable<EspecialidadeModel> ObterPorNome(string especialidade1)
        {
            return GetQuery().Where(especialidade => especialidade.Especialidade.StartsWith(especialidade1)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="alergia"></param>
        /// <param name="_tb_especialidade"></param>
        private static void Atribuir(EspecialidadeModel especialidade, tb_especialidade _tb_especialidade)
        {
            _tb_especialidade.Descricao = especialidade.Especialidade;
        }
    }
}