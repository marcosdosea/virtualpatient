using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dados;
using System.Data.Common;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Data;

namespace Negocio
{
    public class GerenciadorTurma
    {

        private static GerenciadorTurma gTurma;

        public static GerenciadorTurma GetInstance()
        {
            if (gTurma == null)
            {
                gTurma = new GerenciadorTurma();
            }
            return gTurma;
        }

        /// <summary>
        /// Insere dados do turma
        /// </summary>
        /// <param name="turma"></param>
        /// <returns></returns>
        public Int64 Inserir(TurmaModel turma)
        {
            var repTurma = new RepositorioGenerico<TurmaE>();
            TurmaE _turmaE = new TurmaE();
            try
            {
                Atribuir(turma, _turmaE);

                repTurma.Inserir(_turmaE);
                repTurma.SaveChanges();

                return _turmaE.id;
            }
            catch (Exception e)
            {
                throw new DadosException("Turma", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do turma
        /// </summary>
        /// <param name="turma"></param>
        public void Atualizar(TurmaModel turma)
        {
            try
            {
                var repTurma = new RepositorioGenerico<TurmaE>();
                TurmaE _turmaE = repTurma.ObterEntidade(t => t.id == turma.Id);
                Atribuir(turma, _turmaE);

                repTurma.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Turma", e.Message, e);
            }
        }

        private static void Atribuir(TurmaModel turma, TurmaE _turmaE)
        {
            _turmaE.codigo = turma.Codigo;
            _turmaE.fktutor = turma.Tutor;
            _turmaE.nmDisciplina = turma.NomeDisciplina;
            _turmaE.periodo = turma.Periodo;
        }

        /// <summary>
        /// Remove dados do turma
        /// </summary>
        /// <param name="codTurma"></param>
        public void Remover(long idTurma)
        {
            if (idTurma == 1)
                throw new NegocioException("A turma não pode ser removido.");
            try
            {
                var repTurma = new RepositorioGenerico<TurmaE>();
                repTurma.Remover(t => t.id == idTurma);
                repTurma.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Turma", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<TurmaModel> GetQuery()
        {
            var repTurma = new RepositorioGenerico<TurmaE>();
            var pvEntities = (pvEntities)repTurma.ObterContexto();
            var query = from turma in pvEntities.TurmaSet
                        select new TurmaModel
                        {
                            Codigo = turma.codigo,
                            Id = turma.id,
                            NomeDisciplina = turma.nmDisciplina,
                            Periodo = turma.periodo,
                            Tutor = turma.tutor.login
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os turma cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém turma com o código especificiado
        /// </summary>
        /// <param name="codTurma"></param>
        /// <returns></returns>
        public TurmaModel Obter(int idTurma)
        {
            return GetQuery().Where(turma => turma.Id == idTurma).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém turmas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<TurmaModel> ObterPorNome(string nomeDisciplina)
        {
            return GetQuery().Where(turma => turma.NomeDisciplina.StartsWith(nomeDisciplina)).ToList();
        }
    }
}