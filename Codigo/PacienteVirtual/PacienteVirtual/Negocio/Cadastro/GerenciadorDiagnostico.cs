using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnostico
    {
        private static GerenciadorDiagnostico gDiagnostico;

        private GerenciadorDiagnostico() { }

        public static GerenciadorDiagnostico GetInstance()
        {
            if (gDiagnostico == null)
            {
                gDiagnostico = new GerenciadorDiagnostico();
            }
            return gDiagnostico;
        }

        /// <summary>
        /// Insere dados do Intervencao
        /// </summary>
        /// <param name="intervencao"></param>
        /// <returns></returns>
        public int Inserir(DiagnosticoModel diagnostico)
        {
            var repDiagnostico = new RepositorioGenerico<tb_diagnostico>();
            tb_diagnostico _diagnosticoE = new tb_diagnostico();
            try
            {
                Atribuir(diagnostico, _diagnosticoE);

                repDiagnostico.Inserir(_diagnosticoE);
                repDiagnostico.SaveChanges();

                return _diagnosticoE.IdDiagnostico;
            }
            catch (Exception e)
            {
                throw new DadosException("Diagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do diagnostico
        /// </summary>
        /// <param name="diagnostico"></param>
        public void Atualizar(DiagnosticoModel diagnostico)
        {
            try
            {
                var repDiagnostico = new RepositorioGenerico<tb_diagnostico>();
                tb_diagnostico _diagnosticoE = repDiagnostico.ObterEntidade(d => d.IdDiagnostico == diagnostico.IdDiagnostico);
                Atribuir(diagnostico, _diagnosticoE);

                repDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Diagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do diagnostico
        /// </summary>
        /// <param name="IdDiagnostico"></param>
        public void Remover(int IdDiagnostico)
        {
            try
            {
                var repDiagnostico = new RepositorioGenerico<tb_diagnostico>();
                repDiagnostico.Remover(diagnostico => diagnostico.IdDiagnostico == IdDiagnostico);
                repDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Diagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiagnosticoModel> GetQuery()
        {
            var repDiagnostico = new RepositorioGenerico<tb_diagnostico>();
            var pvEntities = (pvEntities)repDiagnostico.ObterContexto();
            var query = from tb_diagnostico in pvEntities.tb_diagnostico
                        join tb_grupo_diagnostico in pvEntities.tb_grupo_diagnostico
                        on tb_diagnostico.IdGrupoDiagnostico equals tb_grupo_diagnostico.IdGrupoDiagnostico
                        select new DiagnosticoModel
                        {
                            IdDiagnostico = tb_diagnostico.IdDiagnostico,
                            IdGrupoDiagnostico = tb_diagnostico.IdGrupoDiagnostico,
                            DescricaoDiagnostico = tb_diagnostico.Diagnostico,
                            DescricaoGrupoDiagnostico = tb_grupo_diagnostico.DescricaoGrupo,
                            Risco = tb_diagnostico.PossuiRisco
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os curso cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiagnosticoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém intervencao com o código especificiado
        /// </summary>
        /// <param name="IdDiagnostico"></param>
        /// <returns></returns>
        public DiagnosticoModel Obter(int IdDiagnostico)
        {
            return GetQuery().Where(diagnostico => diagnostico.IdDiagnostico == IdDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém queixas que iniciam com o descricao diagnostico
        /// </summary>
        /// <param name="descricaoIntervencao"></param>
        /// <returns></returns>
        public IEnumerable<DiagnosticoModel> ObterPorNome(string descricaoIntervencao)
        {
            return GetQuery().Where(diagnostico => diagnostico.DescricaoDiagnostico.StartsWith(descricaoIntervencao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="intervencao"></param>
        /// <param name="_intervencaoE"></param>
        private static void Atribuir(DiagnosticoModel diagnostico, tb_diagnostico _diagnosticoE)
        {
            _diagnosticoE.Diagnostico = diagnostico.DescricaoDiagnostico;
            _diagnosticoE.IdGrupoDiagnostico = diagnostico.IdGrupoDiagnostico;
            _diagnosticoE.PossuiRisco = diagnostico.Risco;
        }

        /// <summary>
        /// Obtem intervencoes pelo GrupoIntervenção
        /// </summary>
        /// <param name="idGrupoIntervencao"></param>
        /// <returns></returns>
        public IEnumerable<DiagnosticoModel> ObterPorGrupoIntervencao(int idGrupoDiagnostico)
        {
            return GetQuery().Where(diagnostico => diagnostico.IdGrupoDiagnostico == idGrupoDiagnostico).ToList();
        }
    }
}