using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoConsultaFator
    {
        /*
        private static GerenciadorDiagnosticoConsultaFator gDiagnosticoConsultaFator;
        private GerenciadorDiagnosticoConsultaFator() { }

        public static GerenciadorDiagnosticoConsultaFator GetInstance()
        {
            if (gDiagnosticoConsultaFator == null)
            {
                gDiagnosticoConsultaFator = new GerenciadorDiagnosticoConsultaFator();
            }
            return gDiagnosticoConsultaFator;
        }

        /// <summary>
        /// Insere dados do DiagnosticoConsultaFator
        /// </summary>
        /// <param name="diagnosticoConsultaFator"></param>
        /// <returns></returns>
        public long Inserir(DiagnosticoConsultaFatorModel diagnosticoConsultaFator)
        {
            DiagnosticoConsultaFatorModel diagConsult = gDiagnosticoConsultaFator.ObterPorConsultaDiagnosticoFator(
                diagnosticoConsultaFator.IdConsultaVariavel, diagnosticoConsultaFator.IdDiagnostico, 
                diagnosticoConsultaFator.IdDiagnosticoFator);
            if (diagConsult == null)
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnosticot>();
                tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel = new tb_diagnostico_consulta_variavel();
                try
                {
                    Atribuir(diagnosticoConsultaFator, _tb_diagnostico_consulta_variavel);
                    repDiagnosticoConsulta.Inserir(_tb_diagnostico_consulta_variavel);
                    repDiagnosticoConsulta.SaveChanges();
                    return _tb_diagnostico_consulta_variavel.IdConsultaVariavel;
                }
                catch (Exception e)
                {
                    throw new DadosException("DiagnosticoConsultaFator", e.Message, e);
                }
            }
            else
            {
                throw new NegocioException("Um diagnóstico com essas informações já foi cadastrado.");
            }
        }

        /// <summary>
        /// Atualiza dados do IntervencaoConsulta
        /// </summary>
        /// <param name="IntervencaoConsulta"></param>
        public void Atualizar(DiagnosticoConsultaFatorModel diagnosticoConsultaFator)
        {
            try
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel = repDiagnosticoConsulta.ObterEntidade(dC => 
                    dC.IdConsultaVariavel == diagnosticoConsultaFator.IdConsultaVariavel && dC.IdDiagnostico == diagnosticoConsultaFator.IdDiagnostico);
                Atribuir(diagnosticoConsultaFator, _tb_diagnostico_consulta_variavel);
                repDiagnosticoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsultaFator", e.Message, e);
            }
        }

        /*
        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(string s1, string s2, string s3, string s4, string s5, int idDiag, int idGrupoDiag)
        {
            if (s1 != null && s2 != null && s3 != null && s4 != null && s5 != null && idDiag != 0 && idGrupoDiag != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        } 

        /// <summary>
        /// Remove dados do DiagnosticoConsultaFator
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idDiagnostico"></param>
        public void Remover(long idConsultaVariavel, long idDiagnostico)
        {
            try
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                repDiagnosticoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdDiagnostico == idDiagnostico);
                repDiagnosticoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsultaFator", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiagnosticoConsultaFatorModel> GetQuery()
        {
            var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
            var pvEntities = (pvEntities)repDiagnosticoConsulta.ObterContexto();
            var query = from diagnosticoConsultaFator in pvEntities.tb_diagnostico_consulta_variavel
                        select new DiagnosticoConsultaFatorModel
                        {
                            IdConsultaVariavel = diagnosticoConsultaFator.IdConsultaVariavel,
                            IdDiagnostico = diagnosticoConsultaFator.IdDiagnostico,
                            Diagnostico = diagnosticoConsultaFator.tb_diagnostico.Diagnostico,
                            IdClasseDiagnostico = diagnosticoConsultaFator.tb_diagnostico.IdClasseDiagnostico,
                            DescricaoClasseDiagnostico = diagnosticoConsultaFator.tb_diagnostico.tb_classe_diagnostico.DescricaoClasse,
                            IdDominioDiagnostico = diagnosticoConsultaFator.tb_diagnostico.tb_classe_diagnostico.IdDominioDiagnostico,
                            DescricaoDominioDiagnostico = diagnosticoConsultaFator.tb_diagnostico.tb_classe_diagnostico.tb_dominio_diagnostico.
                                DescricaoDominio,
                            ResultadoEsperado = diagnosticoConsultaFator.ResultadoEsperado
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os DiagnosticoConsultaFator cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiagnosticoConsultaFatorModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DiagnosticoConsultaFatorModel com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public IEnumerable<DiagnosticoConsultaFatorModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(DiagnosticoConsultaFatorModel => DiagnosticoConsultaFatorModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtem consulta Diagnostico por consulta e intervencao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idIntervencao"></param>
        /// <returns></returns>
        public DiagnosticoConsultaFatorModel ObterPorConsultaDiagnostico(long idConsultaVariavel, int idDiagnostico)
        {
            return GetQuery().Where(dc => dc.IdConsultaVariavel == idConsultaVariavel
                && dc.IdDiagnostico == idDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="DiagnosticoConsultaFatorModel"></param>
        /// <param name="_tb_diagnostico_consulta_variavel"></param>
        private static void Atribuir(DiagnosticoConsultaFatorModel DiagnosticoConsultaFatorModel, tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel)
        {
            _tb_diagnostico_consulta_variavel.IdConsultaVariavel = DiagnosticoConsultaFatorModel.IdConsultaVariavel;
            _tb_diagnostico_consulta_variavel.IdDiagnostico = DiagnosticoConsultaFatorModel.IdDiagnostico;
            _tb_diagnostico_consulta_variavel.ResultadoEsperado = DiagnosticoConsultaFatorModel.ResultadoEsperado;
        }
        */
    }
}