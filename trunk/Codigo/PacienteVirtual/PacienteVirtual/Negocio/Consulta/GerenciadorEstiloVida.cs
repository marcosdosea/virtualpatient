using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorEstiloVida
    {

        private static GerenciadorEstiloVida gEstiloVida;
        private GerenciadorEstiloVida() { }

        public static GerenciadorEstiloVida GetInstance()
        {
            if (gEstiloVida == null)
            {
                gEstiloVida = new GerenciadorEstiloVida();
            }
            return gEstiloVida;
        }

        /// <summary>
        /// Faz correção do estilo de vida da consulta de acrdo com o gabarito
        /// </summary>
        /// <param name="estiloVida"></param>
        /// <param name="estiloVidaGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(EstiloVidaModel estiloVida, EstiloVidaModel estiloVidaGabarito, ModelStateDictionary modelState)
        {
            if (estiloVida.TabacoConsumo != estiloVidaGabarito.TabacoConsumo)
            {
                modelState.AddModelError("TabacoConsumo", "Gabarito: \"" + (estiloVidaGabarito.TabacoConsumo == true ? "Sim" : "Não") + "\"");
            }
            if (estiloVida.TabacoUso != estiloVidaGabarito.TabacoUso)
            {
                modelState.AddModelError("TabacoUso", "Gabarito: " + estiloVidaGabarito.TabacoUso + "ª Opção.");
            }
            if (estiloVidaGabarito.TabacoParou == null || estiloVidaGabarito.TabacoParou.Equals(""))
            {
                if (estiloVida.TabacoParou != null && !estiloVida.TabacoParou.Equals(""))
                {
                    modelState.AddModelError("TabacoParou", "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
            }
            else
            {
                if (!Global.RemoverAcentuacao(estiloVida.TabacoParou.ToLower()).Equals(Global.RemoverAcentuacao(estiloVidaGabarito.TabacoParou.ToLower())))
                {
                    modelState.AddModelError("TabacoParou", "Gabarito: \"" + estiloVidaGabarito.TabacoParou + "\"");
                }
            }
            if (estiloVida.CafeConsumo != estiloVidaGabarito.CafeConsumo)
            {
                modelState.AddModelError("CafeConsumo", "Gabarito: \"" + (estiloVidaGabarito.CafeConsumo == true ? "Sim" : "Não") + "\"");
            }
            if (estiloVida.CafeUso != estiloVidaGabarito.CafeUso)
            {
                modelState.AddModelError("CafeUso", "Gabarito: " + estiloVidaGabarito.CafeUso + "ª Opção.");
            }

            if (estiloVidaGabarito.CafeParou == null || estiloVidaGabarito.CafeParou.Equals(""))
            {
                if (estiloVida.CafeParou != null && !estiloVida.CafeParou.Equals(""))
                {
                    modelState.AddModelError("CafeParou", "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
            }
            else
            {
                if (!Global.RemoverAcentuacao(estiloVida.CafeParou.ToLower()).Equals(Global.RemoverAcentuacao(estiloVidaGabarito.CafeParou.ToLower())))
                {
                    modelState.AddModelError("CafeParou", "Gabarito: \"" + estiloVidaGabarito.CafeParou + "\"");
                }
            }
            if (estiloVida.AlcoolConsumo != estiloVidaGabarito.AlcoolConsumo)
            {
                modelState.AddModelError("AlcoolConsumo", "Gabarito: \"" + (estiloVidaGabarito.AlcoolConsumo == true ? "Sim" : "Não") + "\"");
            }
            if (estiloVida.AlcoolUso != estiloVidaGabarito.AlcoolUso)
            {
                modelState.AddModelError("AlcoolUso", "Gabarito: " + estiloVidaGabarito.AlcoolUso + "ª Opção.");
            }
            if (estiloVidaGabarito.AlcoolParou == null || estiloVidaGabarito.AlcoolParou.Equals(""))
            {
                if (estiloVida.AlcoolParou != null && !estiloVida.AlcoolParou.Equals(""))
                {
                    modelState.AddModelError("AlcoolParou", "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
            }
            else
            {
                if (!Global.RemoverAcentuacao(estiloVida.AlcoolParou.ToLower()).Equals(Global.RemoverAcentuacao(estiloVidaGabarito.AlcoolParou.ToLower())))
                {
                    modelState.AddModelError("AlcoolParou", "Gabarito: \"" + estiloVidaGabarito.AlcoolParou + "\"");
                }
            }
            if (estiloVidaGabarito.AlcoolTipoBebida == null || estiloVidaGabarito.AlcoolTipoBebida.Equals(""))
            {
                if (estiloVida.AlcoolTipoBebida != null && !estiloVida.AlcoolTipoBebida.Equals(""))
                {
                    modelState.AddModelError("AlcoolTipoBebida", "Gabarito: \"Esse campo deve permanecer vazio\"");
                }
            }
            else
            {
                if ((estiloVida.AlcoolTipoBebida == null || estiloVida.AlcoolTipoBebida.Equals("")) || !Global.RemoverAcentuacao(estiloVida.AlcoolTipoBebida.ToLower()).Equals(Global.RemoverAcentuacao(estiloVidaGabarito.AlcoolTipoBebida.ToLower())))
                {
                    modelState.AddModelError("AlcoolTipoBebida", "Gabarito Tipo de Bebida: \"" + estiloVidaGabarito.AlcoolTipoBebida + "\"");
                }
            }
        }

        /// <summary>
        /// Insere dados do EstiloVida
        /// </summary>
        /// <param name="EstiloVida"></param>
        /// <returns></returns>
        public long Inserir(EstiloVidaModel estiloVidaModel)
        {
            var repEstiloVida = new RepositorioGenerico<tb_estilo_vida>();
            tb_estilo_vida _tb_estilo_vida = new tb_estilo_vida();
            try
            {
                Atribuir(estiloVidaModel, _tb_estilo_vida);

                repEstiloVida.Inserir(_tb_estilo_vida);
                repEstiloVida.SaveChanges();

                return _tb_estilo_vida.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("EstiloVida", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do EstiloVida
        /// </summary>
        /// <param name="EstiloVida"></param>
        public void Atualizar(EstiloVidaModel estiloVidaModel)
        {
            try
            {
                var repEstiloVida = new RepositorioGenerico<tb_estilo_vida>();
                tb_estilo_vida _tb_estilo_vida = repEstiloVida.ObterEntidade(dP => dP.IdConsultaVariavel == estiloVidaModel.IdConsultaVariavel);
                Atribuir(estiloVidaModel, _tb_estilo_vida);

                repEstiloVida.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("EstiloVida", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do EstiloVida
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repEstiloVida = new RepositorioGenerico<tb_estilo_vida>();
                repEstiloVida.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repEstiloVida.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("EstiloVida", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<EstiloVidaModel> GetQuery()
        {
            var repEstiloVida = new RepositorioGenerico<tb_estilo_vida>();
            var pvEntities = (pvEntities)repEstiloVida.ObterContexto();
            var query = from tb_estilo_vida in pvEntities.tb_estilo_vida
                        select new EstiloVidaModel
                        {
                            IdConsultaVariavel = tb_estilo_vida.IdConsultaVariavel,
                            TabacoConsumo = tb_estilo_vida.TabacoConsumo,
                            TabacoUso = tb_estilo_vida.TabacoUso,
                            TabacoParou = tb_estilo_vida.TabacoParou,
                            CafeConsumo = tb_estilo_vida.CafeConsumo,
                            CafeUso = tb_estilo_vida.CafeUso,
                            CafeParou = tb_estilo_vida.CafeParou,
                            AlcoolConsumo = tb_estilo_vida.AlcoolConsumo,
                            AlcoolUso = tb_estilo_vida.AlcoolUso,
                            AlcoolParou = tb_estilo_vida.AlcoolParou,
                            AlcoolTipoBebida = tb_estilo_vida.AlcoolTipoBebida,
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os EstiloVidaModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EstiloVidaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém EstiloVidaModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public EstiloVidaModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(EstiloVidaModel => EstiloVidaModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="estiloVidaModel"></param>
        /// <param name="_tb_estilo_vida"></param>
        private static void Atribuir(EstiloVidaModel estiloVidaModel, tb_estilo_vida _tb_estilo_vida)
        {
            _tb_estilo_vida.IdConsultaVariavel = estiloVidaModel.IdConsultaVariavel;
            _tb_estilo_vida.TabacoConsumo = estiloVidaModel.TabacoConsumo;
            _tb_estilo_vida.TabacoUso = estiloVidaModel.TabacoUso;
            _tb_estilo_vida.TabacoParou = estiloVidaModel.TabacoParou;
            _tb_estilo_vida.CafeConsumo = estiloVidaModel.CafeConsumo;
            _tb_estilo_vida.CafeUso = estiloVidaModel.CafeUso;
            _tb_estilo_vida.CafeParou = estiloVidaModel.CafeParou;
            _tb_estilo_vida.AlcoolConsumo = estiloVidaModel.AlcoolConsumo;
            _tb_estilo_vida.AlcoolUso = estiloVidaModel.AlcoolUso;
            _tb_estilo_vida.AlcoolParou = estiloVidaModel.AlcoolParou;
            _tb_estilo_vida.AlcoolTipoBebida = estiloVidaModel.AlcoolTipoBebida;

        }

    }
}