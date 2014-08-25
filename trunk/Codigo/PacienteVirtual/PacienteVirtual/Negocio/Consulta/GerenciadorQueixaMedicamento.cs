using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;
using PacienteVirtual.Controllers;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorQueixaMedicamento
    {
        private static GerenciadorQueixaMedicamento gQueixaMedicamento;
        private GerenciadorQueixaMedicamento() { }

        public static GerenciadorQueixaMedicamento GetInstance()
        {
            if (gQueixaMedicamento == null)
            {
                gQueixaMedicamento = new GerenciadorQueixaMedicamento();
            }
            return gQueixaMedicamento;
        }

        /// <summary>
        /// Insere dados do QueixaMedicamento
        /// </summary>
        /// <param name="QueixaMedicamento"></param>
        /// <returns></returns>
        public long Inserir(QueixaMedicamentoModel queixaMedicamentoModel)
        {
            var repQueixaMedicamento = new RepositorioGenerico<tb_queixa_medicamentos>();
            tb_queixa_medicamentos _tb_queixa_medicamentos = new tb_queixa_medicamentos();
            try
            {
                Atribuir(queixaMedicamentoModel, _tb_queixa_medicamentos);

                repQueixaMedicamento.Inserir(_tb_queixa_medicamentos);
                repQueixaMedicamento.SaveChanges();

                return _tb_queixa_medicamentos.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("QueixaMedicamento", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do QueixaMedicamento
        /// </summary>
        /// <param name="QueixaMedicamento"></param>
        public void Atualizar(QueixaMedicamentoModel queixaMedicamentoModel)
        {
            try
            {
                var repQueixaMedicamento = new RepositorioGenerico<tb_queixa_medicamentos>();
                tb_queixa_medicamentos _tb_queixa_medicamentos = repQueixaMedicamento.ObterEntidade(dP => dP.IdConsultaVariavel == queixaMedicamentoModel.IdConsultaVariavel
                    && dP.IdQueixa == queixaMedicamentoModel.IdQueixaMedicamento && dP.IdMedicamento == queixaMedicamentoModel.IdMedicamento);
                Atribuir(queixaMedicamentoModel, _tb_queixa_medicamentos);

                repQueixaMedicamento.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("QueixaMedicamento", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do QueixaMedicamento
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idMedicamento"></param>
        /// <param name="idQueixa"></param>
        public void Remover(long idConsultaVariavel, int idMedicamento, int idQueixa)
        {
            try
            {
                var repQueixaMedicamento = new RepositorioGenerico<tb_queixa_medicamentos>();
                repQueixaMedicamento.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel && dP.IdMedicamento == idMedicamento && dP.IdQueixa == idQueixa);
                repQueixaMedicamento.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("QueixaMedicamento", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<QueixaMedicamentoModel> GetQuery()
        {
            var repQueixaMedicamento = new RepositorioGenerico<tb_queixa_medicamentos>();
            var pvEntities = (pvEntities)repQueixaMedicamento.ObterContexto();
            var query = from tb_queixa_medicamentos in pvEntities.tb_queixa_medicamentos
                        join tb_medicamentos in pvEntities.tb_medicamentos
                        on tb_queixa_medicamentos.IdMedicamento equals tb_medicamentos.IdMedicamento
                        select new QueixaMedicamentoModel
                        {
                            IdConsultaVariavel = tb_queixa_medicamentos.IdConsultaVariavel,
                            IdMedicamento = tb_queixa_medicamentos.IdMedicamento,
                            IdQueixaMedicamento = tb_queixa_medicamentos.IdQueixa,
                            IdSuspeitaPRM = tb_queixa_medicamentos.IdSuspeitaPRM,
                            IdAcaoQueixa1 = tb_queixa_medicamentos.IdAcaoQueixa1,
                            IdAcaoQueixa2 = tb_queixa_medicamentos.IdAcaoQueixa2,

                            Desde = tb_queixa_medicamentos.Desde,
                            Dose = tb_queixa_medicamentos.Dose,
                            Cumprimento = tb_queixa_medicamentos.Cumprimento,
                            Efetivo = tb_queixa_medicamentos.Efetivo,
                            Necessario = tb_queixa_medicamentos.Necessario,
                            Seguro = tb_queixa_medicamentos.Seguro,
                            Resolvido = tb_queixa_medicamentos.Resolvido,

                            NomeMedicamento = tb_medicamentos.Nome,
                            SuspeitaPRM = tb_queixa_medicamentos.tb_suspeita_prm.Descricao,
                            DescricaoAcaoQueixa1 = tb_queixa_medicamentos.tb_acao_queixa.DescricaoAcao,
                            DescricaoAcaoQueixa2 = tb_queixa_medicamentos.tb_acao_queixa1.DescricaoAcao,
                            Queixa = tb_queixa_medicamentos.tb_consulta_variavel_queixa.tb_queixa.DescricaoQueixa
                            
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os QueixaMedicamentoModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<QueixaMedicamentoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém QueixaMedicamentoModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<QueixaMedicamentoModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(QueixaMedicamentoModel => QueixaMedicamentoModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// obtem queixa medicamento por consulta, queixa e medicamento
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idQueixa"></param>
        /// <param name="idMedicamento"></param>
        /// <returns></returns>
        public QueixaMedicamentoModel ObterPorConsultaQueixaMedicamento(long idConsultaVariavel, int idMedicamento, int idQueixa)
        {
            return GetQuery().Where(qmm => qmm.IdConsultaVariavel == idConsultaVariavel && qmm.IdQueixaMedicamento == idQueixa
                && qmm.IdMedicamento == idMedicamento).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(int IdAcaoQueixa1, int IdAcaoQueixa2, int IdMedicamento, int IdQueixaMedicamento, int IdSuspeitaPRM)
        {
            if (IdAcaoQueixa1 == 0 || IdAcaoQueixa2 == 0 || IdMedicamento == 0 || IdQueixaMedicamento == 0 || IdSuspeitaPRM == 0)
            {
                throw new NegocioException("Atenção! Você esqueceu de selecionar uma ou mais campos.");
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="queixaMedicamentoModel"></param>
        /// <param name="_tb_queixa_medicamentos"></param>
        private static void Atribuir(QueixaMedicamentoModel queixaMedicamentoModel, tb_queixa_medicamentos _tb_queixa_medicamentos)
        {
            _tb_queixa_medicamentos.IdConsultaVariavel = queixaMedicamentoModel.IdConsultaVariavel;
            _tb_queixa_medicamentos.IdMedicamento = queixaMedicamentoModel.IdMedicamento;
            _tb_queixa_medicamentos.IdQueixa = queixaMedicamentoModel.IdQueixaMedicamento;
            _tb_queixa_medicamentos.IdSuspeitaPRM = queixaMedicamentoModel.IdSuspeitaPRM;
            _tb_queixa_medicamentos.IdAcaoQueixa1 = queixaMedicamentoModel.IdAcaoQueixa1;
            _tb_queixa_medicamentos.IdAcaoQueixa2 = queixaMedicamentoModel.IdAcaoQueixa2;
            _tb_queixa_medicamentos.Resolvido = queixaMedicamentoModel.Resolvido;
            _tb_queixa_medicamentos.Desde = queixaMedicamentoModel.Desde;
            _tb_queixa_medicamentos.Dose = queixaMedicamentoModel.Dose;
            _tb_queixa_medicamentos.Efetivo = queixaMedicamentoModel.Efetivo;
            _tb_queixa_medicamentos.Seguro = queixaMedicamentoModel.Seguro;
            _tb_queixa_medicamentos.Necessario = queixaMedicamentoModel.Necessario;
            _tb_queixa_medicamentos.Cumprimento = queixaMedicamentoModel.Cumprimento;
        }

        /// <summary>
        /// Faz correção de queixa medicamento da consulta de acordo com o gabarito
        /// </summary>
        /// <param name="listaConsultVarQueixa"></param>
        /// <param name="ListaConsultVarQueixaGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<QueixaMedicamentoModel> listaQueixaMedi, IEnumerable<QueixaMedicamentoModel> listaQueixaMedGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var queixa in listaQueixaMedi)
            {
                contem = false;
                foreach (var queixaGabarito in listaQueixaMedGabarito)
                {
                    if (queixa.IdQueixaMedicamento == queixaGabarito.IdQueixaMedicamento)
                    {
                        contem = true;
                        if (queixa.IdMedicamento != queixaGabarito.IdMedicamento || !queixa.Dose.Equals(queixaGabarito.Dose) || !queixa.Desde.Equals(queixaGabarito.Desde) || queixa.Necessario != queixaGabarito.Necessario || queixa.Efetivo != queixaGabarito.Efetivo || queixa.Seguro != queixaGabarito.Seguro || queixa.Cumprimento != queixaGabarito.Cumprimento || queixa.IdSuspeitaPRM != queixaGabarito.IdSuspeitaPRM || queixa.IdAcaoQueixa1 != queixaGabarito.IdAcaoQueixa1 || queixa.IdAcaoQueixa2 != queixaGabarito.IdAcaoQueixa2 || queixa.Resolvido != queixaGabarito.Resolvido)
                        {
                            erroRespostas += queixaGabarito.Queixa + ": " + queixaGabarito.NomeMedicamento + "; " + queixaGabarito.Dose + "; " + queixaGabarito.Desde + "; Necessário: " + (queixaGabarito.Necessario == true ? "Sim" : "Não") + "; Efetivo: " + (queixaGabarito.Efetivo == true ? "Sim" : "Não") + "; Seguro: " + (queixaGabarito.Seguro == true ? "Sim" : "Não") + "; Cumprimento: " + (queixaGabarito.Cumprimento == true ? "Sim" : "Não") +  "; PRM: " + queixaGabarito.SuspeitaPRM + "; Intervenção 1: " + queixaGabarito.DescricaoAcaoQueixa1 + "; Intervenção 2: " + queixaGabarito.DescricaoAcaoQueixa2 + "; Resolvido: "+queixaGabarito.Resolvido+".<br>";
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito += queixa.Queixa + " - " + queixa.NomeMedicamento + "<br>";
                }
            }
            foreach (var queixaGabarito in listaQueixaMedGabarito)
            {
                contem = false;
                foreach (var queixa in listaQueixaMedi)
                {
                    if (queixa.IdQueixaMedicamento == queixaGabarito.IdQueixaMedicamento)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta += queixaGabarito.NomeMedicamento + ";<br>";
                }
            }
            SessionController.ErroQueixaMedicamento = (erroRespostas.Equals("") ? "" : "Gabarito dos Medicamentos relacionados:<br>" + erroRespostas + "<br>") +
                  (erroNaoContemNoGabarito.Equals("") ? "" : "Problemas que não contém no Gabarito: <br>" + erroNaoContemNoGabarito + "<br>") +
                  (erroContemGabaritoNaoContemResposta.Equals("") ? "" : "Problemas que não foram adicionados do Gabarito: <br>" + erroContemGabaritoNaoContemResposta);
        }
    }
}