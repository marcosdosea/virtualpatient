using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorTurma
    {

        private static GerenciadorTurma gTurma;

        private GerenciadorTurma() { }

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
        public int Inserir(TurmaModel turma)
        {
            var repCurso = new RepositorioGenerico<TurmaE>();
            TurmaE _turmaE = new TurmaE();
            try
            {
                Atribuir(turma, _turmaE);

                repCurso.Inserir(_turmaE);
                repCurso.SaveChanges();

                return _turmaE.IdTurma;
            }
            catch (Exception e)
            {
                throw new DadosException("turma", e.Message, e);
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
                var repCurso = new RepositorioGenerico<TurmaE>();
                TurmaE _turmaE = repCurso.ObterEntidade(t => t.IdTurma == turma.IdTurma);
                Atribuir(turma, _turmaE);

                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("turma", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do turma
        /// </summary>
        /// <param name="codTurma"></param>
        public void Remover(int idTurma)
        {
            try
            {
                var repCurso = new RepositorioGenerico<TurmaE>();
                repCurso.Remover(t => t.IdTurma == idTurma);
                repCurso.SaveChanges();
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
            var pvEntities = (pvEntities) repTurma.ObterContexto();
            var query = from tb_turma in pvEntities.tb_turma
                        join tb_instituicao in pvEntities.tb_instituicao
                        on tb_turma.IdInstituicao equals tb_instituicao.IdInstituicao
                        join tb_disciplina in pvEntities.tb_disciplina
                        on tb_turma.IdDisciplina equals tb_disciplina.IdDisciplina
                        select new TurmaModel
                        {
                            IdTurma = tb_turma.IdTurma,
                            Codigo = tb_turma.Codigo,
                            Periodo = tb_turma.Periodo,
                            IdDisciplina = tb_turma.IdDisciplina,
                            IdInstituicao = tb_turma.IdInstituicao,

                            NomeInstituicao = tb_instituicao.NomeInstituicao,
                            NomeDisciplina = tb_disciplina.NomeDisciplina
      
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os curso cadastrados
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
            return GetQuery().Where(turma => turma.IdTurma == idTurma).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém turmas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<TurmaModel> ObterPorNome(string Codigo)
        {
            return GetQuery().Where(turma => turma.Codigo.StartsWith(Codigo)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="curso"></param>
        /// <param name="_cursoE"></param>
        private static void Atribuir(TurmaModel turma, TurmaE _turmaE)
        {
            _turmaE.Codigo = turma.Codigo;
            _turmaE.Periodo = turma.Periodo;
            _turmaE.IdDisciplina = turma.IdDisciplina;
        }
    }
}