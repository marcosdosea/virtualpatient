using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorMedicamentoNaoPrescrito
    {
        private static GerenciadorMedicamentoNaoPrescrito gMedicamentoNaoPrescrito;
        private GerenciadorMedicamentoNaoPrescrito() { }

        public static GerenciadorMedicamentoNaoPrescrito GetInstance()
        {
            if (gMedicamentoNaoPrescrito == null)
            {
                gMedicamentoNaoPrescrito = new GerenciadorMedicamentoNaoPrescrito();
            }
            return gMedicamentoNaoPrescrito;
        }

        /// <summary>
        /// Faz a correção do medicamentoNaoPrescristo de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="ListaMedNaoPresc"></param>
        /// <param name="listaMedNaoPrescGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<MedicamentoNaoPrescritoModel> ListaMedNaoPresc, IEnumerable<MedicamentoNaoPrescritoModel> listaMedNaoPrescGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var med in ListaMedNaoPresc)
            {
                contem = false;
                foreach (var medGabarito in listaMedNaoPrescGabarito)
                {
                    if (med.IdMedicamento == medGabarito.IdMedicamento)
                    {
                        contem = true;
                        if (med.Fitoterapico != medGabarito.Fitoterapico || !med.Dosagem.Equals(medGabarito.Dosagem) || !med.Posologia.Equals(medGabarito.Posologia))
                        {
                            erroRespostas = erroRespostas + "Gabarito do Medicamento: " + med.MedicamentoNome + ": " + (medGabarito.Fitoterapico == true ? "Sim" : "Não") + ", " + medGabarito.Dosagem + ", " + medGabarito.Posologia +  "; " + Environment.NewLine;
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + med.MedicamentoNome + ";<br>";
                }
            }
            foreach (var medGabarito in listaMedNaoPrescGabarito)
            {
                contem = false;
                foreach (var med in ListaMedNaoPresc)
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
            modelState.AddModelError("ErroListaMedNaoPresc", (erroRespostas.Equals("") ? " " : erroRespostas + "<br>") +
                (erroNaoContemNoGabarito.Equals("") ? " " : "Medicamentos que não contém no Gabarito: " + erroNaoContemNoGabarito + "<br>") +
                (erroContemGabaritoNaoContemResposta.Equals("") ? " " : "Medicamentos que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Insere dados do MedicamentoNaoPrescrito
        /// </summary>
        /// <param name="MedicamentoNaoPrescrito"></param>
        /// <returns></returns>
        public long Inserir(MedicamentoNaoPrescritoModel medicamentoNaoPrescritoModel)
        {
            var repMedicamentoNaoPrescrito = new RepositorioGenerico<tb_medicamento_nao_prescrito>();
            tb_medicamento_nao_prescrito _tb_medicamento_nao_prescrito = new tb_medicamento_nao_prescrito();
            try
            {
                Atribuir(medicamentoNaoPrescritoModel, _tb_medicamento_nao_prescrito);

                repMedicamentoNaoPrescrito.Inserir(_tb_medicamento_nao_prescrito);
                repMedicamentoNaoPrescrito.SaveChanges();

                return _tb_medicamento_nao_prescrito.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoNaoPrescrito", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do MedicamentoNaoPrescrito
        /// </summary>
        /// <param name="MedicamentoNaoPrescrito"></param>
        public void Atualizar(MedicamentoNaoPrescritoModel medicamentoNaoPrescritoModel)
        {
            try
            {
                var repMedicamentoNaoPrescrito = new RepositorioGenerico<tb_medicamento_nao_prescrito>();
                tb_medicamento_nao_prescrito _tb_medicamento_nao_prescrito = repMedicamentoNaoPrescrito.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentoNaoPrescritoModel.IdConsultaVariavel 
                    && dP.IdMedicamento == medicamentoNaoPrescritoModel.IdMedicamento);
                Atribuir(medicamentoNaoPrescritoModel, _tb_medicamento_nao_prescrito);

                repMedicamentoNaoPrescrito.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoNaoPrescrito", e.Message, e);
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
        /// Remove dados do MedicamentoNaoPrescrito
        /// </summary>
        /// <param long="idConsultaVariavel" long="idMedicamento"></param>
        public void Remover(long idConsultaVariavel, long idMedicamento)
        {
            try
            {
                var repMedicamentoNaoPrescrito = new RepositorioGenerico<tb_medicamento_nao_prescrito>();
                repMedicamentoNaoPrescrito.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel && dP.IdMedicamento == idMedicamento);
                repMedicamentoNaoPrescrito.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoNaoPrescrito", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<MedicamentoNaoPrescritoModel> GetQuery()
        {
            var repMedicamentoNaoPrescrito = new RepositorioGenerico<tb_medicamento_nao_prescrito>();
            var pvEntities = (pvEntities)repMedicamentoNaoPrescrito.ObterContexto();
            var query = from tb_medicamento_nao_prescrito in pvEntities.tb_medicamento_nao_prescrito
                        join tb_medicamentos in pvEntities.tb_medicamentos
                        on tb_medicamento_nao_prescrito.IdMedicamento equals tb_medicamentos.IdMedicamento
                        select new MedicamentoNaoPrescritoModel
                        {
                            IdConsultaVariavel = tb_medicamento_nao_prescrito.IdConsultaVariavel,
                            IdMedicamento = tb_medicamento_nao_prescrito.IdMedicamento,
                            Fitoterapico = tb_medicamento_nao_prescrito.Fitoterapico,
                            Dosagem = tb_medicamento_nao_prescrito.Dosagem,
                            Posologia = tb_medicamento_nao_prescrito.Posologia,

                            MedicamentoNome = tb_medicamentos.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os MedicamentoNaoPrescritoModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentoNaoPrescritoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém MedicamentoNaoPrescritoModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentoNaoPrescritoModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentoNaoPrescritoModel => MedicamentoNaoPrescritoModel.IdConsultaVariavel == idConsultaVariavel).ToList().OrderBy(m => m.MedicamentoNome).ToList();
        }

        /// <summary>
        /// obtem medicamentosNaoPrescritos por consulta e  medicamento
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        /// <param name="idMedicamento"></param>
        /// <returns></returns>
        public MedicamentoNaoPrescritoModel ObterPorConsultaMedicamento(long idConsultaVariavel, int idMedicamento)
        {
            return GetQuery().Where(MedicamentoNaoPrescritoModel => MedicamentoNaoPrescritoModel.IdConsultaVariavel == idConsultaVariavel && 
                MedicamentoNaoPrescritoModel.IdMedicamento == idMedicamento).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentoNaoPrescritoModel"></param>
        /// <param name="_tb_medicamento_nao_prescrito"></param>
        private static void Atribuir(MedicamentoNaoPrescritoModel medicamentoNaoPrescritoModel, tb_medicamento_nao_prescrito _tb_medicamento_nao_prescrito)
        {
            _tb_medicamento_nao_prescrito.IdConsultaVariavel = medicamentoNaoPrescritoModel.IdConsultaVariavel;
            _tb_medicamento_nao_prescrito.IdMedicamento = medicamentoNaoPrescritoModel.IdMedicamento;
            _tb_medicamento_nao_prescrito.Fitoterapico = medicamentoNaoPrescritoModel.Fitoterapico;
            _tb_medicamento_nao_prescrito.Dosagem = medicamentoNaoPrescritoModel.Dosagem;
            _tb_medicamento_nao_prescrito.Posologia = medicamentoNaoPrescritoModel.Posologia;

        }
    }
}