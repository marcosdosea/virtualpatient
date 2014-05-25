using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

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
        /*public void CorrigirRespostas(SexualidadeModel termorregulacao, TermorregulacaoModel termorregulacaoGabarito, ModelStateDictionary modelState)
        {
            if (termorregulacao.Temperatura != termorregulacaoGabarito.Temperatura)
            {
                modelState.AddModelError("Temperatura", "Gabarito: \"" + termorregulacaoGabarito.Temperatura + "\"");
            }
            if (termorregulacao.TemperaturaPele != termorregulacaoGabarito.TemperaturaPele)
            {
                modelState.AddModelError("ErroTemperaturaPele", "Gabarito: \"" + termorregulacaoGabarito.TemperaturaPele + "\"");
            }
            if (termorregulacao.Sudorese != termorregulacaoGabarito.Sudorese)
            {
                modelState.AddModelError("Sudorese", "Gabarito: " + (termorregulacaoGabarito.Sudorese.Equals(true) ? "Sim" : "Não"));
            }
            if (termorregulacao.Calafrio != termorregulacaoGabarito.Calafrio)
            {
                modelState.AddModelError("Calafrio", "Gabarito: " + (termorregulacaoGabarito.Calafrio.Equals(true) ? "Sim" : "Não"));
            }
            if (termorregulacao.Piloerecao != termorregulacaoGabarito.Piloerecao)
            {
                modelState.AddModelError("Piloerecao", "Gabarito: " + (termorregulacaoGabarito.Piloerecao.Equals(true) ? "Sim" : "Não"));
            }
        } */

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
                            SimetriaMamas = (sexualidade.SimetriaMamas == "Simetricas" ? ListaSimetriaMamas.Simetricas : ListaSimetriaMamas.Assimetricas),
                            TipoSecrecao = (sexualidade.TipoSecrecao == "SecrecaoPurulenta" ? ListaTipoSecrecao.SecrecaoPurulenta : ListaTipoSecrecao.SecrecaoSerosa),
                            ConflitoPreferenciaSexual = sexualidade.ConflitoPreferenciaSexual,
                            DataExamePreventivo = (DateTime)sexualidade.DataExamePreventivo,
                            DataUltimaMenstruacao = (DateTime)sexualidade.DataUltimaMenstruacao,
                            DorRelacaoSexual = sexualidade.DorRelacaoSexual,
                            Edema = sexualidade.Edema,
                            Hiperemia = sexualidade.Hiperemia,
                            Lesao = sexualidade.Lesao,
                            OdorFetido = sexualidade.OdorFetido,
                            ParceiroFixo = sexualidade.ParceiroFixo,
                            Prurido = sexualidade.Prurido,
                            Sangramento = sexualidade.Sangramento,
                            Secrecao = sexualidade.Secrecao,
                            UsoContraceptivo = sexualidade.UsoContraceptivo
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
            _tb_sexualidade.ConflitoPreferenciaSexual = sexualidade.ConflitoPreferenciaSexual;
            _tb_sexualidade.DataExamePreventivo = sexualidade.DataExamePreventivo;
            _tb_sexualidade.DataUltimaMenstruacao = sexualidade.DataUltimaMenstruacao;
            _tb_sexualidade.DorRelacaoSexual = sexualidade.DorRelacaoSexual;
            _tb_sexualidade.Edema = sexualidade.Edema;
            _tb_sexualidade.Hiperemia = sexualidade.Hiperemia;
            _tb_sexualidade.Lesao = sexualidade.Lesao;
            _tb_sexualidade.OdorFetido = sexualidade.OdorFetido;
            _tb_sexualidade.ParceiroFixo = sexualidade.ParceiroFixo;
            _tb_sexualidade.Prurido = sexualidade.Prurido;
            _tb_sexualidade.Sangramento = sexualidade.Sangramento;
            _tb_sexualidade.Secrecao = sexualidade.Secrecao;
            _tb_sexualidade.SimetriaMamas = sexualidade.SimetriaMamas.ToString();
            _tb_sexualidade.TipoSecrecao = sexualidade.TipoSecrecao.ToString();
            _tb_sexualidade.UsoContraceptivo = sexualidade.UsoContraceptivo;
        }
    }
}