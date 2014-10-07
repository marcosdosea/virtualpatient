using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using PacienteVirtual.Controllers;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoConsulta
    {
        private static GerenciadorDiagnosticoConsulta gDiagnosticoConsulta;
        private GerenciadorDiagnosticoConsulta() { }

        public static GerenciadorDiagnosticoConsulta GetInstance()
        {
            if (gDiagnosticoConsulta == null)
            {
                gDiagnosticoConsulta = new GerenciadorDiagnosticoConsulta();
            }
            return gDiagnosticoConsulta;
        }

        
        /// <summary>
        /// Realiza a correção da consulta diagnostico de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="listaIntervencao"></param>
        public void CorrigirRespostas(IEnumerable<DiagnosticoConsultaModel> resposta, IEnumerable<DiagnosticoConsultaModel> gabarito, ModelStateDictionary model)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            bool contem;
            foreach (var diagnostico in resposta)
            {
                contem = false;
                foreach (var diagnosticoGabarito in gabarito)
                {
                    if (diagnostico.IdDiagnostico == diagnosticoGabarito.IdDiagnostico && diagnostico.IdClasseDiagnostico == 
                        diagnosticoGabarito.IdClasseDiagnostico && diagnostico.IdDominioDiagnostico == 
                        diagnosticoGabarito.IdDominioDiagnostico)
                    {
                        contem = true;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + diagnostico.DescricaoDiagnostico + ", " + 
                        diagnostico.DescricaoDominioDiagnostico + ", " + diagnostico.DescricaoClasseDiagnostico +";<br>";
                }
            }
            foreach (var diagnosticoGabarito in gabarito)
            {
                contem = false;
                foreach (var diagnostico in resposta)
                {
                    if (diagnostico.IdDiagnostico == diagnosticoGabarito.IdDiagnostico && diagnostico.IdClasseDiagnostico == 
                        diagnosticoGabarito.IdClasseDiagnostico)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + diagnosticoGabarito.DescricaoDiagnostico + 
                       ", " + diagnosticoGabarito.DescricaoDominioDiagnostico + ", " + diagnosticoGabarito.DescricaoClasseDiagnostico + 
                       ";<br>";
                }
            }
            model.AddModelError("ErroDiagnostico", (erroNaoContemNoGabarito.Equals("") ? "" : "Diagnósticos que não contém no Gabarito: <br>" 
                + erroNaoContemNoGabarito + "<br>") + (erroContemGabaritoNaoContemResposta.Equals("") ? "" :
                "Diagnósticos que não foram adicionados: <br>" + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Insere dados do DiagnosticoConsulta
        /// </summary>
        /// <param name="DiagnosticoConsulta"></param>
        /// <returns></returns>
        public long Inserir(DiagnosticoConsultaModel diagnosticoConsulta)
        {
            DiagnosticoConsultaModel diagConsult = gDiagnosticoConsulta.ObterPorConsultaDiagnostico(diagnosticoConsulta.IdConsultaVariavel,
                diagnosticoConsulta.IdDiagnostico);
            if (diagConsult == null)
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel = new tb_diagnostico_consulta_variavel();
                try
                {
                    Atribuir(diagnosticoConsulta, _tb_diagnostico_consulta_variavel);
                    repDiagnosticoConsulta.Inserir(_tb_diagnostico_consulta_variavel);
                    repDiagnosticoConsulta.SaveChanges();
                    return _tb_diagnostico_consulta_variavel.IdConsultaVariavel;
                }
                catch (Exception e)
                {
                    throw new DadosException("DiagnosticoConsulta", e.Message, e);
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
        public void Atualizar(DiagnosticoConsultaModel diagnosticoConsulta)
        {
            try
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel = repDiagnosticoConsulta.ObterEntidade(dC => 
                    dC.IdConsultaVariavel == diagnosticoConsulta.IdConsultaVariavel && dC.IdDiagnostico == diagnosticoConsulta.IdDiagnostico);
                Atribuir(diagnosticoConsulta, _tb_diagnostico_consulta_variavel);
                repDiagnosticoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do DiagnosticoConsulta
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
                throw new DadosException("DiagnosticoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiagnosticoConsultaModel> GetQuery()
        {
            var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
            var pvEntities = (pvEntities)repDiagnosticoConsulta.ObterContexto();
            var query = from diagnosticoConsulta in pvEntities.tb_diagnostico_consulta_variavel
                        select new DiagnosticoConsultaModel
                        {
                            IdConsultaVariavel = diagnosticoConsulta.IdConsultaVariavel,
                            IdDiagnostico = diagnosticoConsulta.IdDiagnostico,
                            DescricaoDiagnostico = diagnosticoConsulta.tb_diagnostico.Diagnostico,
                            IdClasseDiagnostico = diagnosticoConsulta.tb_diagnostico.IdClasseDiagnostico,
                            DescricaoClasseDiagnostico = diagnosticoConsulta.tb_diagnostico.tb_classe_diagnostico.DescricaoClasse,
                            IdDominioDiagnostico = diagnosticoConsulta.tb_diagnostico.tb_classe_diagnostico.IdDominioDiagnostico,
                            DescricaoDominioDiagnostico = diagnosticoConsulta.tb_diagnostico.tb_classe_diagnostico.tb_dominio_diagnostico.
                                DescricaoDominio,
                            ResultadoEsperado = diagnosticoConsulta.ResultadoEsperado,
                            Risco = diagnosticoConsulta.tb_diagnostico.PossuiRisco
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os DiagnosticoConsulta cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiagnosticoConsultaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DiagnosticoConsultaModel com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public IEnumerable<DiagnosticoConsultaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(DiagnosticoConsultaModel => DiagnosticoConsultaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtem consulta Diagnostico por consulta e intervencao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idIntervencao"></param>
        /// <returns></returns>
        public DiagnosticoConsultaModel ObterPorConsultaDiagnostico(long idConsultaVariavel, int idDiagnostico)
        {
            return GetQuery().Where(dc => dc.IdConsultaVariavel == idConsultaVariavel
                && dc.IdDiagnostico == idDiagnostico).ToList().ElementAtOrDefault(0);
        }

        public void AtualizaConsultaDiagnosticoSelecionada(long idConsultaVariavel, int idDiagnostico, int idDominio, int idClasse)
        {
            SessionController.IdDiagnosticoConsulta = idDiagnostico;
            SessionController.IdDominioDiagnosticoConsulta = idDominio;
            SessionController.IdClasseDiagnosticoConsulta = idClasse;
            SessionController.DiagnosticoConsulta = ObterPorConsultaDiagnostico(idConsultaVariavel, idDiagnostico);
            SessionController.ListaDiagnosticoConsultaCaracteristica = null;
            SessionController.ListaDiagnosticoConsultaFator = null;
            SessionController.ListaPrescricaoEnfermagem = null;
            if (SessionController.DiagnosticoConsulta.Risco == true)
            {
                SessionController.RiscoDiagnostico = true;
            }
            else
            {
                SessionController.RiscoDiagnostico = false;
            }
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="DiagnosticoConsultaModel"></param>
        /// <param name="_tb_diagnostico_consulta_variavel"></param>
        private static void Atribuir(DiagnosticoConsultaModel DiagnosticoConsultaModel, tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel)
        {
            _tb_diagnostico_consulta_variavel.IdConsultaVariavel = DiagnosticoConsultaModel.IdConsultaVariavel;
            _tb_diagnostico_consulta_variavel.IdDiagnostico = DiagnosticoConsultaModel.IdDiagnostico;
            _tb_diagnostico_consulta_variavel.ResultadoEsperado = DiagnosticoConsultaModel.ResultadoEsperado;
        }
    }
}