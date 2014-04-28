using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

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
        public void CorrigirRespostas()
        {
            
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
                            Turgor = ListaTurgor.Presente,
                            Equimose = integridadeTecidual.Equimose,
                            Hematoma = integridadeTecidual.Hematoma,
                            Letericia = integridadeTecidual.Letericia,
                            Descorada = integridadeTecidual.Descorada,
                            EstadoHidratacao = ListaEstadoHidratacao.Hidratada,
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
            _integridadeTecidualE.Turgor = ListaTurgor.Presente.ToString();
            _integridadeTecidualE.Equimose = integridadeTecidual.Equimose;
            _integridadeTecidualE.Hematoma = integridadeTecidual.Hematoma;
            _integridadeTecidualE.Letericia = integridadeTecidual.Letericia;
            _integridadeTecidualE.Descorada = integridadeTecidual.Descorada;
            _integridadeTecidualE.EstadoHidratacao = ListaEstadoHidratacao.Hidratada.ToString();
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