using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPrescricaoEnfermagem
    {
        private static GerenciadorPrescricaoEnfermagem gPrescricaoEnfermagem;
        private GerenciadorPrescricaoEnfermagem() { }

        public static GerenciadorPrescricaoEnfermagem GetInstance()
        {
            if (gPrescricaoEnfermagem == null)
            {
                gPrescricaoEnfermagem = new GerenciadorPrescricaoEnfermagem();
            }
            return gPrescricaoEnfermagem;
        }

        
        /// <summary>
        /// Insere dados do PrescricaoEnfermagem
        /// </summary>
        /// <param name="prescricaoEnfermagem"></param>
        /// <returns></returns>
        public long Inserir(PrescricaoEnfermagemModel prescricaoEnfermagem)
        {
            var repPrescricaoEnfermagem = new RepositorioGenerico<tb_precricao_enfermagem>();
            tb_precricao_enfermagem _tb_precricao_enfermagem = new tb_precricao_enfermagem();
            try
            {
                Atribuir(prescricaoEnfermagem, _tb_precricao_enfermagem);

                repPrescricaoEnfermagem.Inserir(_tb_precricao_enfermagem);
                repPrescricaoEnfermagem.SaveChanges();

                return _tb_precricao_enfermagem.IdPrescricaoEnfermagem;
            }
            catch (Exception e)
            {
                throw new DadosException("PrescricaoEnfermagem", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do PrescricaoEnfermagem
        /// </summary>
        /// <param name="prescricaoEnfermagem"></param>
        public void Atualizar(PrescricaoEnfermagemModel prescricaoEnfermagem)
        {
            try
            {
                var repPrescricaoEnfermagem = new RepositorioGenerico<tb_precricao_enfermagem>();
                tb_precricao_enfermagem _tb_precricao_enfermagem = repPrescricaoEnfermagem.ObterEntidade(dP => dP.IdPrescricaoEnfermagem == 
                    prescricaoEnfermagem.IdPrescricaoEnfermagem);
                Atribuir(prescricaoEnfermagem, _tb_precricao_enfermagem);
                repPrescricaoEnfermagem.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PrescricaoEnfermagem", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do PrescricaoEnfermagem
        /// </summary>
        /// <param long="idConsultaVariavel" long="idMedicamento"></param>
        public void Remover(long idPrescricaoEnfermagem)
        {
            try
            {
                var repPrescricaoEnfermagem = new RepositorioGenerico<tb_precricao_enfermagem>();
                repPrescricaoEnfermagem.Remover(dP => dP.IdPrescricaoEnfermagem == idPrescricaoEnfermagem);
                repPrescricaoEnfermagem.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PrescricaoEnfermagem", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PrescricaoEnfermagemModel> GetQuery()
        {
            var repPrescricaoEnfermagem = new RepositorioGenerico<tb_precricao_enfermagem>();
            var pvEntities = (pvEntities)repPrescricaoEnfermagem.ObterContexto();
            var query = from tb_precricao_enfermagem in pvEntities.tb_precricao_enfermagem
                        select new PrescricaoEnfermagemModel
                        {
                            IdPrescricaoEnfermagem = tb_precricao_enfermagem.IdPrescricaoEnfermagem,
                            IdConsultaVariavel = tb_precricao_enfermagem.IdConsultaVariavel,
                            IdDiagnostico = tb_precricao_enfermagem.IdDiagnostico,
                            DescricaoDiagnostico = tb_precricao_enfermagem.tb_diagnostico_consulta_variavel.tb_diagnostico.Diagnostico,
                            DescricaoPrescricao = tb_precricao_enfermagem.DescricaoPrescricao,
                            Realizada = tb_precricao_enfermagem.Realizada,
                            Horario = tb_precricao_enfermagem.Horarios
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os PrescricaoEnfermagemModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PrescricaoEnfermagemModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtem PrescricaoEnfermagem com o identificador da prescricao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public PrescricaoEnfermagemModel Obter(long idPrescricaoEnfermagem)
        {
            return GetQuery().Where(pe => pe.IdPrescricaoEnfermagem == idPrescricaoEnfermagem).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem lista de PrescricaoEnfermagem por consulta e diagnostico
        /// </summary>
        /// <param name="idConsultaVariavel">Identificador da consulta</param>
        /// <param name="idDiagnostico">Identificador do diagnostico</param>
        /// <returns>Lista de PrescricaoEnfermagem</returns>
        public IEnumerable<PrescricaoEnfermagemModel> ObterPorConsultaDiagnostico(long idConsultaVariavel, int idDiagnostico)
        {
            return GetQuery().Where(pe => pe.IdConsultaVariavel == idConsultaVariavel && pe.IdDiagnostico == idDiagnostico).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="prescricaoEnfermagem"></param>
        /// <param name="_tb_precricao_enfermagem"></param>
        private static void Atribuir(PrescricaoEnfermagemModel prescricaoEnfermagem, tb_precricao_enfermagem _tb_precricao_enfermagem)
        {
            _tb_precricao_enfermagem.IdPrescricaoEnfermagem = prescricaoEnfermagem.IdPrescricaoEnfermagem;
            _tb_precricao_enfermagem.IdConsultaVariavel = prescricaoEnfermagem.IdConsultaVariavel;
            _tb_precricao_enfermagem.IdDiagnostico = prescricaoEnfermagem.IdDiagnostico;
            _tb_precricao_enfermagem.DescricaoPrescricao = prescricaoEnfermagem.DescricaoPrescricao;
            _tb_precricao_enfermagem.Realizada = prescricaoEnfermagem.Realizada;
            _tb_precricao_enfermagem.Horarios = prescricaoEnfermagem.Horario;
        }
    }
}