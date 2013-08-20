using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Persistence;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorTurmaPessoaRelato
    {
        private static GerenciadorTurmaPessoaRelato gTurmaPessoaRelato;

        private GerenciadorTurmaPessoaRelato() { }

        public static GerenciadorTurmaPessoaRelato GetInstance()
        {
            if (gTurmaPessoaRelato == null)
            {
                gTurmaPessoaRelato = new GerenciadorTurmaPessoaRelato();
            }
            return gTurmaPessoaRelato;
        }

        /// <summary>
        /// Insere dados do turmaPessoaRelato
        /// </summary>
        /// <param name="turmaPessoaRelato"></param>
        /// <returns></returns>
        public bool Inserir(TurmaPessoaRelatoModel turmaPessoaRelato)
        {
            var repTurmaPessoaRelato = new RepositorioGenerico<TurmaPessoaRelatoE>();
            TurmaPessoaRelatoE _turmaPessoaRelatoE = new TurmaPessoaRelatoE();
            try
            {
                Atribuir(turmaPessoaRelato, _turmaPessoaRelatoE);

                repTurmaPessoaRelato.Inserir(_turmaPessoaRelatoE);
                repTurmaPessoaRelato.SaveChanges();

                return true;
            }
            catch (Exception e)
            {
                throw new DadosException("TurmaPessoaRelato", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do turmaPessoaRelato
        /// </summary>
        /// <param name="turmaPessoaRelato"></param>
        public void Atualizar(TurmaPessoaRelatoModel turmaPessoaRelato)
        {
            try
            {
                var repTurmaPessoaRelato = new RepositorioGenerico<TurmaPessoaRelatoE>();
                TurmaPessoaRelatoE _turmaPessoaRelatoE = repTurmaPessoaRelato.ObterEntidade(c => c.IdTurma == turmaPessoaRelato.IdTurma);
                Atribuir(turmaPessoaRelato, _turmaPessoaRelatoE);

                repTurmaPessoaRelato.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("TurmaPessoaRelato", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do turmaPessoaRelato
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int IdTurma)
        {
            try
            {
                var repTurmaPessoaRelato = new RepositorioGenerico<TurmaPessoaRelatoE>();
                repTurmaPessoaRelato.Remover(c => c.IdTurma == IdTurma);
                repTurmaPessoaRelato.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("TurmaPessoaRelato", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<TurmaPessoaRelatoModel> GetQuery()
        {
            var repTurmaPessoaRelato = new RepositorioGenerico<TurmaPessoaRelatoE>();
            var pvEntities = (pvEntities)repTurmaPessoaRelato.ObterContexto();
            var query = from tb_turma_pessoa_relato in pvEntities.tb_turma_pessoa_relato
                        select new TurmaPessoaRelatoModel
                        {
                            IdTurma = tb_turma_pessoa_relato.IdTurma,
                            IdPessoa = tb_turma_pessoa_relato.IdPessoa,
                            IdRelato = tb_turma_pessoa_relato.IdRelato,
                            IdConsultaFixo = tb_turma_pessoa_relato.IdConsultaFixo,
                            EstadoPreenchimento = tb_turma_pessoa_relato.EstadoPreencimento
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os turmaPessoaRelato cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaRelatoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="turmaPessoaRelato"></param>
        /// <param name="_turmaPessoaRelatoE"></param>
        private static void Atribuir(TurmaPessoaRelatoModel turmaPessoaRelato, TurmaPessoaRelatoE _turmaPessoaRelatoE)
        {
            _turmaPessoaRelatoE.IdTurma = turmaPessoaRelato.IdTurma;
            _turmaPessoaRelatoE.IdPessoa = turmaPessoaRelato.IdPessoa;
            _turmaPessoaRelatoE.IdRelato = turmaPessoaRelato.IdRelato;
            _turmaPessoaRelatoE.IdConsultaFixo = turmaPessoaRelato.IdConsultaFixo;
            _turmaPessoaRelatoE.EstadoPreencimento = turmaPessoaRelato.EstadoPreenchimento;
        }
    }
}