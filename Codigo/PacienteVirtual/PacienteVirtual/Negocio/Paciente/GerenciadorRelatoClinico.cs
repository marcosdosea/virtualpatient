using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Persistence;
using PacienteVirtual.Models;

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
        public void Remover(int idCurso)
        {
            try
            {
                var repRelato = new RepositorioGenerico<tb_relato_clinico>();
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
            var repRelato = new RepositorioGenerico<tb_relato_clinico>();
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
        public IEnumerable<RelatoClinicoModel> ObterRelatos(int idPaciente)
        {
            return GetQuery().Where(relato => relato.IdPaciente == idPaciente).ToList();
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
        }
    }
}