using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoConsultaCaracteristica
    {
        private static GerenciadorDiagnosticoConsultaCaracteristica gDiagnosticoConsultaCaracteristica;
        private GerenciadorDiagnosticoConsultaCaracteristica() { }

        public static GerenciadorDiagnosticoConsultaCaracteristica GetInstance()
        {
            if (gDiagnosticoConsultaCaracteristica == null)
            {
                gDiagnosticoConsultaCaracteristica = new GerenciadorDiagnosticoConsultaCaracteristica();
            }
            return gDiagnosticoConsultaCaracteristica;
        }


        public void Inserir(DiagnosticoConsultaCaracteristicaModel diagnosticoCC)
        {
            try
            {
                var repDiagnosticoCC = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                var repDiagnosticoCaracteristica = new RepositorioGenerico<tb_diagnostico_caracteristica>(repDiagnosticoCC.ObterContexto());

                tb_diagnostico_consulta_variavel _tb_diagnosticoCC = repDiagnosticoCC.ObterEntidade(dP => dP.IdConsultaVariavel == 
                    diagnosticoCC.IdConsultaVariavel && dP.IdDiagnostico == diagnosticoCC.IdDiagnostico);
                tb_diagnostico_caracteristica _tb_diagnostico_caracteristica = repDiagnosticoCaracteristica.ObterEntidade(df => 
                    df.IdDiagnosticoCaracteristica == diagnosticoCC.IdDiagnosticoCaracteristica);

                _tb_diagnosticoCC.tb_diagnostico_caracteristica.Add(_tb_diagnostico_caracteristica);

                repDiagnosticoCC.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsultaCaracteristica", e.Message, e);
            }
        }


        public void Remover(DiagnosticoConsultaCaracteristicaModel diagnosticoCC)
        {
            try
            {
                var repDiagnosticoCC = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                var repDiagnosticoCaracteristica = new RepositorioGenerico<tb_diagnostico_caracteristica>(repDiagnosticoCC.ObterContexto());

                tb_diagnostico_consulta_variavel _tb_diagnosticoCC = repDiagnosticoCC.ObterEntidade(dP => dP.IdConsultaVariavel ==
                    diagnosticoCC.IdConsultaVariavel && dP.IdDiagnostico == diagnosticoCC.IdDiagnostico);
                tb_diagnostico_caracteristica _tb_diagnostico_caracteristica = repDiagnosticoCaracteristica.ObterEntidade(df =>
                    df.IdDiagnosticoCaracteristica == diagnosticoCC.IdDiagnosticoCaracteristica);

                _tb_diagnosticoCC.tb_diagnostico_caracteristica.Remove(_tb_diagnostico_caracteristica);

                repDiagnosticoCC.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsultaCaracteristica", e.Message, e);
            }
        }
        

        public IEnumerable<DiagnosticoCaracteristicaModel> ObterTodosPorDiagnosticoConsulta(long idConsultaVariavel, int idDiagnostico)
        {
            // Verificar se pode deixar assim
            if (idDiagnostico <= 0)
            {
                return GerenciadorDiagnosticoCaracteristica.GetInstance().ObterPorDiagnostico(idDiagnostico);
            }
            ///////////////////////////////////
            var repDiagnosticoCV = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
            tb_diagnostico_consulta_variavel _tb_diagnosticoCV = repDiagnosticoCV.ObterEntidade(dcv => dcv.IdConsultaVariavel == 
                idConsultaVariavel && dcv.IdDiagnostico == idDiagnostico);
            var query = from diagnosticoCV in _tb_diagnosticoCV.tb_diagnostico_caracteristica
                        select new DiagnosticoCaracteristicaModel
                        {
                            IdDiagnostico = diagnosticoCV.IdDiagnostico,
                            IdDiagnosticoCaracteristica = diagnosticoCV.IdDiagnosticoCaracteristica,
                            DescricaoDiagnostico = diagnosticoCV.tb_diagnostico.Diagnostico,
                            DescricaoCaracteristicaDiagnostico = diagnosticoCV.DescricaoCaracteristica
                        };
            return query.ToList();
        }
    }
}