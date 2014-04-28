using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorHigiene
    {
        private static GerenciadorHigiene gHigiene;
        private GerenciadorHigiene() { }

        public static GerenciadorHigiene GetInstance()
        {
            if (gHigiene == null)
            {
                gHigiene = new GerenciadorHigiene();
            }
            return gHigiene;
        }

        /// <summary>
        /// Insere dados do Higiene
        /// </summary>
        /// <param name="Higiene"></param>
        /// <returns></returns>
        public long Inserir(HigieneModel higieneModel)
        {
            var repHigiene = new RepositorioGenerico<tb_higiene>();
            tb_higiene _tb_higiene = new tb_higiene();
            try
            {
                Atribuir(higieneModel, _tb_higiene);

                repHigiene.Inserir(_tb_higiene);
                repHigiene.SaveChanges();

                return _tb_higiene.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Higiene", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do Higiene
        /// </summary>
        /// <param name="Higiene"></param>
        public void Atualizar(HigieneModel higieneModel)
        {
            try
            {
                var repHigiene = new RepositorioGenerico<tb_higiene>();
                tb_higiene _tb_higiene = repHigiene.ObterEntidade(dP => dP.IdConsultaVariavel == higieneModel.IdConsultaVariavel);
                Atribuir(higieneModel, _tb_higiene);

                repHigiene.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Higiene", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do Higiene
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repHigiene = new RepositorioGenerico<tb_higiene>();
                repHigiene.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repHigiene.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Higiene", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<HigieneModel> GetQuery()
        {
            var repHigiene = new RepositorioGenerico<tb_higiene>();
            var pvEntities = (pvEntities)repHigiene.ObterContexto();
            var query = from tb_higiene in pvEntities.tb_higiene
                        select new HigieneModel
                        {
                            IdConsultaVariavel = tb_higiene.IdConsultaVariavel,
                            CabelosAlopecia = tb_higiene.CabelosAlopecia,
                            CabelosPediculose = tb_higiene.CabelosPediculose,
                            CabelosQuebradicos = tb_higiene.CabelosQuebradicos,
                            CabelosSeborreia = tb_higiene.CabelosSeborreia,
                            NecessitaBanhoLeito = tb_higiene.NecessitaBanhoLeito,
                            NecessitaHigieneIntima = tb_higiene.NecessitaHigieneIntima,
                            Satisfatoria = tb_higiene.Satisfatoria,
                            OralCarie = tb_higiene.OralCarie,
                            OralHalitose = tb_higiene.OralHalitose,
                            OralLinguaSaburrosa = tb_higiene.OralLinguaSaburrosa,
                            OralRessecamento = tb_higiene.OralRessecamento,
                            OralUlceracao = tb_higiene.OralUlceracao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os HigieneModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<HigieneModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém HigieneModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public HigieneModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(HigieneModel => HigieneModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /*/// <summary>
        /// Faz a correção do ExameFisico de uma consulta de acordo com o gabarito 
        /// </summary>
        /// <param name="examesFisicos"></param>
        /// <param name="examesFisicosGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(HigieneModel examesFisicos, HigieneModel examesFisicosGabarito, ModelStateDictionary modelState)
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
        /// <param name="higieneModel"></param>
        /// <param name="_tb_higiene"></param>
        private static void Atribuir(HigieneModel higieneModel, tb_higiene _tb_higiene)
        {
            _tb_higiene.IdConsultaVariavel = higieneModel.IdConsultaVariavel;
            _tb_higiene.Satisfatoria = higieneModel.Satisfatoria;
            _tb_higiene.NecessitaHigieneIntima = higieneModel.NecessitaHigieneIntima;
            _tb_higiene.NecessitaBanhoLeito = higieneModel.NecessitaBanhoLeito;
            _tb_higiene.CabelosAlopecia = higieneModel.CabelosAlopecia;
            _tb_higiene.CabelosPediculose = higieneModel.CabelosPediculose;
            _tb_higiene.CabelosQuebradicos = higieneModel.CabelosQuebradicos;
            _tb_higiene.CabelosSeborreia = higieneModel.CabelosSeborreia;
            _tb_higiene.OralCarie = higieneModel.OralCarie;
            _tb_higiene.OralHalitose = higieneModel.OralHalitose;
            _tb_higiene.OralLinguaSaburrosa = higieneModel.OralLinguaSaburrosa;
            _tb_higiene.OralRessecamento = higieneModel.OralRessecamento;
            _tb_higiene.OralUlceracao = higieneModel.OralUlceracao;
        }
    }
}