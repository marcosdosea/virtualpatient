﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

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

        /*
        /// <summary>
        /// Realiza a correção da consulta diagnostico de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="listaIntervencao"></param>
        public void CorrigirRespostas(IEnumerable<DiagnosticoConsultaModel> resposta, IEnumerable<DiagnosticoConsultaModel> gabarito, ModelStateDictionary model)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var diagnostico in resposta)
            {
                contem = false;
                foreach (var diagnosticoGabarito in gabarito)
                {
                    if (diagnostico.IdDiagnostico == diagnosticoGabarito.IdDiagnostico && diagnostico.IdClasseDiagnostico == diagnosticoGabarito.IdClasseDiagnostico)
                    {
                        contem = true;
                        if (Global.RemoverAcentuacao(diagnostico.AvaliacaoResultados) != Global.RemoverAcentuacao(diagnosticoGabarito.AvaliacaoResultados) || Global.RemoverAcentuacao(diagnostico.CaracteristicasDefinidoras) != Global.RemoverAcentuacao(diagnosticoGabarito.CaracteristicasDefinidoras) || Global.RemoverAcentuacao(diagnostico.PrescricaoCuidado) != Global.RemoverAcentuacao(diagnosticoGabarito.PrescricaoCuidado) || Global.RemoverAcentuacao(diagnostico.ResultadoEsperado) != Global.RemoverAcentuacao(diagnosticoGabarito.ResultadoEsperado))
                        {
                            erroRespostas = erroRespostas + "Gabarito do Diagnóstico: " + diagnosticoGabarito.DescricaoDiagnostico+" e Grupo Diagnóstico "+ diagnosticoGabarito.DescricaoClasseDiagnostico + ": " + diagnosticoGabarito.Fatores + "," + diagnosticoGabarito.PrescricaoCuidado + ", " + diagnosticoGabarito.ResultadoEsperado + ",<br>";
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + diagnostico.DescricaoDiagnostico + ";<br>";
                }
            }
            foreach (var diagnosticoGabarito in gabarito)
            {
                contem = false;
                foreach (var diagnostico in resposta)
                {
                    if (diagnostico.IdDiagnostico == diagnosticoGabarito.IdDiagnostico && diagnostico.IdClasseDiagnostico == diagnosticoGabarito.IdClasseDiagnostico)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + diagnosticoGabarito.DescricaoDiagnostico + ";<br>";
                }
            }
            model.AddModelError("ErroDiagnostico", (erroRespostas.Equals("") ? "" : erroRespostas + "<br>") +
                (erroNaoContemNoGabarito.Equals("") ? "" : "Diagnósticos que não contém no Gabarito: " + erroNaoContemNoGabarito + "<br>") +
                (erroContemGabaritoNaoContemResposta.Equals("") ? "" : "Diagnósticos que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        } */

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
        } */

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
                            ResultadoEsperado = diagnosticoConsulta.ResultadoEsperado
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