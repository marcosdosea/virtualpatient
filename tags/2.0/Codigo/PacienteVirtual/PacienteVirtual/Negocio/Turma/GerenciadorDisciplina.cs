using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDisciplina
    {

        private static GerenciadorDisciplina gDisciplina;

        private GerenciadorDisciplina()
        {
        }

        public static GerenciadorDisciplina GetInstance()
        {
            if (gDisciplina == null)
            {
                gDisciplina = new GerenciadorDisciplina();
            }
            return gDisciplina;
        }

        /// <summary>
        /// Insere dados do disciplina
        /// </summary>
        /// <param name="disciplina"></param>
        /// <returns></returns>
        public int Inserir(DisciplinaModel disciplina)
        {
            var repDisciplina = new RepositorioGenerico<tb_disciplina>();
            tb_disciplina _disciplinaE = new tb_disciplina();
            try
            {
                Atribuir(disciplina, _disciplinaE);

                repDisciplina.Inserir(_disciplinaE);
                repDisciplina.SaveChanges();

                return _disciplinaE.IdDisciplina;
            }
            catch (Exception e)
            {
                throw new DadosException("Disciplina", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do disciplina
        /// </summary>
        /// <param name="disciplina"></param>
        public void Atualizar(DisciplinaModel disciplina)
        {
            try
            {
                var repDisciplina = new RepositorioGenerico<tb_disciplina>();
                tb_disciplina _disciplinaE = repDisciplina.ObterEntidade(d => d.IdDisciplina == disciplina.IdDisciplina);
                Atribuir(disciplina, _disciplinaE);

                repDisciplina.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Disciplina", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do disciplina
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int idDisciplina)
        {
            try
            {
                var repDisciplina = new RepositorioGenerico<tb_disciplina>();
                repDisciplina.Remover(d => d.IdDisciplina == idDisciplina);
                repDisciplina.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Disciplina", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DisciplinaModel> GetQuery()
        {
            var repDisciplina = new RepositorioGenerico<tb_disciplina>();
            var pvEntities = (pvEntities)repDisciplina.ObterContexto();
            var query = from disciplina in pvEntities.tb_disciplina
                        select new DisciplinaModel
                        {
                            IdDisciplina = disciplina.IdDisciplina,
                            NomeDisciplina = disciplina.NomeDisciplina
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os disciplina cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DisciplinaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém disciplina com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public DisciplinaModel Obter(int idDisciplina)
        {
            return GetQuery().Where(disciplina => disciplina.IdDisciplina == idDisciplina).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<DisciplinaModel> ObterPorNome(string nomeDisciplina)
        {
            return GetQuery().Where(disciplina => disciplina.NomeDisciplina.StartsWith(nomeDisciplina)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="disciplina"></param>
        /// <param name="_disciplinaE"></param>
        private static void Atribuir(DisciplinaModel disciplina, tb_disciplina _disciplinaE)
        {
            _disciplinaE.NomeDisciplina = disciplina.NomeDisciplina;
        }
    }
}