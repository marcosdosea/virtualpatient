﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorRelatoClinico
    {
        private static GerenciadorRelatoClinico gRelato;

        private GerenciadorRelatoClinico() { }

        public static GerenciadorRelatoClinico GetInstance()
        {
            if (gRelato == null)
            {
                gRelato = new GerenciadorRelatoClinico();
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
            var repRelato = new RepositorioGenerico<tb_relato_clinico>();
            tb_relato_clinico _relatoE = new tb_relato_clinico();
            try
            {
                VerificarRegrasNegocio(relato);

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

        private static void VerificarRegrasNegocio(RelatoClinicoModel relato)
        {
            var listaRelatos = GerenciadorRelatoClinico.GetInstance().ObterPorPacienteOrdemCronologica(relato.IdPaciente, relato.OrdemCronologica);
            if (listaRelatos.Count() > 0)
            {
                bool ehMesmoRelato = listaRelatos.ElementAtOrDefault(0).IdRelato == relato.IdRelato;
                if (!ehMesmoRelato)
                {
                    throw new NegocioException("Já existe um relato clínico com essa ordem cronológica. Favor atribuir outro valor a ordem cronológica do relato.");
                }
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
                VerificarRegrasNegocio(relato);
                var repRelato = new RepositorioGenerico<tb_relato_clinico>();
                tb_relato_clinico _relatoE = repRelato.ObterEntidade(c => c.IdRelato == relato.IdRelato);
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
        public void Remover(int idRelato)
        {
            try
            {
                var repRelato = new RepositorioGenerico<tb_relato_clinico>();
                repRelato.Remover(c => c.IdRelato == idRelato);
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
            var repRelato = new RepositorioGenerico<tb_relato_clinico>();
            var pvEntities = (pvEntities)repRelato.ObterContexto();
            var query = from tb_relato_clinico in pvEntities.tb_relato_clinico
                        join tb_paciente in pvEntities.tb_paciente
                        on tb_relato_clinico.IdPaciente equals tb_paciente.IdPaciente
                        select new RelatoClinicoModel
                        {
                            IdRelato = tb_relato_clinico.IdRelato,
                            IdPaciente = tb_relato_clinico.IdPaciente,
                            IdAreaAtuacao = tb_relato_clinico.tb_area_atuacao.IdAreaAtuacao,
                            AreaAtuacao = tb_relato_clinico.tb_area_atuacao.Descricao,
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
        public IEnumerable<RelatoClinicoModel> ObterRelatos(int idPaciente)
        {
            return GetQuery().Where(relato => relato.IdPaciente == idPaciente).ToList();
        }

        /// <summary>
        /// Obtém relato com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public IEnumerable<RelatoClinicoModel> ObterPorPacienteOrdemCronologica(int idPaciente, int ordemCronologica)
        {
            return GetQuery().Where(relato => relato.IdPaciente == idPaciente && relato.OrdemCronologica == ordemCronologica).ToList();
        }

        /// <summary>
        /// Obtém todos os relatos menos o relato relato com o id passado 
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public IEnumerable<RelatoClinicoModel> ObterRelatosExcecaoDoPassado(int idPaciente, int idRelato)
        {
            return GetQuery().Where(relato => relato.IdPaciente == idPaciente && relato.IdRelato != idRelato).ToList();
        }

        /// <summary>
        /// Obtém relato com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public RelatoClinicoModel Obter(int idRelato)
        {
            return GetQuery().Where(relato => relato.IdRelato == idRelato).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém relato com o código especificiado e seus relatos anteriores
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public IEnumerable<RelatoClinicoModel> ObterRelatosComConsultasAnteriores(int idRelato)
        {
            var a = GetQuery().Where(relato => relato.IdRelato == idRelato).ToList().ElementAtOrDefault(0);
            return GetQuery().Where(relato => relato.IdPaciente == a.IdPaciente && relato.OrdemCronologica <= a.OrdemCronologica);
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
        private static void Atribuir(RelatoClinicoModel relato, tb_relato_clinico _relatoE)
        {
            _relatoE.NivelDificuldade = relato.NivelDificuldade;
            _relatoE.IdPaciente = relato.IdPaciente;
            _relatoE.OrdemCronologia = relato.OrdemCronologica;
            _relatoE.RelatoVideo = relato.RelatoVideo;
            _relatoE.RelatoTextual = relato.RelatoTextual;
            _relatoE.idAreaAtuacao = relato.IdAreaAtuacao;
        }
    }
}