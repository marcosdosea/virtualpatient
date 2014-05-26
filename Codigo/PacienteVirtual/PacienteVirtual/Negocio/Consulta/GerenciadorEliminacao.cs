using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using System.Web.Mvc;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorEliminacao
    { 
        private static GerenciadorEliminacao gEliminacao;
        private GerenciadorEliminacao() { }

        public static GerenciadorEliminacao GetInstance()
        {
            if (gEliminacao == null)
            {
                gEliminacao = new GerenciadorEliminacao();
            }
            return gEliminacao;
        }

        /// <summary>
        /// Faz correção de Eliminacao de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="Eliminacao"></param>
        /// <param name="EliminacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(EliminacaoModel eliminacao, EliminacaoModel eliminacaoGabarito, ModelStateDictionary modelState)
        {
        }

        /// <summary>
        /// Insere dados do Eliminacao
        /// </summary>
        /// <param name="Eliminacao"></param>
        /// <returns></returns>
        public long Inserir(EliminacaoModel EliminacaoModel)
        {
            var repEliminacao = new RepositorioGenerico<tb_eliminacao>();
            tb_eliminacao _tb_eliminacao = new tb_eliminacao();
            try
            {
                Atribuir(EliminacaoModel, _tb_eliminacao);

                repEliminacao.Inserir(_tb_eliminacao);
                repEliminacao.SaveChanges();

                return _tb_eliminacao.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Eliminacao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do Eliminacao
        /// </summary>
        /// <param name="Eliminacao"></param>
        public void Atualizar(EliminacaoModel EliminacaoModel)
        {
            try
            {
                var repEliminacao = new RepositorioGenerico<tb_eliminacao>();
                tb_eliminacao _tb_eliminacao = repEliminacao.ObterEntidade(dP => dP.IdConsultaVariavel == EliminacaoModel.IdConsultaVariavel);
                Atribuir(EliminacaoModel, _tb_eliminacao);

                repEliminacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Eliminacao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do Eliminacao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repEliminacao = new RepositorioGenerico<tb_eliminacao>();
                repEliminacao.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repEliminacao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Eliminacao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<EliminacaoModel> GetQuery()
        {
            var repEliminacao = new RepositorioGenerico<tb_eliminacao>();
            var pvEntities = (pvEntities)repEliminacao.ObterContexto();
            var query = from eliminacao in pvEntities.tb_eliminacao
                        select new EliminacaoModel
                        {
                            IdConsultaVariavel = eliminacao.IdConsultaVariavel,
                            UltimaEvacuacao = eliminacao.UltimaEvacuacao,
                            EvacuacoesDia = eliminacao.EvacuacoesDia,
                            EsforcoEvacuar = eliminacao.EsforcoEvacuar,
                            IncontinenciaFecal = eliminacao.IncontinenciaFecal,
                            Flatos =eliminacao.Flatos,
                            SangramentoRetal = eliminacao.SangramentoRetal,
                            PruridoAnal = eliminacao.PruridoAnal,
                            EstomasCirurgicos = (eliminacao.EstomasCirurgicos == "NaoSeAplica" ? ListaEstomasCirurgicos.NaoSeAplica : (eliminacao.EstomasCirurgicos == "Colostomia" ? ListaEstomasCirurgicos.Colostomia : ListaEstomasCirurgicos.Ileostomia)),
                            FormasAbdomem = (eliminacao.FormasAbdomem == "Plano" ? ListaFormasAbdomem.Plano : (eliminacao.FormasAbdomem == "Retraido" ? ListaFormasAbdomem.Retraido : ListaFormasAbdomem.Globoso )),
                            SonsIntestinais = (eliminacao.SonsIntestinais == "Presentes" ? ListaSonsIntestinais.Presentes : (eliminacao.SonsIntestinais == "Ausentes" ? ListaSonsIntestinais.Ausentes : (eliminacao.SonsIntestinais == "Diminuidos" ? ListaSonsIntestinais.Diminuidos : ListaSonsIntestinais.Hiperativos))),
                            TipoSonsPercussao = (eliminacao.TipoSonsPercussao == "SomMacico" ? ListaTipoSonsPercussao.SomMacico : ListaTipoSonsPercussao.SomTimpanico),
                            LocalizarPercussaoAbdominal = eliminacao.LocalizarPercussaoAbdominal,
                            PalpacaoAbodminal = (eliminacao.PalpacaoAbodminal == "Normotenso" ? ListaPalpacaoAbodminal.Normotenso : (eliminacao.PalpacaoAbodminal == "Tenso" ? ListaPalpacaoAbodminal.Tenso : (eliminacao.PalpacaoAbodminal == "Flacido" ? ListaPalpacaoAbodminal.Flacido : (eliminacao.PalpacaoAbodminal == "SinalMurphy" ? ListaPalpacaoAbodminal.SinalMurphy : ListaPalpacaoAbodminal.SinalBlumberg)))),
                            ColoracaoUrinaria = (eliminacao.ColoracaoUrinaria == "LimpidaClara" ? ListaColoracaoUrinaria.LimpidaClara : (eliminacao.ColoracaoUrinaria == "Concentrada" ? ListaColoracaoUrinaria.Concentrada : (eliminacao.ColoracaoUrinaria == "PresencaSedimentos" ? ListaColoracaoUrinaria.PresencaSendimentos : (eliminacao.ColoracaoUrinaria == "Hematurica" ? ListaColoracaoUrinaria.Hematurica : (eliminacao.ColoracaoUrinaria == "Piurica" ? ListaColoracaoUrinaria.Piurica : ListaColoracaoUrinaria.Colurica))))),
                            Disuria = eliminacao.Disuria,
                            DebitoUrinario = (eliminacao.DebitoUrinario == "NaoSeAplica" ? ListaDebitoUrinario.NaoSeAplica : (eliminacao.DebitoUrinario == "Oliguria" ? ListaDebitoUrinario.Oliguria : (eliminacao.DebitoUrinario == "Poliuria" ? ListaDebitoUrinario.Poliuria : (eliminacao.DebitoUrinario == "Anuria" ? ListaDebitoUrinario.Anuria : ListaDebitoUrinario.Polaciuria)))),
                            Tempo = eliminacao.Tempo,
                            CondicaoContinenciaUrinaria = (eliminacao.CondicaoContinenciaUrinaria == "IncontinenciaUrinaria" ? ListaCondicaoContinenciaUrinaria.IncontinenciaUrinaria : (eliminacao.CondicaoContinenciaUrinaria == "RetencaoUrinaria" ? ListaCondicaoContinenciaUrinaria.RetencaoUrinaria : ListaCondicaoContinenciaUrinaria.IrrigacaoVesical)),
                            IrrigacaoVesical = eliminacao.IrrigacaoVesicalCom,
                            IrrigacaoVesicalDesde = (DateTime)eliminacao.IrrigacaoVesicalDesde,
                            SVD = eliminacao.SVD,
                            SVDInstalada = (DateTime)eliminacao.SVDInstalada,
                            Cistostomia = eliminacao.Cistostomia
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os EliminacaoModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EliminacaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém EliminacaoModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public EliminacaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(EliminacaoModel => EliminacaoModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }


        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="EliminacaoModel"></param>
        /// <param name="_tb_eliminacao"></param>
        private static void Atribuir(EliminacaoModel eliminacao, tb_eliminacao _eliminacaoE)
        {
            _eliminacaoE.IdConsultaVariavel = eliminacao.IdConsultaVariavel;
            _eliminacaoE.UltimaEvacuacao = eliminacao.UltimaEvacuacao;
            _eliminacaoE.EvacuacoesDia = eliminacao.EvacuacoesDia;
            _eliminacaoE.EsforcoEvacuar = eliminacao.EsforcoEvacuar;
            _eliminacaoE.IncontinenciaFecal = eliminacao.IncontinenciaFecal;
            _eliminacaoE.Flatos = eliminacao.Flatos;
            _eliminacaoE.SangramentoRetal = eliminacao.SangramentoRetal;
            _eliminacaoE.PruridoAnal = eliminacao.PruridoAnal;
            _eliminacaoE.EstomasCirurgicos = eliminacao.EstomasCirurgicos.ToString();
            _eliminacaoE.FormasAbdomem = eliminacao.FormasAbdomem.ToString();
            _eliminacaoE.SonsIntestinais = eliminacao.SonsIntestinais.ToString();
            _eliminacaoE.TipoSonsPercussao = eliminacao.TipoSonsPercussao.ToString();
            _eliminacaoE.LocalizarPercussaoAbdominal = eliminacao.LocalizarPercussaoAbdominal;
            _eliminacaoE.PalpacaoAbodminal = eliminacao.PalpacaoAbodminal.ToString();
            _eliminacaoE.ColoracaoUrinaria = eliminacao.ColoracaoUrinaria.ToString();
            _eliminacaoE.Disuria = eliminacao.Disuria;
            _eliminacaoE.DebitoUrinario = eliminacao.DebitoUrinario.ToString();
            _eliminacaoE.Tempo = eliminacao.Tempo;
            _eliminacaoE.CondicaoContinenciaUrinaria = eliminacao.CondicaoContinenciaUrinaria.ToString();
            _eliminacaoE.IrrigacaoVesicalCom = eliminacao.IrrigacaoVesical;
            _eliminacaoE.IrrigacaoVesicalDesde = (DateTime)eliminacao.IrrigacaoVesicalDesde;
            _eliminacaoE.SVD = eliminacao.SVD;
            _eliminacaoE.SVDInstalada = (DateTime)eliminacao.SVDInstalada;
            _eliminacaoE.Cistostomia = eliminacao.Cistostomia;
        }
    }
}