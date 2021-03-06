﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorSensorial
    {
        private static GerenciadorSensorial gSensorial;

        private GerenciadorSensorial() { }

        public static GerenciadorSensorial GetInstance()
        {
            if (gSensorial == null)
            {
                gSensorial = new GerenciadorSensorial();
            }
            return gSensorial;
        }

        /// <summary>
        /// Faz correção de Sensorial de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(SensorialModel sensorial, SensorialModel sensorialGabarito, ModelStateDictionary modelState)
        {
            if (sensorial.EstadoMental != sensorialGabarito.EstadoMental)
            {
                modelState.AddModelError("EstadoMental", "Gabarito: \""+ sensorialGabarito.EstadoMental +"\"");
            }
            if (sensorial.Palpebral != sensorialGabarito.Palpebral)
            {
                modelState.AddModelError("Palpebral", "Gabarito: " + (sensorialGabarito.Palpebral.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Pupilar != sensorialGabarito.Pupilar)
            {
                modelState.AddModelError("Pupilar", "Gabarito: " + (sensorialGabarito.Pupilar.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Plantar != sensorialGabarito.Plantar)
            {
                modelState.AddModelError("Plantar", "Gabarito: " + (sensorialGabarito.Plantar.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.SinalBabinski != sensorialGabarito.SinalBabinski)
            {
                modelState.AddModelError("SinalBabinski", "Gabarito: " + (sensorialGabarito.SinalBabinski.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Dor != sensorialGabarito.Dor)
            {
                modelState.AddModelError("SemDor", "Gabarito: " + (sensorialGabarito.Dor.Equals("C") ? "Com Dor" : "Sem Dor"));
            }
            if (sensorial.DorIntensidadeValor != sensorialGabarito.DorIntensidadeValor)
            {
                modelState.AddModelError("DorIntensidadeValor", "Gabarito: \"" + sensorialGabarito.DorIntensidadeValor +"\"");
            }
            if (sensorial.Inquietacao != sensorialGabarito.Inquietacao)
            {
                modelState.AddModelError("Inquietacao", "Gabarito: " + (sensorialGabarito.Inquietacao.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.ExpressaoFacial != sensorialGabarito.ExpressaoFacial)
            {
                modelState.AddModelError("ExpressaoFacial", "Gabarito: " + (sensorialGabarito.ExpressaoFacial.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Defensividade != sensorialGabarito.Defensividade)
            {
                modelState.AddModelError("Defensividade", "Gabarito: " + (sensorialGabarito.Defensividade.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.PA != sensorialGabarito.PA)
            {
                modelState.AddModelError("PA", "Gabarito: " + (sensorialGabarito.PA.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Pulso != sensorialGabarito.Pulso)
            {
                modelState.AddModelError("Pulso", "Gabarito: " + (sensorialGabarito.Pulso.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Respiracao != sensorialGabarito.Respiracao)
            {
                modelState.AddModelError("Respiracao", "Gabarito: " + (sensorialGabarito.Respiracao.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("LocalizacaoDor", sensorial.LocalizacaoDor, sensorialGabarito.LocalizacaoDor, modelState);
            Global.CorrecaoDeStrings("DuracaoDor", sensorial.DuracaoDor, sensorialGabarito.DuracaoDor, modelState);
            Global.CorrecaoDeStrings("DescricaoDor", sensorial.DescricaoDor, sensorialGabarito.DescricaoDor, modelState);
            Global.CorrecaoDeStrings("FatoresAgravantesDor", sensorial.FatoresAgravantesDor, sensorialGabarito.FatoresAgravantesDor, modelState);
            Global.CorrecaoDeStrings("FatoresAliviantesDor", sensorial.FatoresAliviantesDor, sensorialGabarito.FatoresAliviantesDor, modelState);
            if (sensorial.Visual != sensorialGabarito.Visual)
            {
                modelState.AddModelError("Visual", "Gabarito: " + (sensorialGabarito.Visual.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Auditiva != sensorialGabarito.Auditiva)
            {
                modelState.AddModelError("Auditiva", "Gabarito: " + (sensorialGabarito.Auditiva.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Gustativa != sensorialGabarito.Gustativa)
            {
                modelState.AddModelError("Gustativa", "Gabarito: " + (sensorialGabarito.Gustativa.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Olfativa != sensorialGabarito.Olfativa)
            {
                modelState.AddModelError("Olfativa", "Gabarito: " + (sensorialGabarito.Olfativa.Equals(true) ? "Sim" : "Não"));
            }
            if (sensorial.Tatil != sensorialGabarito.Tatil)
            {
                modelState.AddModelError("Tatil", "Gabarito: " + (sensorialGabarito.Tatil.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("DescricaoTipoDistorcao", sensorial.DescricaoTipoDistorcao, sensorialGabarito.DescricaoTipoDistorcao, modelState);
        } 

        /// <summary>
        /// Insere dados da Sensorial
        /// </summary>
        /// <param name="sensorial"></param>
        /// <returns></returns>
        public long Inserir(SensorialModel sensorial)
        {
            var repSensorial = new RepositorioGenerico<tb_sensorial>();
            tb_sensorial _tb_sensorial = new tb_sensorial();
            try
            {
                Atribuir(sensorial, _tb_sensorial);

                repSensorial.Inserir(_tb_sensorial);
                repSensorial.SaveChanges();

                return _tb_sensorial.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Sensorial", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do sensorial
        /// </summary>
        /// <param name="sensorial"></param>
        public void Atualizar(SensorialModel sensorial)
        {
            try
            {
                var repSensorial = new RepositorioGenerico<tb_sensorial>();
                tb_sensorial _tb_sensorial = repSensorial.ObterEntidade(s => s.IdConsultaVariavel == sensorial.IdConsultaVariavel);
                Atribuir(sensorial, _tb_sensorial);

                repSensorial.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Sensorial", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do sensorial especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repSensorial = new RepositorioGenerico<tb_sensorial>();
                repSensorial.Remover(s => s.IdConsultaVariavel == idConsultaVariavel);
                repSensorial.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Sensorial", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<SensorialModel> GetQuery()
        {
            var repSensorial = new RepositorioGenerico<tb_sensorial>();
            var pvEntities = (pvEntities)repSensorial.ObterContexto();
            var query = from sensorial in pvEntities.tb_sensorial
                        select new SensorialModel
                        {
                            IdConsultaVariavel = sensorial.IdConsultaVariavel,
                            EstadoMental = (sensorial.EstadoMental == "NaoSeAplica" ? ListaEstadoMental.SemAlteracoes :
                                sensorial.EstadoMental == "Agressivo" ? ListaEstadoMental.Agressivo : sensorial.EstadoMental == "EpisodioDelirio" ?
                                ListaEstadoMental.EpisodioDelirio : sensorial.EstadoMental == "Confuso" ? ListaEstadoMental.Confuso :
                                sensorial.EstadoMental == "Agitado" ? ListaEstadoMental.Agitado : sensorial.EstadoMental == "Apatico" ?
                                ListaEstadoMental.Apatico : sensorial.EstadoMental == "Sonolento" ? ListaEstadoMental.Sonolento :
                                sensorial.EstadoMental == "Torporoso" ? ListaEstadoMental.Torporoso : ListaEstadoMental.Comatoso),
                            Auditiva = sensorial.Auditiva,
                            Defensividade = sensorial.Defensividade,
                            DescricaoDor = sensorial.DescricaoDor,
                            DescricaoTipoDistorcao = sensorial.DescricaoTipoDistorcao,
                            DorIntensidadeValor = (int)sensorial.DorIntensidadeValor,
                            DuracaoDor = sensorial.DuracaoDor,
                            ExpressaoFacial = sensorial.ExpressaoFacial,
                            FatoresAgravantesDor = sensorial.FatoresAgravantesDor,
                            FatoresAliviantesDor = sensorial.FatoresAliviantesDor,
                            Gustativa = sensorial.Gustativa,
                            Inquietacao = sensorial.Inquietacao,
                            LocalizacaoDor = sensorial.LocalizacaoDor,
                            Olfativa = sensorial.Olfativa,
                            PA = sensorial.PA,
                            Palpebral = sensorial.Palpebral,
                            Plantar = sensorial.Plantar,
                            Pulso = sensorial.Pulso,
                            Pupilar = sensorial.Pupilar,
                            Respiracao = sensorial.Respiracao,
                            Dor = sensorial.Dor,
                            SinalBabinski = sensorial.SinalBabinski,
                            Tatil = sensorial.Tatil,
                            Visual = sensorial.Tatil
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os sensoriais cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SensorialModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém sensorial com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public SensorialModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(s => s.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="sensorial"></param>
        /// <param name="_tb_sensorial"></param>
        private static void Atribuir(SensorialModel sensorial, tb_sensorial _tb_sensorial)
        {
            _tb_sensorial.IdConsultaVariavel = sensorial.IdConsultaVariavel;
            _tb_sensorial.Auditiva = sensorial.Auditiva;
            _tb_sensorial.Defensividade = sensorial.Defensividade;
            _tb_sensorial.DescricaoDor = sensorial.DescricaoDor;
            _tb_sensorial.DescricaoTipoDistorcao = sensorial.DescricaoTipoDistorcao;
            _tb_sensorial.DorIntensidadeValor = sensorial.DorIntensidadeValor;
            _tb_sensorial.DuracaoDor = sensorial.DuracaoDor;
            _tb_sensorial.EstadoMental = sensorial.EstadoMental.ToString();
            _tb_sensorial.ExpressaoFacial = sensorial.ExpressaoFacial;
            _tb_sensorial.FatoresAgravantesDor = sensorial.FatoresAgravantesDor;
            _tb_sensorial.FatoresAliviantesDor = sensorial.FatoresAliviantesDor;
            _tb_sensorial.Gustativa = sensorial.Gustativa;
            _tb_sensorial.Inquietacao = sensorial.Inquietacao;
            _tb_sensorial.LocalizacaoDor = sensorial.LocalizacaoDor;
            _tb_sensorial.Olfativa = sensorial.Olfativa;
            _tb_sensorial.PA = sensorial.PA;
            _tb_sensorial.Palpebral = sensorial.Palpebral;
            _tb_sensorial.Plantar = sensorial.Plantar;
            _tb_sensorial.Pulso = sensorial.Pulso;
            _tb_sensorial.Pupilar = sensorial.Pupilar;
            _tb_sensorial.Respiracao = sensorial.Respiracao;
            _tb_sensorial.Dor = sensorial.Dor;
            _tb_sensorial.SinalBabinski = sensorial.SinalBabinski;
            _tb_sensorial.Tatil = sensorial.Tatil;
            _tb_sensorial.Visual = sensorial.Visual;
        }
    }
}