using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorComunicacao
    {
        private static GerenciadorComunicacao gComunicacao;

        private GerenciadorComunicacao() { }

        public static GerenciadorComunicacao GetInstance()
        {
            if (gComunicacao == null)
            {
                gComunicacao = new GerenciadorComunicacao();
            }
            return gComunicacao;
        }

        /// <summary>
        /// Faz correção de Comunicacao de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(ComunicacaoModel comunicacao, ComunicacaoModel comunicacaoGabarito, ModelStateDictionary modelState)
        {
            if (comunicacao.Verbaliza != comunicacaoGabarito.Verbaliza)
            {
                modelState.AddModelError("Verbaliza", "Gabarito: " + (comunicacaoGabarito.Verbaliza.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.Deprimido != comunicacaoGabarito.Deprimido)
            {
                modelState.AddModelError("Deprimido", "Gabarito: " + (comunicacaoGabarito.Deprimido.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.DiscursoIncoerente != comunicacaoGabarito.DiscursoIncoerente)
            {
                modelState.AddModelError("DiscursoIncoerente", "Gabarito: " + (comunicacaoGabarito.DiscursoIncoerente.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.TranstornosExpressaoVerbal != comunicacaoGabarito.TranstornosExpressaoVerbal)
            {
                modelState.AddModelError("TranstornosExpressaoVerbal", "Gabarito: \"" + comunicacaoGabarito.TranstornosExpressaoVerbal  + "\"");
            }
            if (comunicacao.Tv != comunicacaoGabarito.Tv)
            {
                modelState.AddModelError("Tv", "Gabarito: " + (comunicacaoGabarito.Tv.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.Radio != comunicacaoGabarito.Radio)
            {
                modelState.AddModelError("Radio", "Gabarito: " + (comunicacaoGabarito.Radio.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.Celular != comunicacaoGabarito.Celular)
            {
                modelState.AddModelError("Celular", "Gabarito: " + (comunicacaoGabarito.Celular.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.Leituras != comunicacaoGabarito.Leituras)
            {
                modelState.AddModelError("Leituras", "Gabarito: " + (comunicacaoGabarito.Leituras.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("Especificar", comunicacao.Especificar, comunicacaoGabarito.Especificar, modelState);
            if (comunicacao.TipoComportamento != comunicacaoGabarito.TipoComportamento)
            {
                modelState.AddModelError("TipoComportamento", "Gabarito: \""+ comunicacaoGabarito.TipoComportamento +"\'");
            }
            if (comunicacao.InterageComEquipeSaude != comunicacaoGabarito.InterageComEquipeSaude)
            {
                modelState.AddModelError("InterageComEquipeSaude", "Gabarito: " + (comunicacaoGabarito.InterageComEquipeSaude.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.RecebeVisitas != comunicacaoGabarito.RecebeVisitas)
            {
                modelState.AddModelError("RecebeVisitas", "Gabarito: " + (comunicacaoGabarito.RecebeVisitas.Equals(true) ? "Sim" : "Não"));
            }
            if (comunicacao.ParticipaAtividades != comunicacaoGabarito.ParticipaAtividades)
            {
                modelState.AddModelError("ParticipaAtividades", "Gabarito: " + (comunicacaoGabarito.ParticipaAtividades.Equals(true) ? "Sim" : "Não"));
            }
        } 

        /// <summary>
        /// Insere dados da Comunicacao
        /// </summary>
        /// <param name="comunicacao"></param>
        /// <returns></returns>
        public long Inserir(ComunicacaoModel comunicacao)
        {
            var repComunicacao = new RepositorioGenerico<tb_comunicacao>();
            tb_comunicacao _tb_comunicacao = new tb_comunicacao();
            try
            {
                Atribuir(comunicacao, _tb_comunicacao);

                repComunicacao.Inserir(_tb_comunicacao);
                repComunicacao.SaveChanges();

                return _tb_comunicacao.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Comunicacao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do comunicacao
        /// </summary>
        /// <param name="comunicacao"></param>
        public void Atualizar(ComunicacaoModel comunicacao)
        {
            try
            {
                var repComunicacao = new RepositorioGenerico<tb_comunicacao>();
                tb_comunicacao _tb_comunicacao = repComunicacao.ObterEntidade(c => c.IdConsultaVariavel == comunicacao.IdConsultaVariavel);
                Atribuir(comunicacao, _tb_comunicacao);

                repComunicacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Comunicacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do comunicacao especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repComunicacao = new RepositorioGenerico<tb_comunicacao>();
                repComunicacao.Remover(c => c.IdConsultaVariavel == idConsultaVariavel);
                repComunicacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Comunicacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ComunicacaoModel> GetQuery()
        {
            var repComunicacao = new RepositorioGenerico<tb_comunicacao>();
            var pvEntities = (pvEntities)repComunicacao.ObterContexto();
            var query = from comunicacao in pvEntities.tb_comunicacao
                        select new ComunicacaoModel
                        {
                            IdConsultaVariavel = comunicacao.IdConsultaVariavel,
                            Verbaliza = comunicacao.Verbaliza,
                            Deprimido = comunicacao.Deprimido,
                            TranstornosExpressaoVerbal = (comunicacao.TranstornosExpressaoVerbal == "NaoSeAplica" ?
                                ListaTranstornosExpressaoVerbal.NaoSeAplica : comunicacao.TranstornosExpressaoVerbal == "Disfasia" ?
                                ListaTranstornosExpressaoVerbal.Disfasia : comunicacao.TranstornosExpressaoVerbal == "Disartria" ?
                                ListaTranstornosExpressaoVerbal.Disartria : comunicacao.TranstornosExpressaoVerbal == "Dislalia" ?
                                ListaTranstornosExpressaoVerbal.Dislalia : comunicacao.TranstornosExpressaoVerbal == "Afonia" ?
                                ListaTranstornosExpressaoVerbal.Afonia : comunicacao.TranstornosExpressaoVerbal == "ComunicaPorGesto" ?
                                ListaTranstornosExpressaoVerbal.ComunicaPorGesto : ListaTranstornosExpressaoVerbal.ComunicaPorEscrita),
                            DiscursoIncoerente = comunicacao.DiscursoIncoerente,
                            Tv = comunicacao.Tv,
                            Radio = comunicacao.Radio,
                            Celular = comunicacao.Celular,
                            Leituras = comunicacao.Leituras,
                            Especificar = comunicacao.Especificar,
                            TipoComportamento = (comunicacao.TipoComportamento == "Calmo" ? ListaTipoComportamento.Calmo :
                                comunicacao.TipoComportamento == "Ansioso" ? ListaTipoComportamento.Ansioso :
                                comunicacao.TipoComportamento == "Retraido" ? ListaTipoComportamento.Retraido :
                                comunicacao.TipoComportamento == "ComMedo" ? ListaTipoComportamento.ComMedo : ListaTipoComportamento.Agressico),
                            InterageComEquipeSaude = comunicacao.InterageComEquipeSaude,
                            RecebeVisitas = comunicacao.RecebeVisitas,
                            ParticipaAtividades = comunicacao.ParticipaAtividades
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as comunicacoes cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ComunicacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém comunicacao com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public ComunicacaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(c => c.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="comunicacao"></param>
        /// <param name="_tb_comunicacao"></param>
        private static void Atribuir(ComunicacaoModel comunicacao, tb_comunicacao _tb_comunicacao)
        {
            _tb_comunicacao.IdConsultaVariavel = comunicacao.IdConsultaVariavel;
            _tb_comunicacao.Celular = comunicacao.Celular;
            _tb_comunicacao.Deprimido = comunicacao.Deprimido;
            _tb_comunicacao.DiscursoIncoerente = comunicacao.DiscursoIncoerente;
            _tb_comunicacao.Especificar = comunicacao.Especificar;
            _tb_comunicacao.InterageComEquipeSaude = comunicacao.InterageComEquipeSaude;
            _tb_comunicacao.Leituras = comunicacao.Leituras;
            _tb_comunicacao.ParticipaAtividades = comunicacao.ParticipaAtividades;
            _tb_comunicacao.Radio = comunicacao.Radio;
            _tb_comunicacao.RecebeVisitas = comunicacao.RecebeVisitas;
            _tb_comunicacao.TipoComportamento = comunicacao.TipoComportamento.ToString();
            _tb_comunicacao.TranstornosExpressaoVerbal = comunicacao.TranstornosExpressaoVerbal.ToString();
            _tb_comunicacao.Tv = comunicacao.Tv;
            _tb_comunicacao.Verbaliza = comunicacao.Verbaliza;
        }
    }
}