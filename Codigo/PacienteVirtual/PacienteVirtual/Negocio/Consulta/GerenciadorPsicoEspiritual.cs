using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

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