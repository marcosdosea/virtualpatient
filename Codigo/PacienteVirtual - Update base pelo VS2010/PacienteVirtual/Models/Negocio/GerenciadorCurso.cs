using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dados;
using System.Data.Common;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorCurso
    {

        private static GerenciadorCurso gCurso;

        private GerenciadorCurso() { }

        public static GerenciadorCurso GetInstance()
        {
            if (gCurso == null)
            {
                gCurso = new GerenciadorCurso();
            }
            return gCurso;
        }

        /// <summary>
        /// Insere dados do curso
        /// </summary>
        /// <param name="curso"></param>
        /// <returns></returns>
        public int Inserir(CursoModel curso)
        {
            var repCurso = new RepositorioGenerico<CursoE>();
            CursoE _cursoE = new CursoE();
            try
            {
                Atribuir(curso, _cursoE);

                repCurso.Inserir(_cursoE);
                repCurso.SaveChanges();

                return _cursoE.IdCurso;
            }
            catch (Exception e)
            {
                throw new DadosException("Curso", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do curso
        /// </summary>
        /// <param name="curso"></param>
        public void Atualizar(CursoModel curso)
        {
            try
            {
                var repCurso = new RepositorioGenerico<CursoE>();
                CursoE _cursoE = repCurso.ObterEntidade(c => c.IdCurso == curso.IdCurso);
                Atribuir(curso, _cursoE);

                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Curso", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do curso
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int idCurso)
        {
            try
            {
                var repCurso = new RepositorioGenerico<CursoE>();
                repCurso.Remover(c => c.IdCurso == idCurso);
                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Curso", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<CursoModel> GetQuery()
        {
            var repCurso = new RepositorioGenerico<CursoE>();
            var pvEntities = (pvEntities)repCurso.ObterContexto();
            var query = from tb_curso in pvEntities.tb_curso
                        join tb_instituicao in pvEntities.tb_instituicao
                        on tb_curso.IdInstituicao equals tb_instituicao.IdInstituicao
                        select new CursoModel
                        {
                            IdCurso = tb_curso.IdCurso,
                            IdInstituicao = tb_curso.IdInstituicao,
                            NomeCurso = tb_curso.NomeCurso,
                            NomeInstituicao = tb_instituicao.NomeInstituicao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os curso cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<CursoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém curso com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public CursoModel Obter(int idCurso)
        {
            return GetQuery().Where(curso => curso.IdCurso == idCurso).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<CursoModel> ObterPorNome(string nomeCurso)
        {
            return GetQuery().Where(curso => curso.NomeCurso.StartsWith(nomeCurso)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="curso"></param>
        /// <param name="_cursoE"></param>
        private static void Atribuir(CursoModel curso, CursoE _cursoE)
        {
            _cursoE.NomeCurso = curso.NomeCurso;
            _cursoE.IdInstituicao = curso.IdInstituicao;
        }
    }
}