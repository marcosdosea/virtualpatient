using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPsicoEspiritual
    {
        private static GerenciadorPsicoEspiritual gPsicoEspiritual;
        private GerenciadorPsicoEspiritual() { }

        public static GerenciadorPsicoEspiritual GetInstance()
        {
            if (gPsicoEspiritual == null)
            {
                gPsicoEspiritual = new GerenciadorPsicoEspiritual();
            }
            return gPsicoEspiritual;
        }

        /// <summary>
        /// Faz correção de PsicoEspiritual de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="psico"></param>
        /// <param name="psicoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(PsicoEspiritualModel psicoEspiritual, PsicoEspiritualModel psicoEspiritualGabarito, ModelStateDictionary modelState)
        {
            if (psicoEspiritual.CrencaReligiosa == null || !psicoEspiritual.CrencaReligiosa.Equals(""))
            {
                if (psicoEspiritualGabarito.CrencaReligiosa != null && !psicoEspiritualGabarito.CrencaReligiosa.Equals(""))
                {
                    modelState.AddModelError("CrencaReligiosa", "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
            }
            else {
                if (!Global.RemoverAcentuacao(psicoEspiritual.CrencaReligiosa.ToLower()).Equals(Global.RemoverAcentuacao(psicoEspiritualGabarito.CrencaReligiosa.ToLower())))
                {
                    modelState.AddModelError("CrencaReligiosa", "Gabarito: \"" + psicoEspiritualGabarito.CrencaReligiosa + "\"");
                }
            }
            if (psicoEspiritual.BuscaAssistenciaEspiritual != psicoEspiritualGabarito.BuscaAssistenciaEspiritual)
            {
                modelState.AddModelError("BuscaAssistenciaEspiritual", "Gabarito: " + (psicoEspiritualGabarito.BuscaAssistenciaEspiritual.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.EspecificaAssistenciaEspiritual == null || psicoEspiritual.EspecificaAssistenciaEspiritual.Equals(""))
            {
                if (psicoEspiritualGabarito.EspecificaAssistenciaEspiritual != null && !psicoEspiritualGabarito.EspecificaAssistenciaEspiritual.Equals(""))
                {
                    modelState.AddModelError("EspecificaAssistenciaEspiritual", "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
            }
            else
            {
                if (!Global.RemoverAcentuacao(psicoEspiritual.EspecificaAssistenciaEspiritual.ToLower()).Equals(Global.RemoverAcentuacao(psicoEspiritualGabarito.EspecificaAssistenciaEspiritual.ToLower())))
                {
                    modelState.AddModelError("EspecificaAssistenciaEspiritual", "Gabarito: \"" + psicoEspiritualGabarito.EspecificaAssistenciaEspiritual + "\"");
                }
            }
            if (psicoEspiritual.DisturbiosSono != psicoEspiritualGabarito.DisturbiosSono)
            {
                modelState.AddModelError("DisturbiosSono", "Gabarito: " + (psicoEspiritualGabarito.DisturbiosSono.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.Ansiedade != psicoEspiritualGabarito.Ansiedade)
            {
                modelState.AddModelError("Ansiedade", "Gabarito: " + (psicoEspiritualGabarito.Ansiedade.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.BaixoAutoEstima != psicoEspiritualGabarito.BaixoAutoEstima)
            {
                modelState.AddModelError("BaixoAutoEstima", "Gabarito: " + (psicoEspiritualGabarito.BaixoAutoEstima.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.Estresse != psicoEspiritualGabarito.Estresse)
            {
                modelState.AddModelError("Estresse", "Gabarito: " + (psicoEspiritualGabarito.Estresse.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.HumorDeprimido != psicoEspiritualGabarito.HumorDeprimido)
            {
                modelState.AddModelError("HumorDeprimido", "Gabarito: " + (psicoEspiritualGabarito.HumorDeprimido.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.Choro != psicoEspiritualGabarito.Choro)
            {
                modelState.AddModelError("Choro", "Gabarito: " + (psicoEspiritualGabarito.Choro.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.Raiva != psicoEspiritualGabarito.Raiva)
            {
                modelState.AddModelError("Raiva", "Gabarito: " + (psicoEspiritualGabarito.Raiva.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.Negacao != psicoEspiritualGabarito.Negacao)
            {
                modelState.AddModelError("Negacao", "Gabarito: " + (psicoEspiritualGabarito.Negacao.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.Apatico != psicoEspiritualGabarito.Apatico)
            {
                modelState.AddModelError("Apatico", "Gabarito: " + (psicoEspiritualGabarito.Apatico.Equals(true) ? "Sim" : "Não"));
            }
            if (psicoEspiritual.PreocupacaoMorte != psicoEspiritualGabarito.PreocupacaoMorte)
            {
                modelState.AddModelError("PreocupacaoMorte", "Gabarito: " + (psicoEspiritualGabarito.PreocupacaoMorte.Equals(true) ? "Sim" : "Não"));
            }
        }

        /// <summary>
        /// Insere dados do PsicoEspiritual
        /// </summary>
        /// <param name="PsicoEspiritual"></param>
        /// <returns></returns>
        public long Inserir(PsicoEspiritualModel psicoEspiritualModel)
        {
            var repPsicoEspiritual = new RepositorioGenerico<tb_psicoespiritual>();
            tb_psicoespiritual _tb_psicoespiritual = new tb_psicoespiritual();
            try
            {
                Atribuir(psicoEspiritualModel, _tb_psicoespiritual);

                repPsicoEspiritual.Inserir(_tb_psicoespiritual);
                repPsicoEspiritual.SaveChanges();

                return _tb_psicoespiritual.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("PsicoEspiritual", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do PsicoEspiritual
        /// </summary>
        /// <param name="PsicoEspiritual"></param>
        public void Atualizar(PsicoEspiritualModel psicoEspiritualModel)
        {
            try
            {
                var repPsicoEspiritual = new RepositorioGenerico<tb_psicoespiritual>();
                tb_psicoespiritual _tb_psicoespiritual = repPsicoEspiritual.ObterEntidade(dP => dP.IdConsultaVariavel == psicoEspiritualModel.IdConsultaVariavel);
                Atribuir(psicoEspiritualModel, _tb_psicoespiritual);

                repPsicoEspiritual.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PsicoEspiritual", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do PsicoEspiritual
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repPsicoEspiritual = new RepositorioGenerico<tb_psicoespiritual>();
                repPsicoEspiritual.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repPsicoEspiritual.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("PsicoEspiritual", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PsicoEspiritualModel> GetQuery()
        {
            var repPsicoEspiritual = new RepositorioGenerico<tb_psicoespiritual>();
            var pvEntities = (pvEntities)repPsicoEspiritual.ObterContexto();
            var query = from tb_psicoespiritual in pvEntities.tb_psicoespiritual
                        select new PsicoEspiritualModel
                        {
                            IdConsultaVariavel = tb_psicoespiritual.IdConsultaVariavel,
                            Ansiedade = tb_psicoespiritual.Ansiedade,
                            Apatico = tb_psicoespiritual.Apatico,
                            BaixoAutoEstima = tb_psicoespiritual.BaixaAutoEstima,
                            BuscaAssistenciaEspiritual = tb_psicoespiritual.BuscaAssistenciaEspiritual,
                            Choro = tb_psicoespiritual.Choro,
                            CrencaReligiosa = tb_psicoespiritual.CrencaReligiosa,
                            DisturbiosSono = tb_psicoespiritual.DisturbiosSono,
                            EspecificaAssistenciaEspiritual = tb_psicoespiritual.EspecificarAssistenciaEspiritual,
                            Estresse = tb_psicoespiritual.Estresse,
                            HumorDeprimido = tb_psicoespiritual.HumorDeprimido,
                            Negacao = tb_psicoespiritual.Negacao,
                            PreocupacaoMorte = tb_psicoespiritual.PreocupacaoMorte,
                            Raiva = tb_psicoespiritual.Raiva
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os PsicoEspiritualModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PsicoEspiritualModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém PsicoEspiritualModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public PsicoEspiritualModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(PsicoEspiritualModel => PsicoEspiritualModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /*/// <summary>
        /// Faz a correção do ExameFisico de uma consulta de acordo com o gabarito 
        /// </summary>
        /// <param name="examesFisicos"></param>
        /// <param name="examesFisicosGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(PsicoEspiritualModel examesFisicos, PsicoEspiritualModel examesFisicosGabarito, ModelStateDictionary modelState)
        {
            if (examesFisicos.Altura != examesFisicosGabarito.Altura)
            {
                modelState.AddModelError("Altura", "Gabarito: " + examesFisicosGabarito.Altura + ".");
            }
            if (examesFisicos.Peso != examesFisicosGabarito.Peso)
            {
                modelState.AddModelError("Peso", "Gabarito: " + examesFisicosGabarito.Peso + ".");
            }
            if (examesFisicos.PressaoDiastolica != examesFisicosGabarito.PressaoDiastolica)
            {
                modelState.AddModelError("PressaoDiastolica", "Gabarito: " + examesFisicosGabarito.PressaoDiastolica + ".");
            }
            if (examesFisicos.PressaoSistolica != examesFisicosGabarito.PressaoSistolica)
            {
                modelState.AddModelError("PressaoSistolica", "Gabarito: " + examesFisicosGabarito.PressaoSistolica + ".");
            }
            if (examesFisicos.Glicemia != examesFisicosGabarito.Glicemia)
            {
                modelState.AddModelError("Glicemia", "Gabarito: " + examesFisicosGabarito.Glicemia + ".");
            }
            if (examesFisicos.IndiceMassaCorporea != examesFisicosGabarito.IndiceMassaCorporea)
            {
                modelState.AddModelError("IndiceMassaCorporea", "Gabarito: " + examesFisicosGabarito.IndiceMassaCorporea + ".");
            }
            if (examesFisicos.CircunferenciaAbdominal != examesFisicosGabarito.CircunferenciaAbdominal)
            {
                modelState.AddModelError("CircunferenciaAbdominal", "Gabarito: " + examesFisicosGabarito.CircunferenciaAbdominal + ".");
            }
        } */


        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="psicoEspiritualModel"></param>
        /// <param name="_tb_psicoespiritual"></param>
        private static void Atribuir(PsicoEspiritualModel psicoEspiritualModel, tb_psicoespiritual _tb_psicoespiritual)
        {
            _tb_psicoespiritual.IdConsultaVariavel = psicoEspiritualModel.IdConsultaVariavel;
            _tb_psicoespiritual.Ansiedade = psicoEspiritualModel.Ansiedade;
            _tb_psicoespiritual.Apatico = psicoEspiritualModel.Apatico;
            _tb_psicoespiritual.BaixaAutoEstima = psicoEspiritualModel.BaixoAutoEstima;
            _tb_psicoespiritual.BuscaAssistenciaEspiritual = psicoEspiritualModel.BuscaAssistenciaEspiritual;
            _tb_psicoespiritual.Choro = psicoEspiritualModel.Choro;
            _tb_psicoespiritual.CrencaReligiosa = psicoEspiritualModel.CrencaReligiosa;
            _tb_psicoespiritual.DisturbiosSono = psicoEspiritualModel.DisturbiosSono;
            _tb_psicoespiritual.EspecificarAssistenciaEspiritual = psicoEspiritualModel.EspecificaAssistenciaEspiritual;
            _tb_psicoespiritual.Estresse = psicoEspiritualModel.Estresse;
            _tb_psicoespiritual.HumorDeprimido = psicoEspiritualModel.HumorDeprimido;
            _tb_psicoespiritual.Negacao = psicoEspiritualModel.Negacao;
            _tb_psicoespiritual.PreocupacaoMorte = psicoEspiritualModel.PreocupacaoMorte;
            _tb_psicoespiritual.Raiva = psicoEspiritualModel.Raiva;
        }
    }
}