using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoConsultaFator
    {
        
        private static GerenciadorDiagnosticoConsultaFator gDiagnosticoConsultaFator;
        private GerenciadorDiagnosticoConsultaFator() { }

        public static GerenciadorDiagnosticoConsultaFator GetInstance()
        {
            if (gDiagnosticoConsultaFator == null)
            {
                gDiagnosticoConsultaFator = new GerenciadorDiagnosticoConsultaFator();
            }
            return gDiagnosticoConsultaFator;
        }


        /// <summary>
        /// Insere uma alergia em um exame físico
        /// </summary>
        /// <param name="diagnosticoCF"></param>
        public void Inserir(DiagnosticoConsultaFatorModel diagnosticoCF)
        {
            try
            {
                var repDiagnosticoCV = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                var repDiagnosticoFator = new RepositorioGenerico<tb_diagnostico_fator>(repDiagnosticoCV.ObterContexto());

                tb_diagnostico_consulta_variavel _tb_diagnosticoCV = repDiagnosticoCV.ObterEntidade(dP => dP.IdConsultaVariavel == 
                    diagnosticoCF.IdConsultaVariavel && dP.IdDiagnostico == diagnosticoCF.IdDiagnostico);
                tb_diagnostico_fator _tb_diagnostico_fator = repDiagnosticoFator.ObterEntidade(df => df.IdDiagnosticoFator == 
                    diagnosticoCF.IdDiagnosticoFator);

                _tb_diagnosticoCV.tb_diagnostico_fator.Add(_tb_diagnostico_fator);

                repDiagnosticoCV.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsultaFator", e.Message, e);
            }
        }


        /// <summary>
        /// Insere uma alergia em um exame físico
        /// </summary>
        /// <param name="diagnosticoCF"></param>
        public void Remover(DiagnosticoConsultaFatorModel diagnosticoCF)
        {
            try
            {
                var repDiagnosticoCV = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                var repDiagnosticoFator = new RepositorioGenerico<tb_diagnostico_fator>(repDiagnosticoCV.ObterContexto());

                tb_diagnostico_consulta_variavel _tb_diagnosticoCV = repDiagnosticoCV.ObterEntidade(dP => dP.IdConsultaVariavel ==
                    diagnosticoCF.IdConsultaVariavel && dP.IdDiagnostico == diagnosticoCF.IdDiagnostico);
                tb_diagnostico_fator _tb_diagnostico_fator = repDiagnosticoFator.ObterEntidade(df => df.IdDiagnosticoFator ==
                    diagnosticoCF.IdDiagnosticoFator);

                _tb_diagnosticoCV.tb_diagnostico_fator.Remove(_tb_diagnostico_fator);

                repDiagnosticoCV.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsultaFator", e.Message, e);
            }
        }
        

        /// <summary>
        /// Obtém todas as alergias relacionadas a consulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idDiagnostico"></param>
        public IEnumerable<DiagnosticoFatorModel> ObterTodosPorDiagnosticoConsulta(long idConsultaVariavel, int idDiagnostico)
        {
            // Verificar se pode deixar assim
            if (idDiagnostico <= 0)
            {
                return GerenciadorDiagnosticoFator.GetInstance().ObterPorDiagnostico(idDiagnostico);
            }
            ///////////////////////////////////
            var repDiagnosticoCV = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
            tb_diagnostico_consulta_variavel _tb_diagnosticoCV = repDiagnosticoCV.ObterEntidade(dcv => dcv.IdConsultaVariavel == 
                idConsultaVariavel && dcv.IdDiagnostico == idDiagnostico);
            var query = from diagnosticoCF in _tb_diagnosticoCV.tb_diagnostico_fator
                        select new DiagnosticoFatorModel
                        {
                            IdDiagnostico = diagnosticoCF.IdDiagnostico,
                            IdDiagnosticoFator = diagnosticoCF.IdDiagnosticoFator,
                            DescricaoDiagnostico = diagnosticoCF.tb_diagnostico.Diagnostico,
                            DescricaoFatorDiagnostico = diagnosticoCF.DescricaoFator
                        };
            return query;
        }
    }
}