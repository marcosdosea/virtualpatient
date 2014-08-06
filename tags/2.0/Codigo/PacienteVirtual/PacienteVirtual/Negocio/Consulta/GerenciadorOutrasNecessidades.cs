using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorOutrasNecessidades
    {
        private static GerenciadorOutrasNecessidades gOutrasNecessidades;

        private GerenciadorOutrasNecessidades() { }

        public static GerenciadorOutrasNecessidades GetInstance()
        {
            if (gOutrasNecessidades == null)
            {
                gOutrasNecessidades = new GerenciadorOutrasNecessidades();
            }
            return gOutrasNecessidades;
        }

        /// <summary>
        /// Faz correção de OutrasNecessidades de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="oxigenacao"></param>
        /// <param name="oxigenacaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(OutrasNecessidadesModel outrasneces, OutrasNecessidadesModel outrasnecesGabarito, ModelStateDictionary modelState)
        {
            if (outrasneces.GrauDependencia != outrasnecesGabarito.GrauDependencia)
            {
                modelState.AddModelError("GrauDependencia", "Gabarito: \"" + outrasnecesGabarito.GrauDependencia + "\"");
            }
            Global.CorrecaoDeStrings("DescricaoGrauDependencia", outrasneces.DescricaoGrauDependencia, outrasnecesGabarito.DescricaoGrauDependencia, modelState);
            if (outrasnecesGabarito.Estilista != outrasnecesGabarito.Estilista)
            {
                modelState.AddModelError("Estilista", "Gabarito: " + (outrasnecesGabarito.Estilista.Equals(true) ? "Sim" : "Não"));
            }
            if (outrasnecesGabarito.Tabagista != outrasnecesGabarito.Tabagista)
            {
                modelState.AddModelError("Tabagista", "Gabarito: " + (outrasnecesGabarito.Tabagista.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("DescricaoEstilista", outrasneces.DescricaoEstilista, outrasnecesGabarito.DescricaoEstilista, modelState);
            Global.CorrecaoDeStrings("DescricaoTabagista", outrasneces.DescricaoTabagista, outrasnecesGabarito.DescricaoTabagista, modelState);
            Global.CorrecaoDeStrings("DescreverTipoTempoQtde", outrasneces.DescreverTipoTempoQtde, outrasnecesGabarito.DescreverTipoTempoQtde, modelState);
            if (outrasnecesGabarito.Tabagista != outrasnecesGabarito.Tabagista)
            {
                modelState.AddModelError("Tabagista", "Gabarito: " + (outrasnecesGabarito.Tabagista.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("DescreverTipoTempoQtde", outrasneces.DescreverTipoTempoQtde, outrasnecesGabarito.DescreverTipoTempoQtde, modelState);
            if (outrasnecesGabarito.UsoDrogasIlicitas != outrasnecesGabarito.UsoDrogasIlicitas)
            {
                modelState.AddModelError("UsoDrogasIlicitas", "Gabarito: " + (outrasnecesGabarito.UsoDrogasIlicitas.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("TipoDrogas", outrasneces.TipoDrogas, outrasnecesGabarito.TipoDrogas, modelState);
            Global.CorrecaoDeStrings("FrequenciaDrogas", outrasneces.FrequenciaDrogas, outrasnecesGabarito.FrequenciaDrogas, modelState);
            Global.CorrecaoDeStrings("TempoDrogas", outrasneces.TempoDrogas, outrasnecesGabarito.TempoDrogas, modelState);
            Global.CorrecaoDeStrings("QuantidadeDrogas", outrasneces.QuantidadeDrogas, outrasnecesGabarito.QuantidadeDrogas, modelState);
        } 

        /// <summary>
        /// Insere dados da OutrasNecessidades
        /// </summary>
        /// <param name="outrasNecessidades"></param>
        /// <returns></returns>
        public long Inserir(OutrasNecessidadesModel outrasNecessidades)
        {
            var repOutrasNecessidades = new RepositorioGenerico<tb_outras_necessidades>();
            tb_outras_necessidades _tb_outras_necessidades = new tb_outras_necessidades();
            try
            {
                Atribuir(outrasNecessidades, _tb_outras_necessidades);

                repOutrasNecessidades.Inserir(_tb_outras_necessidades);
                repOutrasNecessidades.SaveChanges();

                return _tb_outras_necessidades.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("OutrasNecessidades", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do outrasNecessidades
        /// </summary>
        /// <param name="outrasNecessidades"></param>
        public void Atualizar(OutrasNecessidadesModel outrasNecessidades)
        {
            try
            {
                var repOutrasNecessidades = new RepositorioGenerico<tb_outras_necessidades>();
                tb_outras_necessidades _tb_outras_necessidades = repOutrasNecessidades.ObterEntidade(o => o.IdConsultaVariavel == outrasNecessidades.IdConsultaVariavel);
                Atribuir(outrasNecessidades, _tb_outras_necessidades);

                repOutrasNecessidades.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("OutrasNecessidades", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do outrasNecessidades especificando a consulta variavel
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repOutrasNecessidades = new RepositorioGenerico<tb_outras_necessidades>();
                repOutrasNecessidades.Remover(s => s.IdConsultaVariavel == idConsultaVariavel);
                repOutrasNecessidades.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("OutrasNecessidades", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<OutrasNecessidadesModel> GetQuery()
        {
            var repOutrasNecessidades = new RepositorioGenerico<tb_outras_necessidades>();
            var pvEntities = (pvEntities)repOutrasNecessidades.ObterContexto();
            var query = from outrasNecessidades in pvEntities.tb_outras_necessidades
                        select new OutrasNecessidadesModel
                        {
                            IdConsultaVariavel = outrasNecessidades.IdConsultaVariavel,
                            GrauDependencia = (outrasNecessidades.GrauDependencia == "Independente" ? ListaGrauDependencia.Independente :
                                outrasNecessidades.GrauDependencia == "ParcialmenteDependente" ? ListaGrauDependencia.ParcialmenteDependente : 
                                ListaGrauDependencia.DependentePara),
                            DescreverTipoTempoQtde = outrasNecessidades.DescreverTipoTempoQtde,
                            DescricaoEstilista = outrasNecessidades.DescricaoEstilista,
                            DescricaoGrauDependencia = outrasNecessidades.DescricaoGrauDependencia,
                            DescricaoTabagista = outrasNecessidades.DescricaoTabagista,
                            Estilista = outrasNecessidades.Estilista,
                            FrequenciaDrogas = outrasNecessidades.FrequenciaDrogas,
                            QuantidadeDrogas = outrasNecessidades.QuantidadeDrogas,
                            Tabagista = outrasNecessidades.Tagabista,
                            TempoDrogas = outrasNecessidades.TempoDrogas,
                            TipoDrogas = outrasNecessidades.TipoDrogas,
                            UsoDrogasIlicitas = outrasNecessidades.UsoDrogasIlicitas
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as OutrasNecessidades cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<OutrasNecessidadesModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém outrasNecessidades com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public OutrasNecessidadesModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(o => o.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="outrasNecessidades"></param>
        /// <param name="_tb_outras_necessidades"></param>
        private static void Atribuir(OutrasNecessidadesModel outrasNecessidades, tb_outras_necessidades _tb_outras_necessidades)
        {
            _tb_outras_necessidades.IdConsultaVariavel = outrasNecessidades.IdConsultaVariavel;
            _tb_outras_necessidades.DescreverTipoTempoQtde = outrasNecessidades.DescreverTipoTempoQtde;
            _tb_outras_necessidades.DescricaoEstilista = outrasNecessidades.DescricaoEstilista;
            _tb_outras_necessidades.DescricaoGrauDependencia = outrasNecessidades.DescricaoGrauDependencia;
            _tb_outras_necessidades.DescricaoTabagista = outrasNecessidades.DescricaoTabagista;
            _tb_outras_necessidades.Estilista = outrasNecessidades.Estilista;
            _tb_outras_necessidades.FrequenciaDrogas = outrasNecessidades.FrequenciaDrogas;
            _tb_outras_necessidades.GrauDependencia = outrasNecessidades.GrauDependencia.ToString();
            _tb_outras_necessidades.QuantidadeDrogas = outrasNecessidades.QuantidadeDrogas;
            _tb_outras_necessidades.Tagabista = outrasNecessidades.Tabagista;
            _tb_outras_necessidades.TempoDrogas = outrasNecessidades.TempoDrogas;
            _tb_outras_necessidades.TipoDrogas = outrasNecessidades.TipoDrogas;
            _tb_outras_necessidades.UsoDrogasIlicitas = outrasNecessidades.UsoDrogasIlicitas;
        }
    }
}