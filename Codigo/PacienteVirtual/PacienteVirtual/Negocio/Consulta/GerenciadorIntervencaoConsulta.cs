using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorIntervencaoConsulta
    {
        private static GerenciadorIntervencaoConsulta gIntervencaoConsulta;
        private GerenciadorIntervencaoConsulta() { }

        public static GerenciadorIntervencaoConsulta GetInstance()
        {
            if (gIntervencaoConsulta == null)
            {
                gIntervencaoConsulta = new GerenciadorIntervencaoConsulta();
            }
            return gIntervencaoConsulta;
        }

        /// <summary>
        /// Realiza a correção da consulta intervencao de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="listaIntervencao"></param>
        /// <param name="listaintervencaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<IntervencaoConsultaModel> listaIntervencao, IEnumerable<IntervencaoConsultaModel> listaintervencaoGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var intervencao in listaIntervencao)
            {
                contem = false;
                foreach (var intervencaoGabarito in listaintervencaoGabarito)
                {
                    if (intervencao.IdIntervencao == intervencaoGabarito.IdIntervencao)
                    {
                        contem = true;
                        if (intervencao.Paciente != intervencaoGabarito.Paciente || intervencao.Outro != intervencaoGabarito.Outro || 
                            !intervencao.Justificativa.Equals(intervencaoGabarito.Justificativa))
                        {
                            erroRespostas = erroRespostas + "Gabarito da Intervenção: " + intervencao.DescricaoIntervencao + ": " +
                                (intervencaoGabarito.Paciente == true ? "Sim" : "Não") + ", " + (intervencaoGabarito.Outro == true ? "Sim" : "Não") + 
                                " e " + intervencaoGabarito.Justificativa + "; " + "<br>";
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + intervencao.DescricaoIntervencao + "; " + "<br>";
                }
            }
            foreach (var intervencaoGabarito in listaintervencaoGabarito)
            {
                contem = false;
                foreach (var intervencao in listaIntervencao)
                {
                    if (intervencao.IdIntervencao == intervencaoGabarito.IdIntervencao)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + intervencaoGabarito.DescricaoIntervencao + "; " + "<br>";
                }
            }
            modelState.AddModelError("ErroIntervencao", (erroRespostas.Equals("") ? "" : erroRespostas + "<br>") +
                (erroNaoContemNoGabarito.Equals("") ? "" : "Medicamentos que não contém no Gabarito: " + erroNaoContemNoGabarito + "<br>") +
                (erroContemGabaritoNaoContemResposta.Equals("") ? "" : "Medicamentos que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Insere dados do IntervencaoConsulta
        /// </summary>
        /// <param name="IntervencaoConsulta"></param>
        /// <returns></returns>
        public long Inserir(IntervencaoConsultaModel IntervencaoConsultaModel)
        {
            var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
            tb_consulta_variavel_intervencao _tb_consulta_variavel_intervencao = new tb_consulta_variavel_intervencao();
            try
            {
                Atribuir(IntervencaoConsultaModel, _tb_consulta_variavel_intervencao);

                repIntervencaoConsulta.Inserir(_tb_consulta_variavel_intervencao);
                repIntervencaoConsulta.SaveChanges();

                return _tb_consulta_variavel_intervencao.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do IntervencaoConsulta
        /// </summary>
        /// <param name="IntervencaoConsulta"></param>
        public void Atualizar(IntervencaoConsultaModel IntervencaoConsultaModel)
        {
            try
            {
                var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
                tb_consulta_variavel_intervencao _tb_consulta_variavel_intervencao = repIntervencaoConsulta.ObterEntidade(iC => iC.IdConsultaVariavel 
                    == IntervencaoConsultaModel.IdConsultaVariavel && iC.IdIntervencao == IntervencaoConsultaModel.IdIntervencao);
                Atribuir(IntervencaoConsultaModel, _tb_consulta_variavel_intervencao);

                repIntervencaoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do IntervencaoConsulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idIntervencao"></param>
        public void Remover(long idConsultaVariavel, long idIntervencao)
        {
            try
            {
                var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
                repIntervencaoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdIntervencao == idIntervencao);
                repIntervencaoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }


        /// <summary>
        /// Remove dados do Intervencao da consulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, int idIntervencao)
        {
            try
            {
                var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
                repIntervencaoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdIntervencao == idIntervencao);
                repIntervencaoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<IntervencaoConsultaModel> GetQuery()
        {
            var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
            var pvEntities = (pvEntities)repIntervencaoConsulta.ObterContexto();
            var query = from tb_consulta_variavel_intervencao in pvEntities.tb_consulta_variavel_intervencao
                        join tb_intervencao in pvEntities.tb_intervencao
                        on tb_consulta_variavel_intervencao.IdIntervencao equals tb_intervencao.IdIntervencao
                        select new IntervencaoConsultaModel
                        {
                            IdConsultaVariavel = tb_consulta_variavel_intervencao.IdConsultaVariavel,
                            IdIntervencao = tb_consulta_variavel_intervencao.IdIntervencao,
                            Paciente = (bool) tb_consulta_variavel_intervencao.comunicaPaciente,
                            Outro = (bool) tb_consulta_variavel_intervencao.comunicaOutro,
                            Justificativa = tb_consulta_variavel_intervencao.justificativa,

                            DescricaoGrupoIntervencao = tb_consulta_variavel_intervencao.tb_intervencao.tb_grupo_intervencao.Descricao,
                            DescricaoIntervencao = tb_intervencao.DescricaoIntervencao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os IntervencaoConsultaModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<IntervencaoConsultaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém IntervencaoConsultaModel com o código da consulta variavel especificiado
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <returns></returns>
        public IEnumerable<IntervencaoConsultaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(IntervencaoConsultaModel => IntervencaoConsultaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtem consulta intervencao por consulta e intervencao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idIntervencao"></param>
        /// <returns></returns>
        public IntervencaoConsultaModel ObterPorConsultaIntervencao(long idConsultaVariavel, int idIntervencao)
        {
            return GetQuery().Where(IntervencaoConsultaModel => IntervencaoConsultaModel.IdConsultaVariavel == idConsultaVariavel
                && IntervencaoConsultaModel.IdIntervencao == idIntervencao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="IntervencaoConsultaModel"></param>
        /// <param name="_tb_consulta_variavel_intervencao"></param>
        private static void Atribuir(IntervencaoConsultaModel IntervencaoConsultaModel, tb_consulta_variavel_intervencao _tb_consulta_variavel_intervencao)
        {
            _tb_consulta_variavel_intervencao.IdConsultaVariavel = IntervencaoConsultaModel.IdConsultaVariavel;
            _tb_consulta_variavel_intervencao.IdIntervencao = IntervencaoConsultaModel.IdIntervencao;
            _tb_consulta_variavel_intervencao.comunicaOutro = IntervencaoConsultaModel.Outro;
            _tb_consulta_variavel_intervencao.comunicaPaciente = IntervencaoConsultaModel.Paciente;
            _tb_consulta_variavel_intervencao.justificativa = IntervencaoConsultaModel.Justificativa;

        }
    }
}