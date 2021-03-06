﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
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
            var repCurso = new RepositorioGenerico<tb_turma>();
            tb_turma _turmaE = new tb_turma();
            try
            {
                Atribuir(turma, _turmaE);

                repCurso.Inserir(_turmaE);
                repCurso.SaveChanges();

                return _turmaE.IdTurma;
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
                var repCurso = new RepositorioGenerico<tb_turma>();
                tb_turma _turmaE = repCurso.ObterEntidade(t => t.IdTurma == turma.IdTurma);
                Atribuir(turma, _turmaE);

                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Turma", e.Message, e);
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
                var repCurso = new RepositorioGenerico<tb_turma>();
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
            var repTurma = new RepositorioGenerico<tb_turma>();
            var pvEntities = (pvEntities)repTurma.ObterContexto();
            var query = from tb_turma in pvEntities.tb_turma
                        join tb_instituicao in pvEntities.tb_instituicao
                        on tb_turma.IdInstituicao equals tb_instituicao.IdInstituicao
                        join tb_disciplina in pvEntities.tb_disciplina
                        on tb_turma.IdDisciplina equals tb_disciplina.IdDisciplina
                        join tb_curso in pvEntities.tb_curso
                        on tb_turma.IdCurso equals tb_curso.IdCurso
                        select new TurmaModel
                        {
                            IdTurma = tb_turma.IdTurma,
                            Codigo = tb_turma.Codigo,
                            Periodo = tb_turma.Periodo,
                            IdDisciplina = tb_turma.IdDisciplina,
                            IdInstituicao = tb_turma.IdInstituicao,
                            IdCurso = tb_turma.IdCurso,
                            Ativa = tb_turma.Ativa,

                            NomeInstituicao = tb_instituicao.NomeInstituicao,
                            NomeDisciplina = tb_disciplina.NomeDisciplina,
                            NomeCurso = tb_curso.NomeCurso

                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os Turmas cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém todas as turmas ativadas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<TurmaModel> ObterTodosAtivos()
        {
            return GetQuery().Where(turma => turma.Ativa == true).ToList();
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
        /// Obtem o Id de uma turma qualquer informando o curso
        /// </summary>
        /// <param name="idCurso"></param>
        /// <returns></returns>
        public int ObterIdTurmaPorCurso(int idCurso)
        {
            TurmaModel turma = GetQuery().Where(t => t.IdCurso == idCurso).ToList().ElementAtOrDefault(0);
            if (turma == null)
            {
                throw new NegocioException("É necessário cadastrar uma turma no curso desejado!");
            }
            else
            {
                return turma.IdTurma;
            }

        }

        /// <summary>
        /// Obtém turmas ativas com exececao das turmas de Administradores
        /// </summary>
        /// <param name="idInstituicao"></param>
        /// <returns></returns>
        public IEnumerable<TurmaModel> ObterTurmasAtivasExcAdm()
        {
            return GetQuery().Where(t => t.Ativa == true && t.IdTurma != Global.TurmaAdminEnfermagem 
                && t.IdTurma != Global.TurmaAdminFarmacia).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="curso"></param>
        /// <param name="_cursoE"></param>
        private static void Atribuir(TurmaModel turma, tb_turma _turmaE)
        {
            _turmaE.Codigo = turma.Codigo;
            _turmaE.Periodo = turma.Periodo;
            _turmaE.IdDisciplina = turma.IdDisciplina;
            _turmaE.IdInstituicao = turma.IdInstituicao;
            _turmaE.IdCurso = turma.IdCurso;
            _turmaE.Ativa = turma.Ativa;
        }
    }
}