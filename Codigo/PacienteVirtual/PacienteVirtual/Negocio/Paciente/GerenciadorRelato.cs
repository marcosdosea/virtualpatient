﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dados;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorRelato
    {
        private static GerenciadorRelato gRelato;

        private GerenciadorRelato() { }

        public static GerenciadorRelato GetInstance()
        {
            if (gRelato == null)
            {
                gRelato = new GerenciadorRelato();
            }
            return gRelato;
        }

        /// <summary>
        /// Insere dados do relato
        /// </summary>
        /// <param name="relato"></param>
        /// <returns></returns>
        public int Inserir(RelatoClinicoModel relato)
        {
            var repRelato = new RepositorioGenerico<RelatoClinicoE>();
            RelatoClinicoE _relatoE = new RelatoClinicoE();
            try
            {
                Atribuir(relato, _relatoE);

                repRelato.Inserir(_relatoE);
                repRelato.SaveChanges();

                return _relatoE.IdRelato;
            }
            catch (Exception e)
            {
                throw new DadosException("Relato", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do relato
        /// </summary>
        /// <param name="relato"></param>
        public void Atualizar(RelatoClinicoModel relato)
        {
            try
            {
                var repRelato = new RepositorioGenerico<RelatoClinicoE>();
                RelatoClinicoE _relatoE = repRelato.ObterEntidade(c => c.IdRelato == relato.IdRelato);
                Atribuir(relato, _relatoE);

                repRelato.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Relato", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do relato
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int idCurso)
        {
            //if (idCurso == 1)
            //    throw new NegocioException("A relato não pode ser removido.");
            try
            {
                var repRelato = new RepositorioGenerico<RelatoClinicoE>();
                repRelato.Remover(c => c.IdRelato == idCurso);
                repRelato.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Relato", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<RelatoClinicoModel> GetQuery()
        {
            var repRelato = new RepositorioGenerico<RelatoClinicoE>();
            var pvEntities = (pvEntities)repRelato.ObterContexto();
            var query = from tb_relato_clinico in pvEntities.tb_relato_clinico
                        join tb_paciente in pvEntities.tb_paciente
                        on tb_relato_clinico.IdPaciente equals tb_paciente.IdPaciente
                        select new RelatoClinicoModel
                        {
                            IdRelato = tb_relato_clinico.IdRelato,
                            IdPaciente = tb_relato_clinico.IdPaciente,
                            NomePaciente = tb_paciente.Nome,
                            NivelDificuldade = tb_relato_clinico.NivelDificuldade,
                            OrdemCronologica = tb_relato_clinico.OrdemCronologia,
                            RelatoTextual = tb_relato_clinico.RelatoTextual,
                            RelatoVideo = tb_relato_clinico.RelatoVideo
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os relato cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<RelatoClinicoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém relato com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public RelatoClinicoModel Obter(int idCurso)
        {
            return GetQuery().Where(relato => relato.IdRelato == idCurso).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém relatos que iniciam com o relato em texto
        /// </summary>
        /// <param name="relatoTexto"></param>
        /// <returns></returns>
        public IEnumerable<RelatoClinicoModel> ObterPorNome(string relatoTexto)
        {
            return GetQuery().Where(relato => relato.RelatoTextual.StartsWith(relatoTexto)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="relato"></param>
        /// <param name="_relatoE"></param>
        private static void Atribuir(RelatoClinicoModel relato, RelatoClinicoE _relatoE)
        {
            _relatoE.NivelDificuldade = relato.NivelDificuldade;
            _relatoE.IdPaciente = relato.IdPaciente;
            _relatoE.OrdemCronologia = relato.OrdemCronologica;
            _relatoE.RelatoVideo = relato.RelatoVideo;
            _relatoE.RelatoTextual = relato.RelatoTextual;
        }
    }
}