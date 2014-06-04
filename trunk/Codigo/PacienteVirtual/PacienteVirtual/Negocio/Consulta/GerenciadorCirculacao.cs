using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using System.Web.Mvc;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorCirculacao
    {
        private static GerenciadorCirculacao gCirculacao;

        private GerenciadorCirculacao() { }

        public static GerenciadorCirculacao GetInstance()
        {
            if (gCirculacao == null)
            {
                gCirculacao = new GerenciadorCirculacao();
            }
            return gCirculacao;
        }

        /// <summary>
        /// Faz correção de Circulacao de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="circulacao"></param>
        /// <param name="circulacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(CirculacaoModel circulacao, CirculacaoModel circulacaoGabarito, ModelStateDictionary modelState)
        {
            if (circulacao.PA != circulacaoGabarito.PA)
            {
                modelState.AddModelError("PA", "Gabarito: " + circulacaoGabarito.PA);
            }
            if (circulacao.P != circulacaoGabarito.P)
            {
                modelState.AddModelError("P", "Gabarito: " + circulacaoGabarito.P);
            }
            if (circulacao.CateterPeriferico != circulacaoGabarito.CateterPeriferico)
            {
                modelState.AddModelError("CateterPeriferico", "Gabarito: " + (circulacaoGabarito.CateterPeriferico.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("CateterLocal", circulacao.CateterLocal, circulacaoGabarito.CateterLocal, modelState);
            if (!circulacao.CateterData.Equals(circulacaoGabarito.CateterData))
            {
                modelState.AddModelError("CateterData", "Gabarito: \"" + circulacaoGabarito.CateterData.ToShortDateString() + "\"");
            }
            if (circulacao.CateterCentral != circulacaoGabarito.CateterCentral)
            {
                modelState.AddModelError("CateterCentral", "Gabarito: " + (circulacaoGabarito.CateterCentral.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("CateterCentralLocal", circulacao.CateterCentralLocal, circulacaoGabarito.CateterCentralLocal, modelState);
            if (!circulacao.CateterCentralData.Equals(circulacaoGabarito.CateterCentralData))
            {
                modelState.AddModelError("CateterCentralData", "Gabarito: \"" + circulacaoGabarito.CateterCentralData.ToShortDateString() + "\"");
            }
            if (circulacao.DisseccaoVenosa != circulacaoGabarito.DisseccaoVenosa)
            {
                modelState.AddModelError("DisseccaoVenosa", "Gabarito: " + (circulacaoGabarito.DisseccaoVenosa.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("DisseccaoVenosaLocal", circulacao.DisseccaoVenosaLocal, circulacaoGabarito.DisseccaoVenosaLocal, modelState);
            if (!circulacao.DissecacaoVenosaData.Equals(circulacaoGabarito.DissecacaoVenosaData))
            {
                modelState.AddModelError("DissecacaoVenosaData", "Gabarito: \"" + circulacaoGabarito.DissecacaoVenosaData.ToShortDateString() + "\"");
            }
            if (circulacao.SinaisFlogisticos != circulacaoGabarito.SinaisFlogisticos)
            {
                modelState.AddModelError("SinaisFlogisticos", "Gabarito: " + (circulacaoGabarito.SinaisFlogisticos.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("SinaisFlogisticosQuaisLocal", circulacao.SinaisFlogisticosQuaisLocal, circulacaoGabarito.SinaisFlogisticosQuaisLocal, modelState);
            if (circulacao.RedeVenosaVisivel != circulacaoGabarito.RedeVenosaVisivel)
            {
                modelState.AddModelError("RedeVenosaVisivel", "Gabarito: " + (circulacaoGabarito.RedeVenosaVisivel.Equals(true) ? "Sim" : "Não"));
            }
            if (circulacao.RedeVenosaPulsosPalpaveis != circulacaoGabarito.RedeVenosaPulsosPalpaveis)
            {
                modelState.AddModelError("RedeVenosaPulsosPalpaveis", "Gabarito: " + (circulacaoGabarito.RedeVenosaPulsosPalpaveis.Equals(true) ? "Sim" : "Não"));
            }
            if (circulacao.RedeVenosaSemAcesso != circulacaoGabarito.RedeVenosaSemAcesso)
            {
                modelState.AddModelError("RedeVenosaSemAcesso", "Gabarito: " + (circulacaoGabarito.RedeVenosaSemAcesso.Equals(true) ? "Sim" : "Não"));
            }
            if (circulacao.Flebite != circulacaoGabarito.Flebite)
            {
                modelState.AddModelError("Flebite", "Gabarito: " + (circulacaoGabarito.Flebite.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("FlebiteLocalizar", circulacao.FlebiteLocalizar, circulacaoGabarito.FlebiteLocalizar, modelState);
            if (circulacao.Infiltracao != circulacaoGabarito.Infiltracao)
            {
                modelState.AddModelError("Infiltracao", "Gabarito: " + (circulacaoGabarito.Infiltracao.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("InfiltracaoLocalizar", circulacao.InfiltracaoLocalizar, circulacaoGabarito.InfiltracaoLocalizar, modelState);
            if (circulacao.EnchimentoCapilar != circulacaoGabarito.EnchimentoCapilar)
            {
                modelState.AddModelError("EnchimentoCapilar", "Gabarito: \"" + circulacaoGabarito.EnchimentoCapilar + "\'");
            }
            if (circulacao.Varizes != circulacaoGabarito.Varizes)
            {
                modelState.AddModelError("Varizes", "Gabarito: " + (circulacaoGabarito.Varizes.Equals(true) ? "Sim" : "Não"));
            }
            if (circulacao.Edema != circulacaoGabarito.Edema)
            {
                modelState.AddModelError("Edema", "Gabarito: " + (circulacaoGabarito.Edema.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("EdemaLocalizar", circulacao.EdemaLocalizar, circulacaoGabarito.EdemaLocalizar, modelState);
        } 

        /// <summary>
        /// Insere dados da Circulacao
        /// </summary>
        /// <param name="circulacao"></param>
        /// <returns></returns>
        public long Inserir(CirculacaoModel circulacao)
        {
            var repCirculacao = new RepositorioGenerico<tb_circulacao>();
            tb_circulacao _tb_circulacao = new tb_circulacao();
            try
            {
                Atribuir(circulacao, _tb_circulacao);

                repCirculacao.Inserir(_tb_circulacao);
                repCirculacao.SaveChanges();

                return _tb_circulacao.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Circulacao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do circulacao
        /// </summary>
        /// <param name="circulacao"></param>
        public void Atualizar(CirculacaoModel circulacao)
        {
            try
            {
                var repCirculacao = new RepositorioGenerico<tb_circulacao>();
                tb_circulacao _tb_circulacao = repCirculacao.ObterEntidade(c => c.IdConsultaVariavel == circulacao.IdConsultaVariavel);
                Atribuir(circulacao, _tb_circulacao);

                repCirculacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Circulacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do circulacao especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repCirculacao = new RepositorioGenerico<tb_circulacao>();
                repCirculacao.Remover(c => c.IdConsultaVariavel == idConsultaVariavel);
                repCirculacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Circulacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<CirculacaoModel> GetQuery()
        {
            var repCirculacao = new RepositorioGenerico<tb_circulacao>();
            var pvEntities = (pvEntities)repCirculacao.ObterContexto();
            var query = from circulacao in pvEntities.tb_circulacao
                        select new CirculacaoModel
                        {
                            IdConsultaVariavel = circulacao.IdConsultaVariavel,
                            CateterCentral = circulacao.CateterCentral,
                            CateterCentralData = (DateTime)circulacao.CateterCentralData,
                            EnchimentoCapilar = (circulacao.EnchimentoCapilar == "MenorIgual3" ?
                                ListaEnchimentoCapilar.MenorIgual3 :  ListaEnchimentoCapilar.Maior3),
                            CateterCentralLocal = circulacao.CateterCentralLocal,
                            CateterData = (DateTime)circulacao.CateterData,
                            CateterLocal = circulacao.CateterLocal,
                            CateterPeriferico = circulacao.CateterPeriferico,
                            DissecacaoVenosaData = (DateTime)circulacao.DissecacaoVenosaData,
                            DisseccaoVenosa = circulacao.DisseccaoVenosa,
                            DisseccaoVenosaLocal = circulacao.DisseccaoVenosaLocal,
                            Edema = circulacao.Edema,
                            EdemaLocalizar = circulacao.EdemaLocalizar,
                            Flebite = circulacao.Flebite,
                            FlebiteLocalizar = circulacao.FlebiteLocalizar,
                            Infiltracao = circulacao.Infiltracao,
                            InfiltracaoLocalizar = circulacao.InfiltracaoLocalizar,
                            P = (decimal)circulacao.P,
                            PA = (decimal)circulacao.PA,
                            RedeVenosaPulsosPalpaveis = circulacao.RedeVenosaPulsosPalpaveis,
                            RedeVenosaSemAcesso = circulacao.RedeVenosaSemAcesso,
                            RedeVenosaVisivel = circulacao.RedeVenosaVisivel,
                            SinaisFlogisticos = circulacao.SinaisFlogisticos,
                            SinaisFlogisticosQuaisLocal = circulacao.SinaisFlogisticosQuaisLocal,
                            Varizes = circulacao.Varizes
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as circulações cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<CirculacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém circulacao com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public CirculacaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(c => c.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="circulacao"></param>
        /// <param name="_tb_circulacao"></param>
        private static void Atribuir(CirculacaoModel circulacao, tb_circulacao _tb_circulacao)
        {
            _tb_circulacao.IdConsultaVariavel = circulacao.IdConsultaVariavel;
            _tb_circulacao.CateterCentral = circulacao.CateterCentral;
            _tb_circulacao.CateterCentralData = circulacao.CateterCentralData;
            _tb_circulacao.CateterCentralLocal = circulacao.CateterCentralLocal;
            _tb_circulacao.CateterData = circulacao.CateterData;
            _tb_circulacao.CateterLocal = circulacao.CateterLocal;
            _tb_circulacao.CateterPeriferico = circulacao.CateterPeriferico;
            _tb_circulacao.DissecacaoVenosaData = circulacao.DissecacaoVenosaData;
            _tb_circulacao.DisseccaoVenosa = circulacao.DisseccaoVenosa;
            _tb_circulacao.DisseccaoVenosaLocal = circulacao.DisseccaoVenosaLocal;
            _tb_circulacao.Edema = circulacao.Edema;
            _tb_circulacao.EdemaLocalizar = circulacao.EdemaLocalizar;
            _tb_circulacao.EnchimentoCapilar = circulacao.EnchimentoCapilar.ToString();
            _tb_circulacao.Flebite = circulacao.Flebite;
            _tb_circulacao.FlebiteLocalizar = circulacao.FlebiteLocalizar;
            _tb_circulacao.Infiltracao = circulacao.Infiltracao;
            _tb_circulacao.InfiltracaoLocalizar = circulacao.InfiltracaoLocalizar;
            _tb_circulacao.P = circulacao.P;
            _tb_circulacao.PA = circulacao.PA;
            _tb_circulacao.RedeVenosaPulsosPalpaveis = circulacao.RedeVenosaPulsosPalpaveis;
            _tb_circulacao.RedeVenosaSemAcesso = circulacao.RedeVenosaSemAcesso;
            _tb_circulacao.RedeVenosaVisivel = circulacao.RedeVenosaVisivel;
            _tb_circulacao.SinaisFlogisticos = circulacao.SinaisFlogisticos;
            _tb_circulacao.SinaisFlogisticosQuaisLocal = circulacao.SinaisFlogisticosQuaisLocal;
            _tb_circulacao.Varizes = circulacao.Varizes;
        }
    }
}