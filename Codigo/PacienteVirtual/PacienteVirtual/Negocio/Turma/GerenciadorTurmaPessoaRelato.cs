using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Persistence;
using PacienteVirtual.Models;

namespace PacienteVirtual.Negocio
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
            var repTurmaPessoaRelato = new RepositorioGenerico<tb_turma_pessoa_relato>();
            tb_turma_pessoa_relato _turmaPessoaRelatoE = new tb_turma_pessoa_relato();
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
                var repTurmaPessoaRelato = new RepositorioGenerico<tb_turma_pessoa_relato>();
                tb_turma_pessoa_relato _turmaPessoaRelatoE = repTurmaPessoaRelato.ObterEntidade(c => c.IdTurma == turmaPessoaRelato.IdTurma);
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
                var repTurmaPessoaRelato = new RepositorioGenerico<tb_turma_pessoa_relato>();
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
            var repTurmaPessoaRelato = new RepositorioGenerico<tb_turma_pessoa_relato>();
            var pvEntities = (pvEntities)repTurmaPessoaRelato.ObterContexto();
            var query = from tb_turma_pessoa_relato in pvEntities.tb_turma_pessoa_relato
                        select new TurmaPessoaRelatoModel
                        {
                            IdTurma = tb_turma_pessoa_relato.IdTurma,
                            IdPessoa = tb_turma_pessoa_relato.IdPessoa,
                            IdRelato = tb_turma_pessoa_relato.IdRelato,
                            IdConsultaFixo = tb_turma_pessoa_relato.IdConsultaFixo,
                            OrdemCronologica = tb_turma_pessoa_relato.tb_relato_clinico.OrdemCronologia,
                            NivelDificuldade = tb_turma_pessoa_relato.tb_relato_clinico.NivelDificuldade,
                            NomePaciente = tb_turma_pessoa_relato.tb_relato_clinico.tb_paciente.Nome
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
        /// Obtém todos os pacientes por pessoa
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaRelatoModel> ObterPorPessoa(int codPessoa)
        {
            return GetQuery().Where(tpr => tpr.IdPessoa == codPessoa).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="turmaPessoaRelato"></param>
        /// <param name="_turmaPessoaRelatoE"></param>
        private static void Atribuir(TurmaPessoaRelatoModel turmaPessoaRelato, tb_turma_pessoa_relato _turmaPessoaRelatoE)
        {
            _turmaPessoaRelatoE.IdTurma = turmaPessoaRelato.IdTurma;
            _turmaPessoaRelatoE.IdPessoa = turmaPessoaRelato.IdPessoa;
            _turmaPessoaRelatoE.IdRelato = turmaPessoaRelato.IdRelato;
            _turmaPessoaRelatoE.IdConsultaFixo = turmaPessoaRelato.IdConsultaFixo;
        }
    }
}