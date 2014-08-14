using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoCaracteristica
    {
        public static GerenciadorDiagnosticoCaracteristica gDiagnosticoCaracteristica;

        private GerenciadorDiagnosticoCaracteristica()
        {
        }

        public static GerenciadorDiagnosticoCaracteristica GetInstance()
        {
            if (gDiagnosticoCaracteristica == null)
            {
                gDiagnosticoCaracteristica = new GerenciadorDiagnosticoCaracteristica();
            }
            return gDiagnosticoCaracteristica;
        }

        /// <summary>
        /// inserir dados do diagnosticoCaracteristica
        /// </summary>
        /// <param name="diagnosticoCaracteristica"></param>
        /// <returns></returns>
        public int Inserir(DiagnosticoCaracteristicaModel diagnosticoCaracteristica)
        {
            var repDiagnosticoCaracteristica = new RepositorioGenerico<tb_diagnostico_caracteristica>();
            tb_diagnostico_caracteristica _tb_diagnostico_caracteristica = new tb_diagnostico_caracteristica();
            try
            {
                Atribuir(diagnosticoCaracteristica, _tb_diagnostico_caracteristica);

                repDiagnosticoCaracteristica.Inserir(_tb_diagnostico_caracteristica);
                repDiagnosticoCaracteristica.SaveChanges();

                return _tb_diagnostico_caracteristica.IdDiagnosticoCaracteristica;
            }
            catch (Exception e)
            {
                throw new NegocioException("DiagnosticoCaracteristica", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da DiagnosticoCaracteristica
        /// </summary>
        /// <param name="diagnosticoCaracteristica"></param>
        public void Atualizar(DiagnosticoCaracteristicaModel diagnosticoCaracteristica)
        {
            try
            {
                var repDiagnosticoCaracteristica = new RepositorioGenerico<tb_diagnostico_caracteristica>();
                tb_diagnostico_caracteristica _tb_diagnostico_caracteristica = repDiagnosticoCaracteristica.ObterEntidade(
                    d => d.IdDiagnosticoCaracteristica == diagnosticoCaracteristica.IdDiagnosticoCaracteristica);
                Atribuir(diagnosticoCaracteristica, _tb_diagnostico_caracteristica);

                repDiagnosticoCaracteristica.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoCaracteristica", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da DiagnosticoCaracteristica
        /// </summary>
        /// <param name="idDiagnosticoCaracteristica"></param>
        public void Remover(int idDiagnosticoCaracteristica)
        {
            try
            {
                var repDiagnosticoCaracteristica = new RepositorioGenerico<tb_diagnostico_caracteristica>();
                repDiagnosticoCaracteristica.Remover(d => d.IdDiagnosticoCaracteristica == idDiagnosticoCaracteristica);
                repDiagnosticoCaracteristica.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoCaracteristica", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiagnosticoCaracteristicaModel> GetQuery()
        {
            var repDiagnosticoCaracteristica = new RepositorioGenerico<tb_diagnostico_caracteristica>();
            var pvEntities = (pvEntities)repDiagnosticoCaracteristica.ObterContexto();
            var query = from diagnosticoCaracteristica in pvEntities.tb_diagnostico_caracteristica
                        select new DiagnosticoCaracteristicaModel
                        {
                            IdDiagnosticoCaracteristica = diagnosticoCaracteristica.IdDiagnosticoCaracteristica,
                            IdDiagnostico = diagnosticoCaracteristica.IdDiagnostico,
                            DescricaoCaracteristicaDiagnostico = diagnosticoCaracteristica.DescricaoCaracteristica,
                            Diagnostico = diagnosticoCaracteristica.tb_diagnostico.Diagnostico
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os diagnosticoCaracteristica cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiagnosticoCaracteristicaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DiagnosticoCaracteristica com o código especificiado
        /// </summary>
        /// <param name="idDiagnosticoCaracteristica"></param>
        /// <returns></returns>
        public DiagnosticoCaracteristicaModel Obter(int idDiagnosticoCaracteristica)
        {
            return GetQuery().Where(dc => dc.IdDiagnosticoCaracteristica == idDiagnosticoCaracteristica).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="diagnosticoCaracteristica"></param>
        /// <param name="_tb_diagnostico_caracteristica"></param>
        private static void Atribuir(DiagnosticoCaracteristicaModel diagnosticoCaracteristica, tb_diagnostico_caracteristica _tb_diagnostico_caracteristica)
        {
            _tb_diagnostico_caracteristica.IdDiagnosticoCaracteristica = diagnosticoCaracteristica.IdDiagnosticoCaracteristica;
            _tb_diagnostico_caracteristica.IdDiagnostico = diagnosticoCaracteristica.IdDiagnostico;
            _tb_diagnostico_caracteristica.DescricaoCaracteristica = diagnosticoCaracteristica.DescricaoCaracteristicaDiagnostico;
        }
    }
}