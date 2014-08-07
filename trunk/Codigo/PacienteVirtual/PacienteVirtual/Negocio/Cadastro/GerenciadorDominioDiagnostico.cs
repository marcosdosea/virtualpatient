using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDominioDiagnostico
    {
        public static GerenciadorDominioDiagnostico gDominioDiagnostico;

        private GerenciadorDominioDiagnostico()
        {
        }

        public static GerenciadorDominioDiagnostico GetInstance()
        {
            if (gDominioDiagnostico == null)
            {
                gDominioDiagnostico = new GerenciadorDominioDiagnostico();
            }
            return gDominioDiagnostico;
        }

        /// <summary>
        /// inserir dados da dominioDiagnostico
        /// </summary>
        /// <param name="dominioDiagnostico"></param>
        /// <returns></returns>
        public int Inserir(DominioDiagnosticoModel dominioDiagnostico)
        {
            var repDominioDiagnostico = new RepositorioGenerico<tb_dominio_diagnostico>();
            tb_dominio_diagnostico _tb_dominio_diagnostico = new tb_dominio_diagnostico();
            try
            {
                Atribuir(dominioDiagnostico, _tb_dominio_diagnostico);

                repDominioDiagnostico.Inserir(_tb_dominio_diagnostico);
                repDominioDiagnostico.SaveChanges();

                return _tb_dominio_diagnostico.IdDominioDiagnostico;
            }
            catch (Exception e)
            {
                throw new NegocioException("DominioDiagnostico", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da DominioDiagnostico
        /// </summary>
        /// <param name="dominioDiagnostico"></param>
        public void Atualizar(DominioDiagnosticoModel dominioDiagnostico)
        {
            try
            {
                var repDominioDiagnostico = new RepositorioGenerico<tb_dominio_diagnostico>();
                tb_dominio_diagnostico _tb_dominio_diagnostico = repDominioDiagnostico.ObterEntidade(d => d.IdDominioDiagnostico == dominioDiagnostico.IdDominioDiagnostico);
                Atribuir(dominioDiagnostico, _tb_dominio_diagnostico);

                repDominioDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DominioDiagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da DominioDiagnostico
        /// </summary>
        /// <param name="idDominioDiagnostico"></param>
        public void Remover(int idDominioDiagnostico)
        {
            try
            {
                var repDominioDiagnostico = new RepositorioGenerico<tb_dominio_diagnostico>();
                repDominioDiagnostico.Remover(d => d.IdDominioDiagnostico == idDominioDiagnostico);
                repDominioDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DominioDiagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DominioDiagnosticoModel> GetQuery()
        {
            var repDominioDiagnostico = new RepositorioGenerico<tb_dominio_diagnostico>();
            var pvEntities = (pvEntities)repDominioDiagnostico.ObterContexto();
            var query = from dominioDiagnostico in pvEntities.tb_dominio_diagnostico
                        select new DominioDiagnosticoModel
                        {
                            IdDominioDiagnostico = dominioDiagnostico.IdDominioDiagnostico,
                            DescricaoDominioDiagnostico = dominioDiagnostico.DescricaoDominio
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os dominioDiagnostico cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DominioDiagnosticoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DominioDiagnostico com o código especificiado
        /// </summary>
        /// <param name="idDominioDiagnostico"></param>
        /// <returns></returns>
        public DominioDiagnosticoModel Obter(int idDominioDiagnostico)
        {
            return GetQuery().Where(dominioDiagnostico => dominioDiagnostico.IdDominioDiagnostico == idDominioDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="dominioDiagnostico"></param>
        /// <param name="_tb_dominio_diagnostico"></param>
        private static void Atribuir(DominioDiagnosticoModel dominioDiagnostico, tb_dominio_diagnostico _tb_dominio_diagnostico)
        {
            _tb_dominio_diagnostico.DescricaoDominio = dominioDiagnostico.DescricaoDominioDiagnostico;
        }
    }
}