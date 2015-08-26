using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorMedicamentosAnteriores
    {

        private static GerenciadorMedicamentosAnteriores gMedicamentosAnteriores;
        private GerenciadorMedicamentosAnteriores() { }

        public static GerenciadorMedicamentosAnteriores GetInstance()
        {
            if (gMedicamentosAnteriores == null)
            {
                gMedicamentosAnteriores = new GerenciadorMedicamentosAnteriores();
            }
            return gMedicamentosAnteriores;
        }

        /// <summary>
        /// Faz a correção dos MedicamentosAnteriores de acordo com o gabarito
        /// </summary>
        /// <param name="ListaMedAnt"></param>
        /// <param name="listaMedAntGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<MedicamentosAnterioresModel> ListaMedAnt, IEnumerable<MedicamentosAnterioresModel> listaMedAntGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var med in ListaMedAnt)
            {
                contem = false;
                foreach (var medGabarito in listaMedAntGabarito)
                {
                    if (med.IdMedicamento == medGabarito.IdMedicamento)
                    {
                        contem = true;
                        if (!med.Indicacao.Equals(medGabarito.Indicacao) || !med.Resposta.Equals(medGabarito.Resposta) || !med.Periodo.Equals(medGabarito.Periodo))
                        {
                            erroRespostas = erroRespostas + "Gabarito do Medicamento: " + med.MedicamentoNome + ": " + medGabarito.Indicacao + ", " + medGabarito.Resposta + " e " + medGabarito.Periodo + "; " + Environment.NewLine;
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + med.MedicamentoNome + "; " + Environment.NewLine;
                }
            }
            foreach (var medGabarito in listaMedAntGabarito)
            {
                contem = false;
                foreach (var med in ListaMedAnt)
                {
                    if (med.IdMedicamento == medGabarito.IdMedicamento)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + medGabarito.MedicamentoNome + ";<br>";
                }
            }
            modelState.AddModelError("ErroMedAnt", (erroRespostas.Equals("") ? " " : erroRespostas + "<br>") +
                (erroNaoContemNoGabarito.Equals("") ? " " : "Medicamentos que não contém no Gabarito: " + erroNaoContemNoGabarito + "<br>") +
                (erroContemGabaritoNaoContemResposta.Equals("") ? " " : "Medicamentos que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Insere dados do MedicamentosAnteriores
        /// </summary>
        /// <param name="medicamentosAnteriores"></param>
        /// <returns></returns>
        public long Inserir(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            var repMedicamentosAnteriores = new RepositorioGenerico<tb_medicamentos_anteriores>();
            tb_medicamentos_anteriores _tb_medicamentos_anteriores = new tb_medicamentos_anteriores();
            try
            {
                Atribuir(medicamentosAnterioresModel, _tb_medicamentos_anteriores);

                repMedicamentosAnteriores.Inserir(_tb_medicamentos_anteriores);
                repMedicamentosAnteriores.SaveChanges();

                return _tb_medicamentos_anteriores.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentosAnteriores", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do MedicamentosAnteriores
        /// </summary>
        /// <param name="medicamentosAnterioresModel"></param>
        public void Atualizar(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            try
            {
                var repMedicamentosAnteriores = new RepositorioGenerico<tb_medicamentos_anteriores>();
                tb_medicamentos_anteriores _tb_medicamentos_anteriores = repMedicamentosAnteriores.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentosAnterioresModel.IdConsultaVariavel
                    && dP.IdMedicamento == medicamentosAnterioresModel.IdMedicamento);
                Atribuir(medicamentosAnterioresModel, _tb_medicamentos_anteriores);

                repMedicamentosAnteriores.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentosAnteriores", e.Message, e);
            }
        }

        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(int parametro1)
        {
            if (parametro1 == 0)
            {
                throw new NegocioException("Atenção! Você esqueceu de selecionar uma ou mais campos.");
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Remove dados do MedicamentosAnteriores
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idMedicamento"></param>
        public void Remover(long idConsultaVariavel, long idMedicamento)
        {
            try
            {
                var repMedicamentosAnteriores = new RepositorioGenerico<tb_medicamentos_anteriores>();
                repMedicamentosAnteriores.Remover(mA => mA.IdConsultaVariavel == idConsultaVariavel
                    && mA.IdMedicamento == idMedicamento);
                repMedicamentosAnteriores.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentosAnteriores", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<MedicamentosAnterioresModel> GetQuery()
        {
            var repMedicamentosAnteriores = new RepositorioGenerico<tb_medicamentos_anteriores>();
            var pvEntities = (pvEntities)repMedicamentosAnteriores.ObterContexto();
            var query = from tb_medicamentos_anteriores in pvEntities.tb_medicamentos_anteriores
                        join tb_medicamentos in pvEntities.tb_medicamentos
                        on tb_medicamentos_anteriores.IdMedicamento equals tb_medicamentos.IdMedicamento
                        select new MedicamentosAnterioresModel
                        {
                            IdConsultaVariavel = tb_medicamentos_anteriores.IdConsultaVariavel,
                            IdMedicamento = tb_medicamentos_anteriores.IdMedicamento,
                            Indicacao = tb_medicamentos_anteriores.Indicacao,
                            Resposta = tb_medicamentos_anteriores.Resposta,
                            Periodo = tb_medicamentos_anteriores.Periodo,

                            MedicamentoNome = tb_medicamentos.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os MedicamentosAnteriores cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentosAnterioresModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém MedicamentosAnteriores com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentosAnterioresModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentosAnterioresModel => MedicamentosAnterioresModel.IdConsultaVariavel == idConsultaVariavel).OrderBy(m => m.MedicamentoNome).ToList();
        }

        /// <summary>
        /// Obtem medicamentoAnterior de acordo com a consulta e com o medicamento
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idMedicamento"></param>
        /// <returns></returns>
        public MedicamentosAnterioresModel ObterPorConsultaMedicamento(long idConsultaVariavel, int idMedicamento)
        {
            return GetQuery().Where(MedicamentosAnterioresModel => MedicamentosAnterioresModel.IdConsultaVariavel == idConsultaVariavel &&
                MedicamentosAnterioresModel.IdMedicamento == idMedicamento).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentosAnterioresModel"></param>
        /// <param name="_tb_medicamentos_anteriores"></param>
        private static void Atribuir(MedicamentosAnterioresModel medicamentosAnterioresModel, tb_medicamentos_anteriores _tb_medicamentos_anteriores)
        {
            _tb_medicamentos_anteriores.IdConsultaVariavel = medicamentosAnterioresModel.IdConsultaVariavel;
            _tb_medicamentos_anteriores.IdMedicamento = medicamentosAnterioresModel.IdMedicamento;
            _tb_medicamentos_anteriores.Indicacao = medicamentosAnterioresModel.Indicacao;
            _tb_medicamentos_anteriores.Resposta = medicamentosAnterioresModel.Resposta;
            _tb_medicamentos_anteriores.Periodo = medicamentosAnterioresModel.Periodo;
        }
    }
}