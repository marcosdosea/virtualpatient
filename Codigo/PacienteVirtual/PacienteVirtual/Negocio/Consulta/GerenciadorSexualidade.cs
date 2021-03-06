﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorSexualidade
    {
        private static GerenciadorSexualidade gSexualidade;

        private GerenciadorSexualidade() { }

        public static GerenciadorSexualidade GetInstance()
        {
            if (gSexualidade == null)
            {
                gSexualidade = new GerenciadorSexualidade();
            }
            return gSexualidade;
        }

        /// <summary>
        /// Faz correção de Sexualidade de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(SexualidadeModel sexualidade, SexualidadeModel sexualidadeGabarito, ModelStateDictionary modelState)
        {
            if (sexualidade.ParceiroFixo != sexualidadeGabarito.ParceiroFixo)
            {
                modelState.AddModelError("ParceiroFixo", "Gabarito: " + (sexualidadeGabarito.ParceiroFixo.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.ConflitoPreferenciaSexual != sexualidadeGabarito.ConflitoPreferenciaSexual)
            {
                modelState.AddModelError("ConflitoPreferenciaSexual", "Gabarito: " + (sexualidadeGabarito.ConflitoPreferenciaSexual.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.DorRelacaoSexual != sexualidadeGabarito.DorRelacaoSexual)
            {
                modelState.AddModelError("DorRelacaoSexual", "Gabarito: " + (sexualidadeGabarito.DorRelacaoSexual.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.Secrecao != sexualidadeGabarito.Secrecao)
            {
                modelState.AddModelError("Secrecao", "Gabarito: " + (sexualidadeGabarito.Secrecao.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.Prurido != sexualidadeGabarito.Prurido)
            {
                modelState.AddModelError("Prurido", "Gabarito: " + (sexualidadeGabarito.Prurido.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.OdorFetido != sexualidadeGabarito.OdorFetido)
            {
                modelState.AddModelError("OdorFetido", "Gabarito: " + (sexualidadeGabarito.OdorFetido.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.Edema != sexualidadeGabarito.Edema)
            {
                modelState.AddModelError("Edema", "Gabarito: " + (sexualidadeGabarito.Edema.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.Lesao != sexualidadeGabarito.Lesao)
            {
                modelState.AddModelError("Lesao", "Gabarito: " + (sexualidadeGabarito.Lesao.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.Sangramento != sexualidadeGabarito.Sangramento)
            {
                modelState.AddModelError("Sangramento", "Gabarito: " + (sexualidadeGabarito.Sangramento.Equals(true) ? "Sim" : "Não"));
            }
            if (sexualidade.Hiperemia != sexualidadeGabarito.Hiperemia)
            {
                modelState.AddModelError("Hiperemia", "Gabarito: " + (sexualidadeGabarito.Hiperemia.Equals(true) ? "Sim" : "Não"));
            }
        }

        /// <summary>
        /// Insere dados da Sexualidade
        /// </summary>
        /// <param name="sexualidade"></param>
        /// <returns></returns>
        public long Inserir(SexualidadeModel sexualidade)
        {
            var repSexualidade = new RepositorioGenerico<tb_sexualidade>();
            tb_sexualidade _tb_sexualidade = new tb_sexualidade();
            try
            {
                Atribuir(sexualidade, _tb_sexualidade);

                repSexualidade.Inserir(_tb_sexualidade);
                repSexualidade.SaveChanges();

                return _tb_sexualidade.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Sexualidade", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do sexualidade
        /// </summary>
        /// <param name="sexualidade"></param>
        public void Atualizar(SexualidadeModel sexualidade)
        {
            try
            {
                var repSexualidade = new RepositorioGenerico<tb_sexualidade>();
                tb_sexualidade _tb_sexualidade = repSexualidade.ObterEntidade(s => s.IdConsultaVariavel == sexualidade.IdConsultaVariavel);
                Atribuir(sexualidade, _tb_sexualidade);

                repSexualidade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Sexualidade", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do sexualidade especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repSexualidade = new RepositorioGenerico<tb_sexualidade>();
                repSexualidade.Remover(s => s.IdConsultaVariavel == idConsultaVariavel);
                repSexualidade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Sexualidade", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<SexualidadeModel> GetQuery()
        {
            var repSexualidade = new RepositorioGenerico<tb_sexualidade>();
            var pvEntities = (pvEntities)repSexualidade.ObterContexto();
            var query = from sexualidade in pvEntities.tb_sexualidade
                        select new SexualidadeModel
                        {
                            IdConsultaVariavel = sexualidade.IdConsultaVariavel,
                            ConflitoPreferenciaSexual = (sexualidade.ConflitoPreferenciaSexual == "Sim" ? ListaConflitoPreferenciaSexual.Sim : (sexualidade.ConflitoPreferenciaSexual == "Nao" ? ListaConflitoPreferenciaSexual.Nao : ListaConflitoPreferenciaSexual.NaoRelatou)),
                            DorRelacaoSexual = (sexualidade.DorRelacaoSexual == "Sim" ? ListaDorRelaxaoSexual.Sim : (sexualidade.DorRelacaoSexual == "Nao" ? ListaDorRelaxaoSexual.Nao : ListaDorRelaxaoSexual.NaoRelatou)),
                            Edema = sexualidade.Edema,
                            Hiperemia = sexualidade.Hiperemia,
                            Lesao = sexualidade.Lesao,
                            OdorFetido = sexualidade.OdorFetido,
                            ParceiroFixo = (sexualidade.ParceiroFixo == "Sim" ? ListaParceiroFixo.Sim : (sexualidade.ParceiroFixo == "Nao" ? ListaParceiroFixo.Nao : ListaParceiroFixo.NaoRelatou)),
                            Prurido = sexualidade.Prurido,
                            Sangramento = sexualidade.Sangramento,
                            Secrecao = sexualidade.Secrecao,
                            SemAlteracao = sexualidade.SemAlteracoes
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as sexualidades cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SexualidadeModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém sexualidade com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public SexualidadeModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(s => s.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="sexualidade"></param>
        /// <param name="_tb_sexualidade"></param>
        private static void Atribuir(SexualidadeModel sexualidade, tb_sexualidade _tb_sexualidade)
        {
            _tb_sexualidade.IdConsultaVariavel = sexualidade.IdConsultaVariavel;
            _tb_sexualidade.ConflitoPreferenciaSexual = sexualidade.ConflitoPreferenciaSexual.ToString();
            _tb_sexualidade.DorRelacaoSexual = sexualidade.DorRelacaoSexual.ToString();
            _tb_sexualidade.Edema = sexualidade.Edema;
            _tb_sexualidade.Hiperemia = sexualidade.Hiperemia;
            _tb_sexualidade.Lesao = sexualidade.Lesao;
            _tb_sexualidade.OdorFetido = sexualidade.OdorFetido;
            _tb_sexualidade.ParceiroFixo = sexualidade.ParceiroFixo.ToString();
            _tb_sexualidade.Prurido = sexualidade.Prurido;
            _tb_sexualidade.Sangramento = sexualidade.Sangramento;
            _tb_sexualidade.Secrecao = sexualidade.Secrecao;
            _tb_sexualidade.SemAlteracoes = sexualidade.SemAlteracao;
        }
    }
}