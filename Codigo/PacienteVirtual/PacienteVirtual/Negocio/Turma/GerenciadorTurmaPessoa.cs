using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Turma;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio.Turma
{
    public class GerenciadorTurmaPessoa
    {
        private static GerenciadorTurmaPessoa gTurmaPessoa;

        private GerenciadorTurmaPessoa() { }

        public static GerenciadorTurmaPessoa GetInstance()
        {
            if (gTurmaPessoa == null)
            {
                gTurmaPessoa = new GerenciadorTurmaPessoa();
            }
            return gTurmaPessoa;
        }

        /// <summary>
        /// Insere dados do turmaPessoa
        /// </summary>
        /// <param name="turmaPessoa"></param>
        /// <returns></returns>
        public bool Inserir(TurmaPessoaModel turmaPessoa)
        {
            var repTurmaPessoa = new RepositorioGenerico<tb_turma_pessoa>();
            tb_turma_pessoa _turmaPessoa = new tb_turma_pessoa();
            try
            {
                Atribuir(turmaPessoa, _turmaPessoa);

                repTurmaPessoa.Inserir(_turmaPessoa);
                repTurmaPessoa.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                throw new DadosException("TurmaPessoa", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do turmaPessoa
        /// </summary>
        /// <param name="turmaPessoa"></param>
        public void Atualizar(TurmaPessoaModel turmaPessoa)
        {
            try
            {
                var repTurmaPessoa = new RepositorioGenerico<tb_turma_pessoa>();
                tb_turma_pessoa _turmaPessoa = repTurmaPessoa.ObterEntidade(c => c.IdTurma == turmaPessoa.IdTurma);
                Atribuir(turmaPessoa, _turmaPessoa);

                repTurmaPessoa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("TurmaPessoa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do turmaPessoa
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int IdTurma)
        {
            try
            {
                var repTurmaPessoa = new RepositorioGenerico<tb_turma_pessoa>();
                repTurmaPessoa.Remover(c => c.IdTurma == IdTurma);
                repTurmaPessoa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("TurmaPessoa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<TurmaPessoaModel> GetQuery()
        {
            var repTurmaPessoa = new RepositorioGenerico<tb_turma_pessoa>();
            var pvEntities = (pvEntities)repTurmaPessoa.ObterContexto();
            var query = from tb_turma_pessoa in pvEntities.tb_turma_pessoa
                        join tb_pessoa in pvEntities.tb_pessoa
                        on tb_turma_pessoa.IdPessoa equals tb_pessoa.IdPessoa
                        select new TurmaPessoaModel
                        {
                            IdTurma = tb_turma_pessoa.IdTurma,
                            IdPessoa = tb_turma_pessoa.IdPessoa,
                            IdRole = tb_turma_pessoa.IdRole,
                            Ativa = tb_turma_pessoa.Ativa,

                            NomePessoa =  tb_pessoa.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os turmaPessoa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém todos as pessoas de uma determinada turma 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaModel> ObterPorTurma(int codTurma)
        {
            return GetQuery().Where(tpr => tpr.IdTurma == codTurma && tpr.Ativa == false).ToList();
        }

        /// <summary>
        /// Obtém todos as turmas de uma determinada pessoa
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaModel> ObterPorPessoa(long codPessoa)
        {
            return GetQuery().Where(tpr => tpr.IdPessoa == codPessoa && tpr.Ativa == true).ToList();
        }

        /// <summary>
        /// Obtém turmaPessoa com o código especificiado
        /// </summary>
        /// <param name="codTurma"></param>
        /// <returns></returns>
        public TurmaPessoaModel Obter(int idTurmaPessoa)
        {
            return GetQuery().Where(turma => turma.IdTurma == idTurmaPessoa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="turmaPessoa"></param>
        /// <param name="_turmaPessoa"></param>
        private static void Atribuir(TurmaPessoaModel turmaPessoa, tb_turma_pessoa _turmaPessoa)
        {
            _turmaPessoa.IdTurma = turmaPessoa.IdTurma;
            _turmaPessoa.IdPessoa = turmaPessoa.IdPessoa;
            _turmaPessoa.IdRole = turmaPessoa.IdRole;
            _turmaPessoa.Ativa = turmaPessoa.Ativa;
        }
    }
}