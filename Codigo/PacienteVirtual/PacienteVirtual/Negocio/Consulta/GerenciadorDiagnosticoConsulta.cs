using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoConsulta
    {
        private static GerenciadorDiagnosticoConsulta gDiagnosticoConsulta;
        private GerenciadorDiagnosticoConsulta() { }

        public static GerenciadorDiagnosticoConsulta GetInstance()
        {
            if (gDiagnosticoConsulta == null)
            {
                gDiagnosticoConsulta = new GerenciadorDiagnosticoConsulta();
            }
            return gDiagnosticoConsulta;
        }

        /// <summary>
        /// Realiza a correção da consulta diagnostico de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="listaIntervencao"></param>
        public void CorrigirRespostas(IEnumerable<DiagnosticoConsultaModel> resposta, IEnumerable<DiagnosticoConsultaModel> gabarito, ModelStateDictionary model)
        {
            string erro = "";
            foreach (DiagnosticoConsultaModel itemResp in resposta)
            {
                foreach (DiagnosticoConsultaModel itemGaba in gabarito)
                {
                    if ((itemResp.IdDiagnostico != itemGaba.IdDiagnostico) && (itemResp.IdGrupoDiagnostico != itemGaba.IdGrupoDiagnostico))
                    {
                        /*if ((Global.RemoverAcentuacao(resposta.AvaliacaoResultados) != Global.RemoverAcentuacao(gabarito.AvaliacaoResultados)) || (Global.RemoverAcentuacao(resposta.CaracteristicasDefinidoras) != Global.RemoverAcentuacao(gabarito.CaracteristicasDefinidoras)) || (Global.RemoverAcentuacao(resposta.Fatores) != Global.RemoverAcentuacao(gabarito.Fatores)) || (Global.RemoverAcentuacao(resposta.PrescricaoCuidado) != Global.RemoverAcentuacao(gabarito.PrescricaoCuidado)) || (Global.RemoverAcentuacao(resposta.ResultadoEsperado) != Global.RemoverAcentuacao(gabarito.ResultadoEsperado)))
                        {
                            erro += "Gabarito do Diagnóstico \"" + gabarito.DescricaoDiagnostico + "\" com Grupo Diagnóstico \"" + gabarito.DescricaoGrupoDiagnostico + "\": " + gabarito.Fatores + "; " + gabarito.CaracteristicasDefinidoras + "; " + gabarito.ResultadoEsperado + "; " + gabarito.PrescricaoCuidado + "; " + gabarito.AvaliacaoResultados + ";<br>";
                        }*/
                    }
                    else
                    {

                    }
                    
                }
            }
            
            model.AddModelError("ErroDiagnostico", erro);
        }

        /// <summary>
        /// Insere dados do DiagnosticoConsulta
        /// </summary>
        /// <param name="DiagnosticoConsulta"></param>
        /// <returns></returns>
        public long Inserir(DiagnosticoConsultaModel DiagnosticoConsultaModel)
        {
            DiagnosticoConsultaModel diagConsult = gDiagnosticoConsulta.ObterPorDiagnosticoGrupo(DiagnosticoConsultaModel.IdConsultaVariavel, DiagnosticoConsultaModel.IdDiagnostico, DiagnosticoConsultaModel.IdGrupoDiagnostico);
            if (diagConsult == null)
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel = new tb_diagnostico_consulta_variavel();
                try
                {
                    Atribuir(DiagnosticoConsultaModel, _tb_diagnostico_consulta_variavel);

                    repDiagnosticoConsulta.Inserir(_tb_diagnostico_consulta_variavel);
                    repDiagnosticoConsulta.SaveChanges();

                    return _tb_diagnostico_consulta_variavel.IdConsultaVariavel;
                }
                catch (Exception e)
                {
                    throw new DadosException("DiagnosticoConsulta", e.Message, e);
                }
            }
            else
            {
                throw new NegocioException("Já foi cadastrado um Diagnóstico com essa Descrição de Diagnóstico e com esse Grupo Diagnóstico.");
            }
        }

        /// <summary>
        /// Atualiza dados do IntervencaoConsulta
        /// </summary>
        /// <param name="IntervencaoConsulta"></param>
        public void Atualizar(DiagnosticoConsultaModel DiagnosticoConsultaModel)
        {
            try
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel = repDiagnosticoConsulta.ObterEntidade(dC => dC.IdConsultaVariavel 
                    == DiagnosticoConsultaModel.IdConsultaVariavel && dC.IdDiagnostico == DiagnosticoConsultaModel.IdDiagnostico);
                Atribuir(DiagnosticoConsultaModel, _tb_diagnostico_consulta_variavel);

                repDiagnosticoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(string s1, string s2, string s3, string s4)
        {
            if (s1 != null && s2 != null && s3 != null && s4 != null )
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Remove dados do DiagnosticoConsulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idDiagnostico"></param>
        public void Remover(long idConsultaVariavel, long idDiagnostico)
        {
            try
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                repDiagnosticoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdDiagnostico == idDiagnostico);
                repDiagnosticoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsulta", e.Message, e);
            }
        }


        /// <summary>
        /// Remove dados do Diagnostico da consulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, int idDiagnostico)
        {
            try
            {
                var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
                repDiagnosticoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdDiagnostico == idDiagnostico);
                repDiagnosticoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoConsulta", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiagnosticoConsultaModel> GetQuery()
        {
            var repDiagnosticoConsulta = new RepositorioGenerico<tb_diagnostico_consulta_variavel>();
            var pvEntities = (pvEntities)repDiagnosticoConsulta.ObterContexto();
            var query = from tb_diagnostico_consulta_variavel in pvEntities.tb_diagnostico_consulta_variavel
                        join tb_diagnostico in pvEntities.tb_diagnostico
                        on tb_diagnostico_consulta_variavel.IdDiagnostico equals tb_diagnostico.IdDiagnostico
                        join tb_grupo_diagnostico in pvEntities.tb_grupo_diagnostico
                        on tb_diagnostico.IdGrupoDiagnostico equals tb_grupo_diagnostico.IdGrupoDiagnostico
                        select new DiagnosticoConsultaModel
                        {
                            IdConsultaVariavel = tb_diagnostico_consulta_variavel.IdConsultaVariavel,
                            IdDiagnostico = tb_diagnostico.IdDiagnostico,
                            Fatores = tb_diagnostico_consulta_variavel.Fatores,
                            CaracteristicasDefinidoras = tb_diagnostico_consulta_variavel.CaracteristicasDefinidoras,
                            AvaliacaoResultados = tb_diagnostico_consulta_variavel.AvaliacaoResultado,
                            PrescricaoCuidado = tb_diagnostico_consulta_variavel.PrescricaoCuidados,
                            ResultadoEsperado = tb_diagnostico_consulta_variavel.ResultadoEsperado,


                            DescricaoDiagnostico = tb_diagnostico.Diagnostico,
                            DescricaoGrupoDiagnostico = tb_grupo_diagnostico.DescricaoGrupo
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os DiagnosticoConsultaModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiagnosticoConsultaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DiagnosticoConsultaModel com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public IEnumerable<DiagnosticoConsultaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(DiagnosticoConsultaModel => DiagnosticoConsultaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtem consulta intervencao por consulta e intervencao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idIntervencao"></param>
        /// <returns></returns>
        public DiagnosticoConsultaModel ObterPorConsultaDiagnostico(long idConsultaVariavel, int idDiagnostico)
        {
            return GetQuery().Where(dc => dc.IdConsultaVariavel == idConsultaVariavel
                && dc.IdDiagnostico == idDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem consulta intervencao por consulta e intervencao e Grupo
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idIntervencao"></param>
        /// <returns></returns>
        public DiagnosticoConsultaModel ObterPorDiagnosticoGrupo(long idConsultaVariavel, int idDiagnostico, int idGrupoDiagnostico)
        {
            return GetQuery().Where(dc => dc.IdConsultaVariavel == idConsultaVariavel
                && dc.IdDiagnostico == idDiagnostico && dc.IdGrupoDiagnostico == idGrupoDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="DiagnosticoConsultaModel"></param>
        /// <param name="_tb_diagnostico_consulta_variavel"></param>
        private static void Atribuir(DiagnosticoConsultaModel DiagnosticoConsultaModel, tb_diagnostico_consulta_variavel _tb_diagnostico_consulta_variavel)
        {
            _tb_diagnostico_consulta_variavel.IdConsultaVariavel = DiagnosticoConsultaModel.IdConsultaVariavel;
            _tb_diagnostico_consulta_variavel.IdDiagnostico = DiagnosticoConsultaModel.IdDiagnostico;
            _tb_diagnostico_consulta_variavel.Fatores = DiagnosticoConsultaModel.Fatores;
            _tb_diagnostico_consulta_variavel.CaracteristicasDefinidoras = DiagnosticoConsultaModel.CaracteristicasDefinidoras;
            _tb_diagnostico_consulta_variavel.ResultadoEsperado = DiagnosticoConsultaModel.ResultadoEsperado;
            _tb_diagnostico_consulta_variavel.PrescricaoCuidados = DiagnosticoConsultaModel.PrescricaoCuidado;
            _tb_diagnostico_consulta_variavel.AvaliacaoResultado = DiagnosticoConsultaModel.AvaliacaoResultados;
        }
    }
}