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
            if (eliminacao.EvacuacoesDia != eliminacaoGabarito.EvacuacoesDia)
            {
                modelState.AddModelError("EvacuacoesDia", "Gabarito: \"" + eliminacaoGabarito.EvacuacoesDia + "\"");
            }
            if (eliminacao.UltimaEvacuacao != eliminacaoGabarito.UltimaEvacuacao)
            {
                modelState.AddModelError("UltimaEvacuacao", "Gabarito: \"" + eliminacaoGabarito.UltimaEvacuacao + "\"");
            }
            if (eliminacao.EsforcoEvacuar != eliminacaoGabarito.EsforcoEvacuar)
            {
                modelState.AddModelError("EsforcoEvacuar", "Gabarito: " + (eliminacaoGabarito.EsforcoEvacuar.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.TiposFezes != eliminacaoGabarito.TiposFezes)
            {
                modelState.AddModelError("TiposFezes", "Gabarito: \"" + eliminacaoGabarito.TiposFezes + "\"");
            }
            if (eliminacao.IncontinenciaFecal != eliminacaoGabarito.IncontinenciaFecal)
            {
                modelState.AddModelError("IncontinenciaFecal", "Gabarito: " + (eliminacaoGabarito.IncontinenciaFecal.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.Flatos != eliminacaoGabarito.Flatos)
            {
                modelState.AddModelError("Flatos", "Gabarito: " + (eliminacaoGabarito.Flatos.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.SangramentoRetal != eliminacaoGabarito.SangramentoRetal)
            {
                modelState.AddModelError("SangramentoRetal", "Gabarito: " + (eliminacaoGabarito.SangramentoRetal.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.Hemorroidas != eliminacaoGabarito.Hemorroidas)
            {
                modelState.AddModelError("Hemorroidas", "Gabarito: " + (eliminacaoGabarito.Hemorroidas.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.PruridoAnal != eliminacaoGabarito.PruridoAnal)
            {
                modelState.AddModelError("PruridoAnal", "Gabarito: " + (eliminacaoGabarito.PruridoAnal.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.FormasAbdomem != eliminacaoGabarito.FormasAbdomem)
            {
                modelState.AddModelError("FormasAbdomem", "Gabarito: \"" + eliminacaoGabarito.FormasAbdomem + "\"");
            }
            if (eliminacao.SonsIntestinais != eliminacaoGabarito.SonsIntestinais)
            {
                modelState.AddModelError("SonsIntestinais", "Gabarito: \"" + eliminacaoGabarito.SonsIntestinais + "\"");
            }
            if (eliminacao.TipoSonsPercussao != eliminacaoGabarito.TipoSonsPercussao)
            {
                modelState.AddModelError("TipoSonsPercussao", "Gabarito: \"" + eliminacaoGabarito.TipoSonsPercussao + "\"");
            }
            if (eliminacao.PalpacaoAbodminal != eliminacaoGabarito.PalpacaoAbodminal)
            {
                modelState.AddModelError("PalpacaoAbodminal", "Gabarito: \"" + eliminacaoGabarito.PalpacaoAbodminal + "\"");
            }
            if (eliminacao.ColoracaoUrinaria != eliminacaoGabarito.ColoracaoUrinaria)
            {
                modelState.AddModelError("ColoracaoUrinaria", "Gabarito: \"" + eliminacaoGabarito.ColoracaoUrinaria + "\"");
            }
            if (eliminacao.DebitoUrinario != eliminacaoGabarito.DebitoUrinario)
            {
                modelState.AddModelError("DebitoUrinario", "Gabarito: \"" + eliminacaoGabarito.DebitoUrinario + "\"");
            }
            if (eliminacao.Disuria != eliminacaoGabarito.Disuria)
            {
                modelState.AddModelError("Disuria", "Gabarito: " + (eliminacaoGabarito.Disuria.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("Tempo", eliminacao.Tempo, eliminacaoGabarito.Tempo, modelState);
            if (eliminacao.CondicaoContinenciaUrinaria != eliminacaoGabarito.CondicaoContinenciaUrinaria)
            {
                modelState.AddModelError("CondicaoContinenciaUrinaria", "Gabarito: \"" + eliminacaoGabarito.CondicaoContinenciaUrinaria + "\"");
            }
            if (eliminacao.SVD != eliminacaoGabarito.SVD)
            {
                modelState.AddModelError("SVD", "Gabarito: " + (eliminacaoGabarito.SVD.Equals(true) ? "Sim" : "Não"));
            }
            if (eliminacao.SVDInstalada != eliminacaoGabarito.SVDInstalada)
            {
                modelState.AddModelError("SVDInstalada", "Gabarito: \"" + eliminacaoGabarito.SVDInstalada + "\"");
            }
            if (eliminacao.Cistostomia != eliminacaoGabarito.Cistostomia)
            {
                modelState.AddModelError("Cistostomia", "Gabarito: " + (eliminacaoGabarito.Cistostomia.Equals(true) ? "Sim" : "Não"));
            }
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
                            TiposFezes = (eliminacao.TiposFezes == "FezesFormadas" ? ListaTiposFezes.FezesFormadas : (eliminacao.TiposFezes == "FezesPastosas") ? ListaTiposFezes.FezesPastosas : (eliminacao.TiposFezes == "Melena") ? ListaTiposFezes.Melena : (eliminacao.TiposFezes == "Diarreia") ? ListaTiposFezes.Diarreia : ListaTiposFezes.Constipacao),
                            IncontinenciaFecal = eliminacao.IncontinenciaFecal,
                            Flatos = eliminacao.Flatos,
                            SangramentoRetal = eliminacao.SangramentoRetal,
                            Hemorroidas = eliminacao.Hemorroidas,
                            PruridoAnal = eliminacao.PruridoAnal,
                            EstomasCirurgicos = (eliminacao.EstomasCirurgicos == "NaoSeAplica" ? ListaEstomasCirurgicos.NaoSeAplica : (eliminacao.EstomasCirurgicos == "Colostomia" ? ListaEstomasCirurgicos.Colostomia : ListaEstomasCirurgicos.Ileostomia)),
                            FormasAbdomem = (eliminacao.FormasAbdomem == "Plano" ? ListaFormasAbdomem.Plano : (eliminacao.FormasAbdomem == "Retraido" ? ListaFormasAbdomem.Retraido : ListaFormasAbdomem.Globoso )),
                            SonsIntestinais = (eliminacao.SonsIntestinais == "Presentes" ? ListaSonsIntestinais.Presentes : (eliminacao.SonsIntestinais == "Ausentes" ? ListaSonsIntestinais.Ausentes : (eliminacao.SonsIntestinais == "Diminuidos" ? ListaSonsIntestinais.Diminuidos : ListaSonsIntestinais.Hiperativos))),
                            TipoSonsPercussao = (eliminacao.TipoSonsPercussao == "SomMacico" ? ListaTipoSonsPercussao.SomMacico : ListaTipoSonsPercussao.SomTimpanico),
                            PalpacaoAbodminal = (eliminacao.PalpacaoAbodminal == "Normotenso" ? ListaPalpacaoAbodminal.Normotenso : (eliminacao.PalpacaoAbodminal == "Tenso" ? ListaPalpacaoAbodminal.Tenso : (eliminacao.PalpacaoAbodminal == "Flacido" ? ListaPalpacaoAbodminal.Flacido : (eliminacao.PalpacaoAbodminal == "SinalMurphy" ? ListaPalpacaoAbodminal.SinalMurphy : ListaPalpacaoAbodminal.SinalBlumberg)))),
                            ColoracaoUrinaria = (eliminacao.ColoracaoUrinaria == "LimpidaClara" ? ListaColoracaoUrinaria.LimpidaClara : (eliminacao.ColoracaoUrinaria == "Concentrada" ? ListaColoracaoUrinaria.Concentrada : (eliminacao.ColoracaoUrinaria == "PresencaSedimentos" ? ListaColoracaoUrinaria.PresencaSendimentos : (eliminacao.ColoracaoUrinaria == "Hematurica" ? ListaColoracaoUrinaria.Hematurica : (eliminacao.ColoracaoUrinaria == "Piurica" ? ListaColoracaoUrinaria.Piurica : ListaColoracaoUrinaria.Colurica))))),
                            Disuria = eliminacao.Disuria,
                            DebitoUrinario = (eliminacao.DebitoUrinario == "NaoSeAplica" ? ListaDebitoUrinario.NaoSeAplica : (eliminacao.DebitoUrinario == "Normal" ? ListaDebitoUrinario.Normal : (eliminacao.DebitoUrinario == "Oliguria" ? ListaDebitoUrinario.Oliguria : (eliminacao.DebitoUrinario == "Poliuria" ? ListaDebitoUrinario.Poliuria : (eliminacao.DebitoUrinario == "Anuria" ? ListaDebitoUrinario.Anuria : ListaDebitoUrinario.Polaciuria))))),
                            Tempo = eliminacao.Tempo,
                            CondicaoContinenciaUrinaria = (eliminacao.CondicaoContinenciaUrinaria == "IncontinenciaUrinaria" ? ListaCondicaoContinenciaUrinaria.IncontinenciaUrinaria : (eliminacao.CondicaoContinenciaUrinaria == "RetencaoUrinaria" ? ListaCondicaoContinenciaUrinaria.RetencaoUrinaria : ListaCondicaoContinenciaUrinaria.IrrigacaoVesical)),
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
            _eliminacaoE.TiposFezes = eliminacao.TiposFezes.ToString();
            _eliminacaoE.IncontinenciaFecal = eliminacao.IncontinenciaFecal;
            _eliminacaoE.Flatos = eliminacao.Flatos;
            _eliminacaoE.SangramentoRetal = eliminacao.SangramentoRetal;
            _eliminacaoE.Hemorroidas = eliminacao.Hemorroidas;
            _eliminacaoE.PruridoAnal = eliminacao.PruridoAnal;
            _eliminacaoE.EstomasCirurgicos = eliminacao.EstomasCirurgicos.ToString();
            _eliminacaoE.FormasAbdomem = eliminacao.FormasAbdomem.ToString();
            _eliminacaoE.SonsIntestinais = eliminacao.SonsIntestinais.ToString();
            _eliminacaoE.TipoSonsPercussao = eliminacao.TipoSonsPercussao.ToString();
            _eliminacaoE.PalpacaoAbodminal = eliminacao.PalpacaoAbodminal.ToString();
            _eliminacaoE.ColoracaoUrinaria = eliminacao.ColoracaoUrinaria.ToString();
            _eliminacaoE.Disuria = eliminacao.Disuria;
            _eliminacaoE.DebitoUrinario = eliminacao.DebitoUrinario.ToString();
            _eliminacaoE.Tempo = eliminacao.Tempo;
            _eliminacaoE.CondicaoContinenciaUrinaria = eliminacao.CondicaoContinenciaUrinaria.ToString();
            _eliminacaoE.SVD = eliminacao.SVD;
            _eliminacaoE.SVDInstalada = (DateTime)eliminacao.SVDInstalada;
            _eliminacaoE.Cistostomia = eliminacao.Cistostomia;
        }
    }
}