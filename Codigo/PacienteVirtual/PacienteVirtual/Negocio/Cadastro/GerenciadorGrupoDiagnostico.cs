using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorGrupoDiagnostico
    {
        public static GerenciadorGrupoDiagnostico gGrupoDiagnostico;

        private GerenciadorGrupoDiagnostico()
        {
        }

        public static GerenciadorGrupoDiagnostico GetInstance()
        {
            if (gGrupoDiagnostico == null)
            {
                gGrupoDiagnostico = new GerenciadorGrupoDiagnostico();
            }
            return gGrupoDiagnostico;
        }

        /// <summary>
        /// inserir dados da grupoDiagnostico
        /// </summary>
        /// <param name="grupoDiagnostico"></param>
        /// <returns></returns>
        public int Inserir(GrupoDiagnosticoModel grupoDiagnostico)
        {
            var repGrupoDiagnostico = new RepositorioGenerico<tb_grupo_diagnostico>();
            tb_grupo_diagnostico _tb_grupo_diagnostico = new tb_grupo_diagnostico();
            try
            {
                Atribuir(grupoDiagnostico, _tb_grupo_diagnostico);

                repGrupoDiagnostico.Inserir(_tb_grupo_diagnostico);
                repGrupoDiagnostico.SaveChanges();

                return _tb_grupo_diagnostico.IdGrupoDiagnostico;
            }
            catch (Exception e)
            {
                throw new NegocioException("GrupoDiagnostico", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da GrupoDiagnostico
        /// </summary>
        /// <param name="grupoDiagnostico"></param>
        public void Atualizar(GrupoDiagnosticoModel grupoDiagnostico)
        {
            try
            {
                var repGrupoDiagnostico = new RepositorioGenerico<tb_grupo_diagnostico>();
                tb_grupo_diagnostico _tb_grupo_diagnostico = repGrupoDiagnostico.ObterEntidade(d => d.IdGrupoDiagnostico == grupoDiagnostico.IdGrupoDiagnostico);
                Atribuir(grupoDiagnostico, _tb_grupo_diagnostico);

                repGrupoDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("GrupoDiagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da GrupoDiagnostico
        /// </summary>
        /// <param name="idGrupoDiagnostico"></param>
        public void Remover(int idGrupoDiagnostico)
        {
            try
            {
                var repGrupoDiagnostico = new RepositorioGenerico<tb_grupo_diagnostico>();
                repGrupoDiagnostico.Remover(d => d.IdGrupoDiagnostico == idGrupoDiagnostico);
                repGrupoDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("GrupoDiagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<GrupoDiagnosticoModel> GetQuery()
        {
            var repGrupoDiagnostico = new RepositorioGenerico<tb_grupo_diagnostico>();
            var pvEntities = (pvEntities)repGrupoDiagnostico.ObterContexto();
            var query = from grupoDiagnostico in pvEntities.tb_grupo_diagnostico
                        select new GrupoDiagnosticoModel
                        {
                            IdGrupoDiagnostico = grupoDiagnostico.IdGrupoDiagnostico,
                            Descricao = grupoDiagnostico.DescricaoGrupo
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os GruposDiagnosticos cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<GrupoDiagnosticoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém GrupoDiagnostico com o código especificiado
        /// </summary>
        /// <param name="idGrupoDiagnostico"></param>
        /// <returns></returns>
        public GrupoDiagnosticoModel Obter(int idGrupoDiagnostico)
        {
            return GetQuery().Where(grupoDiagnostico => grupoDiagnostico.IdGrupoDiagnostico == idGrupoDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="grupoDiagnostico"></param>
        /// <param name="_tb_grupo_diagnostico"></param>
        private static void Atribuir(GrupoDiagnosticoModel grupoDiagnostico, tb_grupo_diagnostico _tb_grupo_diagnostico)
        {
            _tb_grupo_diagnostico.DescricaoGrupo = grupoDiagnostico.Descricao;
        }
    }
}