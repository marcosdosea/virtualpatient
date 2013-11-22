﻿using System;
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
                tb_turma_pessoa _turmaPessoa = repTurmaPessoa.ObterEntidade(c => c.IdTurma == turmaPessoa.IdTurma && c.IdPessoa == turmaPessoa.IdPessoa);
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

                            NomeTurma = tb_turma_pessoa.tb_turma.Codigo,
                            NomeRole = tb_turma_pessoa.my_aspnet_roles.name,

                            NomePessoa =  tb_pessoa.Nome,

                            // dados tela selecionarTurma
                            Instituicao = tb_turma_pessoa.tb_turma.tb_instituicao.NomeInstituicao,
                            Curso = tb_turma_pessoa.tb_turma.tb_curso.NomeCurso,
                            Disciplina = tb_turma_pessoa.tb_turma.tb_disciplina.NomeDisciplina,
                            Periodo = tb_turma_pessoa.tb_turma.Periodo
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
        /// Obtém todos as pessoas de uma determinada turma qe ainda não estão ativados 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaModel> ObterPorTurmaNaoAtivado(int codTurma)
        {
            return GetQuery().Where(tpr => tpr.IdTurma == codTurma && tpr.Ativa == false).ToList();
        }

        public IEnumerable<TurmaPessoaModel> ObterTurmasPorPessoa(int idPessoa)
        {
            return GetQuery().Where(tpr => tpr.IdPessoa == idPessoa).ToList();
        }

        /// <summary>
        /// Obtem todos os alunos de determinada turma matriculada na mesma
        /// </summary>
        /// <param name="codTurma"></param>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaModel> ObterPorTurmaAtivados(int codTurma)
        {
            return GetQuery().Where(tpr => tpr.IdTurma == codTurma && tpr.Ativa == true).ToList();
        }

        /// <summary>
        /// Obtem todos os alunos Ativados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaPessoaModel> ObterTodosAtivados()
        {
            return GetQuery().Where(tpr => tpr.Ativa == true).ToList();
        }

        /// <summary>
        /// Obtém turmaPessoa com o idTurma e idPessoa
        /// </summary>
        /// <param name="codTurma"></param>
        /// <returns></returns>
        public TurmaPessoaModel ObterPorTurmaPessoa(int idTurma, int idPessoa)
        {
            return GetQuery().Where(turma => turma.IdTurma == idTurma && turma.IdPessoa == idPessoa).ToList().ElementAtOrDefault(0);
        }


        /// <summary>
        /// Obtém uma TurmaPessoa com o idPessoa
        /// </summary>
        /// <param name="codTurma"></param>
        /// <returns></returns>
        public TurmaPessoaModel ObterPorPessoaUmaTurmaPessoa(int idPessoa)
        {
            return GetQuery().Where(turma => turma.IdPessoa == idPessoa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem quantidade de turmaPessoa a partir de uma pessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns></returns>
        public int ObterQuantidadePorPessoa(int idPessoa)
        {
            return GetQuery().Where(turma => turma.IdPessoa == idPessoa).ToList().Count;
        }

        /// <summary>
        /// obtem o id do perfil da pessoa pelo id pessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns></returns>
        public int ObterRolePorPessoa(int idPessoa)
        {
            return GetQuery().Where(turma => turma.IdPessoa == idPessoa).ToList().ElementAtOrDefault(0).IdRole;
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