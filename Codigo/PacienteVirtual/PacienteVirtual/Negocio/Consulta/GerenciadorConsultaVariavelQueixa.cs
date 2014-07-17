using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;
using PacienteVirtual.Controllers;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorConsultaVariavelQueixa
    {
        private static GerenciadorConsultaVariavelQueixa gConsultaFixo;

        private GerenciadorConsultaVariavelQueixa() { }

        public static GerenciadorConsultaVariavelQueixa GetInstance()
        {
            if (gConsultaFixo == null)
            {
                gConsultaFixo = new GerenciadorConsultaVariavelQueixa();
            }
            return gConsultaFixo;
        }

        /// <summary>
        /// Insere dados do consultaVariavelQueixa
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        /// <returns></returns>
        public long Inserir(ConsultaVariavelQueixaModel consultaVariavelQueixa)
        {
            var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
            tb_consulta_variavel_queixa _consultaVariavelQueixaE = new tb_consulta_variavel_queixa();
            try
            {
                Atribuir(consultaVariavelQueixa, _consultaVariavelQueixaE);

                repConsultaVariavel.Inserir(_consultaVariavelQueixaE);
                repConsultaVariavel.SaveChanges();

                return _consultaVariavelQueixaE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavelQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do consultaVariavelQueixa
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        public void Atualizar(ConsultaVariavelQueixaModel consultaVariavelQueixa)
        {
            try
            {
                var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
                tb_consulta_variavel_queixa _consultaVariavelQueixaE = repConsultaVariavel.ObterEntidade(cvq => cvq.IdConsultaVariavel == consultaVariavelQueixa.IdConsultaVariavel && cvq.IdQueixa == consultaVariavelQueixa.IdQueixa);
                Atribuir(consultaVariavelQueixa, _consultaVariavelQueixaE);

                repConsultaVariavel.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavelQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do consultaVariavelQueixa
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaVariavel, int idQueixa)
        {
            try
            {
                var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
                repConsultaVariavel.Remover(cvq => cvq.IdConsultaVariavel == idConsultaVariavel && cvq.IdQueixa == idQueixa);
                repConsultaVariavel.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavelQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ConsultaVariavelQueixaModel> GetQuery()
        {
            var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
            var pvEntities = (pvEntities)repConsultaVariavel.ObterContexto();
            var query = from tb_consulta_variavel_queixa in pvEntities.tb_consulta_variavel_queixa
                        select new ConsultaVariavelQueixaModel
                        {
                            IdConsultaVariavel = tb_consulta_variavel_queixa.IdConsultaVariavel,
                            IdQueixa = tb_consulta_variavel_queixa.IdQueixa,
                            IdObjetivoTerapeutico = tb_consulta_variavel_queixa.IdObjetivoTerapeutico,
                            IdSituacaoQueixa = tb_consulta_variavel_queixa.IdSituacaoQueixa,
                            Tipo = tb_consulta_variavel_queixa.Tipo,
                            Desde = tb_consulta_variavel_queixa.Desde,
                            Prioridade = (int) tb_consulta_variavel_queixa.Prioridade,

                            DescricaoSituacao = tb_consulta_variavel_queixa.tb_situacao_queixa.Descricao,
                            DescricaoObjetivoTerapeutico = tb_consulta_variavel_queixa.tb_objetivo_terapeutico.Descricao,
                            DescricaoQueixa = tb_consulta_variavel_queixa.tb_queixa.DescricaoQueixa
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os consultaVariavelQueixa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConsultaVariavelQueixaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém consultaVariavelQueixa a partir da consulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public IEnumerable<ConsultaVariavelQueixaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(consultaVariavelQueixa => consultaVariavelQueixa.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtém consultaVariavelQueixa por consulta e por Queixa
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idQueixa"></param>
        /// <returns></returns>
        public ConsultaVariavelQueixaModel ObterPorConcultaQueixa(long idConsultaVariavel, int idQueixa)
        {
            return GetQuery().Where(cvq => cvq.IdConsultaVariavel == idConsultaVariavel && cvq.IdQueixa == idQueixa).ToList().ElementAtOrDefault(0);
        }


        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        /// <param name="_consultaVariavelQueixaE"></param>
        private static void Atribuir(ConsultaVariavelQueixaModel consultaVariavelQueixa, tb_consulta_variavel_queixa _consultaVariavelQueixaE)
        {
            _consultaVariavelQueixaE.IdConsultaVariavel = consultaVariavelQueixa.IdConsultaVariavel;
            _consultaVariavelQueixaE.IdQueixa = consultaVariavelQueixa.IdQueixa;
            _consultaVariavelQueixaE.IdObjetivoTerapeutico = consultaVariavelQueixa.IdObjetivoTerapeutico;
            _consultaVariavelQueixaE.IdSituacaoQueixa = consultaVariavelQueixa.IdSituacaoQueixa;
            _consultaVariavelQueixaE.Tipo = consultaVariavelQueixa.Tipo;
            _consultaVariavelQueixaE.Desde = consultaVariavelQueixa.Desde;
            _consultaVariavelQueixaE.Prioridade = consultaVariavelQueixa.Prioridade;
        }

        /// <summary>
        /// Faz correção das consultas variaveis queixa da consulta 1 de acordo com o gabarito
        /// </summary>
        /// <param name="listaConsultVarQueixa"></param>
        /// <param name="ListaConsultVarQueixaGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostasConsulta1(IEnumerable<ConsultaVariavelQueixaModel> listaConsultVarQueixa, IEnumerable<ConsultaVariavelQueixaModel> ListaConsultVarQueixaGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            bool contem;
            foreach (var queixa in listaConsultVarQueixa)
            {
                contem = false;
                foreach (var queixaGabarito in ListaConsultVarQueixaGabarito)
                {
                    if (queixa.IdQueixa == queixaGabarito.IdQueixa)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito += queixa.DescricaoQueixa + "<br>";
                }
            }
            foreach (var queixaGabarito in ListaConsultVarQueixaGabarito)
            {
                contem = false;
                foreach (var queixa in listaConsultVarQueixa)
                {
                    if (queixa.IdQueixa == queixaGabarito.IdQueixa)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta += queixaGabarito.DescricaoQueixa + ";<br>";
                }
            }
            modelState.AddModelError("ErroConsultaVariavelQueixa", (erroNaoContemNoGabarito.Equals("") ? " " : "As Revisões do Sistema que não contém no Gabarito: " + erroNaoContemNoGabarito + "<br>") +
                (erroContemGabaritoNaoContemResposta.Equals("") ? " " : "As Revisões do Sistema que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Faz correção das consultas variaveis queixa da consulta 2 de acordo com o gabarito
        /// </summary>
        /// <param name="listaConsultVarQueixa"></param>
        /// <param name="ListaConsultVarQueixaGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostasConsulta2(IEnumerable<ConsultaVariavelQueixaModel> listaConsultVarQueixa, IEnumerable<ConsultaVariavelQueixaModel> ListaConsultVarQueixaGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var queixa in listaConsultVarQueixa)
            {
                contem = false;
                foreach (var queixaGabarito in ListaConsultVarQueixaGabarito)
                {
                    if (queixa.IdQueixa == queixaGabarito.IdQueixa)
                    {
                        contem = true;
                        if (queixa.IdObjetivoTerapeutico != queixaGabarito.IdObjetivoTerapeutico || !queixa.DescricaoSituacao.Equals(queixaGabarito.DescricaoSituacao) || queixa.Desde != queixaGabarito.Desde || queixa.Tipo != queixaGabarito.Tipo || queixa.Prioridade != queixaGabarito.Prioridade)
                        {
                            erroRespostas += "Gabarito da Revisão do Problema " + queixaGabarito.DescricaoQueixa + ": " + queixaGabarito.DescricaoObjetivoTerapeutico + ", " + (queixaGabarito.DescricaoSituacao == null || queixaGabarito.DescricaoSituacao == "" ? "EM BRANCO" : queixaGabarito.DescricaoSituacao) + ", " + (queixaGabarito.Desde == null || queixaGabarito.Desde == "" ? "EM BRANCO" : queixaGabarito.Desde) + ", " + queixaGabarito.Tipo + " e " + queixaGabarito.Prioridade + ".<br>";
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito += queixa.DescricaoQueixa + "<br>";
                }
            }
            foreach (var queixaGabarito in ListaConsultVarQueixaGabarito)
            {
                contem = false;
                foreach (var queixa in listaConsultVarQueixa)
                {
                    if (queixa.IdQueixa == queixaGabarito.IdQueixa)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta += queixaGabarito.DescricaoQueixa + ";<br>";
                }
            }
            SessionController.ErroConsultaVariavelQueixa2 = (erroRespostas.Equals("") ? " " : erroRespostas + "<br>") +
                  (erroNaoContemNoGabarito.Equals("") ? " " : "Problemas que não contém no Gabarito: <br>" + erroNaoContemNoGabarito + "<br>") +
                  (erroContemGabaritoNaoContemResposta.Equals("") ? " " : "Problemas que não foram adicionados do Gabarito: <br>" + erroContemGabaritoNaoContemResposta);
        }
    }
}