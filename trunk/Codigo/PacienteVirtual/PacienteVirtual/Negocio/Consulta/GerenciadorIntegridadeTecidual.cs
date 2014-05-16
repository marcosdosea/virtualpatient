using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorIntegridadeTecidual
    {
        private static GerenciadorIntegridadeTecidual gIntegridadeTecidual;

        private GerenciadorIntegridadeTecidual() { }

        public static GerenciadorIntegridadeTecidual GetInstance()
        {
            if (gIntegridadeTecidual == null)
            {
                gIntegridadeTecidual = new GerenciadorIntegridadeTecidual();
            }
            return gIntegridadeTecidual;
        }

        /// <summary>
        /// Faz correção de IntegridadeTecidual de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="IntegridadeTecidual"></param>
        /// <param name="IntegridadeTecidualGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IntegridadeTecidualModel integridade, IntegridadeTecidualModel integridadeGabarito, ModelStateDictionary modelState)
        {
            if (integridade.Turgor != integridadeGabarito.Turgor)
            {
                modelState.AddModelError("ErroTurgor", "Gabarito: \"" + integridadeGabarito.Turgor + "\"");
            }
            if (integridade.Equimose != integridadeGabarito.Equimose)
            {
                modelState.AddModelError("Equimose", "Gabarito: " + (integridadeGabarito.Equimose.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Hematoma != integridadeGabarito.Hematoma)
            {
                modelState.AddModelError("Hematoma", "Gabarito: " + (integridadeGabarito.Hematoma.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Letericia != integridadeGabarito.Letericia)
            {
                modelState.AddModelError("Letericia", "Gabarito: " + (integridadeGabarito.Letericia.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Descorada != integridadeGabarito.Descorada)
            {
                modelState.AddModelError("Descorada", "Gabarito: " + (integridadeGabarito.Descorada.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.EstadoHidratacao != integridadeGabarito.EstadoHidratacao)
            {
                modelState.AddModelError("ErroEstadoHidratacao", "Gabarito: \"" + integridadeGabarito.EstadoHidratacao + "\"");
            }
            if (integridade.Purido != integridadeGabarito.Purido)
            {
                modelState.AddModelError("Purido", "Gabarito: " + (integridadeGabarito.Purido.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Hiperemia != integridadeGabarito.Hiperemia)
            {
                modelState.AddModelError("Hiperemia", "Gabarito: " + (integridadeGabarito.Hiperemia.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Nodulo != integridadeGabarito.Nodulo)
            {
                modelState.AddModelError("Nodulo", "Gabarito: " + (integridadeGabarito.Nodulo.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Descamacao != integridadeGabarito.Descamacao)
            {
                modelState.AddModelError("Descamacao", "Gabarito: " + (integridadeGabarito.Descamacao.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.PerdaSensibilidade != integridadeGabarito.PerdaSensibilidade)
            {
                modelState.AddModelError("PerdaSensibilidade", "Gabarito: " + (integridadeGabarito.PerdaSensibilidade.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Eritema != integridadeGabarito.Eritema)
            {
                modelState.AddModelError("Eritema", "Gabarito: " + (integridadeGabarito.Eritema.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Rubor != integridadeGabarito.Rubor)
            {
                modelState.AddModelError("Rubor", "Gabarito: " + (integridadeGabarito.Rubor.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("LocalAlteracaoPele", integridade.LocalAlteracaoPele, integridadeGabarito.LocalAlteracaoPele, modelState);
            
            if (integridade.Pediabetico != integridadeGabarito.Pediabetico)
            {
                modelState.AddModelError("Pediabetico", "Gabarito: " + (integridadeGabarito.Pediabetico.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.Escoriacao != integridadeGabarito.Escoriacao)
            {
                modelState.AddModelError("Escoriacao", "Gabarito: " + (integridadeGabarito.Escoriacao.Equals(true) ? "Sim" : "Não"));
            }
            if (integridade.UlceraPressao != integridadeGabarito.UlceraPressao)
            {
                modelState.AddModelError("UlceraPressao", "Gabarito: " + (integridadeGabarito.UlceraPressao.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("UlceraPressaoLocal", integridade.UlceraPressaoLocal, integridadeGabarito.UlceraPressaoLocal, modelState);
            
            if (!Global.RemoverAcentuacao(integridade.UlceraPressaoEstagio.ToLower()).Equals(Global.RemoverAcentuacao(integridadeGabarito.UlceraPressaoEstagio.ToLower())))
            {
                modelState.AddModelError("UlceraPressaoEstagio", "Gabarito: \"" + integridadeGabarito.UlceraPressaoEstagio + "\"");
            }
            if (integridade.Queimadura != integridadeGabarito.Queimadura)
            {
                modelState.AddModelError("Queimadura", "Gabarito: " + (integridadeGabarito.Queimadura.Equals(true) ? "Sim" : "Não"));
            }
            Global.CorrecaoDeStrings("QueimaduraGrau", integridade.QueimaduraGrau, integridadeGabarito.QueimaduraGrau, modelState);
            Global.CorrecaoDeStrings("QueimaduraLocal", integridade.QueimaduraLocal, integridadeGabarito.QueimaduraLocal, modelState);
            
            if (integridade.FeridaCirurgica != integridadeGabarito.FeridaCirurgica)
            {
                modelState.AddModelError("FeridaCirurgica", "Gabarito: " + (integridadeGabarito.FeridaCirurgica.Equals(true) ? "Sim" : "Não"));
            }
            if (!Global.RemoverAcentuacao(integridade.FeridaCirurgicaLocal.ToLower()).Equals(Global.RemoverAcentuacao(integridadeGabarito.FeridaCirurgicaLocal.ToLower())))
            {
                modelState.AddModelError("FeridaCirurgicaLocal", "Gabarito: \"" + integridadeGabarito.FeridaCirurgicaLocal + "\"");
            }
            if (!Global.RemoverAcentuacao(integridade.LesaoAspecto.ToLower()).Equals(Global.RemoverAcentuacao(integridadeGabarito.LesaoAspecto.ToLower())))
            {
                modelState.AddModelError("LesaoAspecto", "Gabarito: \"" + integridadeGabarito.LesaoAspecto + "\"");
            }
        }

        /// <summary>
        /// Insere dados do IntegridadeTecidual
        /// </summary>
        /// <param name="IntegridadeTecidual"></param>
        /// <returns></returns>
        public long Inserir(IntegridadeTecidualModel integridadeTecidual)
        {
            var repIntegridadeTecidual = new RepositorioGenerico<tb_integridade_tecidual>();
            tb_integridade_tecidual _integridadeTecidualE = new tb_integridade_tecidual();
            try
            {
                Atribuir(integridadeTecidual, _integridadeTecidualE);

                repIntegridadeTecidual.Inserir(_integridadeTecidualE);
                repIntegridadeTecidual.SaveChanges();

                return _integridadeTecidualE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("IntegridadeTecidual", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do IntegridadeTecidual
        /// </summary>
        /// <param name="IntegridadeTecidual"></param>
        public void Atualizar(IntegridadeTecidualModel integridadeTecidual)
        {
            try
            {
                var repIntegridadeTecidual = new RepositorioGenerico<tb_integridade_tecidual>();
                tb_integridade_tecidual _integridadeTecidualE = repIntegridadeTecidual.ObterEntidade(it => it.IdConsultaVariavel == integridadeTecidual.IdConsultaVariavel);
                Atribuir(integridadeTecidual, _integridadeTecidualE);

                repIntegridadeTecidual.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntegridadeTecidual", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do IntegridadeTecidual especificando a consulta fixa
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repIntegridadeTecidual = new RepositorioGenerico<tb_integridade_tecidual>();
                repIntegridadeTecidual.Remover(it => it.IdConsultaVariavel == idConsultaVariavel);
                repIntegridadeTecidual.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntegridadeTecidual", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<IntegridadeTecidualModel> GetQuery()
        {
            var repIntegridadeTecidual = new RepositorioGenerico<tb_integridade_tecidual>();
            var pvEntities = (pvEntities)repIntegridadeTecidual.ObterContexto();
            var query = from integridadeTecidual in pvEntities.tb_integridade_tecidual
                        select new IntegridadeTecidualModel
                        {
                            Turgor = (integridadeTecidual.TurgorCutaneo == "Presente" ? ListaTurgor.Presente : ListaTurgor.Diminuido),
                            Equimose = integridadeTecidual.Equimose,
                            Hematoma = integridadeTecidual.Hematoma,
                            Letericia = integridadeTecidual.Letericia,
                            Descorada = integridadeTecidual.Descorada,
                            EstadoHidratacao = (integridadeTecidual.EstadoHidratacao == "Hidratada" ? ListaEstadoHidratacao.Hidratada : ListaEstadoHidratacao.Desidratada),
                            Purido = integridadeTecidual.Purido,
                            Hiperemia = integridadeTecidual.Hiperemia,
                            Nodulo = integridadeTecidual.Nodulo,
                            Descamacao = integridadeTecidual.Descamacao,
                            PerdaSensibilidade = integridadeTecidual.PerdaSensibilidade,
                            Eritema = integridadeTecidual.Eritema,
                            Rubor = integridadeTecidual.Rubor,
                            LocalAlteracaoPele = integridadeTecidual.LocalAlteracaoPele,
                            Pediabetico = integridadeTecidual.PeDiabetico,
                            Escoriacao = integridadeTecidual.Escoriacao,
                            UlceraPressao = integridadeTecidual.UlceraPressao,
                            UlceraPressaoEstagio = integridadeTecidual.UlceraPressaoEstagio,
                            UlceraPressaoLocal = integridadeTecidual.UlceraPressaoLocal,
                            Queimadura = integridadeTecidual.Queimadura,
                            QueimaduraGrau = integridadeTecidual.QueimaduraGrau,
                            QueimaduraLocal = integridadeTecidual.QueimaduraLocal,
                            FeridaCirurgica = integridadeTecidual.FeridaCirugica,
                            FeridaCirurgicaLocal = integridadeTecidual.FeridaCirugicaLocal,
                            LesaoAspecto = integridadeTecidual.LesaoAspecto,
                            IdConsultaVariavel = integridadeTecidual.IdConsultaVariavel
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os integridadeTecidual cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<IntegridadeTecidualModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém integridadeTecidual com o código da consulta fixa especificiado
        /// </summary>
        /// <returns></returns>
        public IntegridadeTecidualModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(integridadeTecidual => integridadeTecidual.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="IntegridadeTecidual"></param>
        /// <param name="_integridadeTecidualE"></param>
        private static void Atribuir(IntegridadeTecidualModel integridadeTecidual, tb_integridade_tecidual _integridadeTecidualE)
        {
            _integridadeTecidualE.IdConsultaVariavel = integridadeTecidual.IdConsultaVariavel;
            _integridadeTecidualE.TurgorCutaneo = integridadeTecidual.Turgor.ToString();
            _integridadeTecidualE.Equimose = integridadeTecidual.Equimose;
            _integridadeTecidualE.Hematoma = integridadeTecidual.Hematoma;
            _integridadeTecidualE.Letericia = integridadeTecidual.Letericia;
            _integridadeTecidualE.Descorada = integridadeTecidual.Descorada;
            _integridadeTecidualE.EstadoHidratacao = integridadeTecidual.EstadoHidratacao.ToString();
            _integridadeTecidualE.Purido = integridadeTecidual.Purido;
            _integridadeTecidualE.Hiperemia = integridadeTecidual.Hiperemia;
            _integridadeTecidualE.Nodulo = integridadeTecidual.Nodulo;
            _integridadeTecidualE.Descamacao = integridadeTecidual.Descamacao;
            _integridadeTecidualE.PerdaSensibilidade = integridadeTecidual.PerdaSensibilidade;
            _integridadeTecidualE.Eritema = integridadeTecidual.Eritema;
            _integridadeTecidualE.Rubor = integridadeTecidual.Rubor;
            _integridadeTecidualE.LocalAlteracaoPele = integridadeTecidual.LocalAlteracaoPele;
            _integridadeTecidualE.PeDiabetico = integridadeTecidual.Pediabetico;
            _integridadeTecidualE.Escoriacao = integridadeTecidual.Escoriacao;
            _integridadeTecidualE.UlceraPressao = integridadeTecidual.UlceraPressao;
            _integridadeTecidualE.UlceraPressaoEstagio = integridadeTecidual.UlceraPressaoEstagio;
            _integridadeTecidualE.UlceraPressaoLocal = integridadeTecidual.UlceraPressaoLocal;
            _integridadeTecidualE.Queimadura = integridadeTecidual.Queimadura;
            _integridadeTecidualE.QueimaduraGrau = integridadeTecidual.QueimaduraGrau;
            _integridadeTecidualE.QueimaduraLocal = integridadeTecidual.QueimaduraLocal;
            _integridadeTecidualE.FeridaCirugica = integridadeTecidual.FeridaCirurgica;
            _integridadeTecidualE.FeridaCirugicaLocal = integridadeTecidual.FeridaCirurgicaLocal;
            _integridadeTecidualE.LesaoAspecto = integridadeTecidual.LesaoAspecto;
        }
    }
}