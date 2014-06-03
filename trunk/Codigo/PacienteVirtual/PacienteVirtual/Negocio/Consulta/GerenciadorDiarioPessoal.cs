using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiarioPessoal
    {
        private static GerenciadorDiarioPessoal gDiarioPessoal;
        private GerenciadorDiarioPessoal() { }

        public static GerenciadorDiarioPessoal GetInstance()
        {
            if (gDiarioPessoal == null)
            {
                gDiarioPessoal = new GerenciadorDiarioPessoal();
            }
            return gDiarioPessoal;
        }

        /// <summary>
        /// Insere dados do DiarioPessoalModel
        /// </summary>
        /// <param name="DiarioPessoal"></param>
        /// <returns></returns>
        public long Inserir(DiarioPessoalModel DiarioPessoalModel)
        {
            var repDiarioPessoal = new RepositorioGenerico<tb_diario_pessoal>();
            tb_diario_pessoal _tb_diario_pessoal = new tb_diario_pessoal();
            try
            {
                Atribuir(DiarioPessoalModel, _tb_diario_pessoal);

                repDiarioPessoal.Inserir(_tb_diario_pessoal);
                repDiarioPessoal.SaveChanges();

                return _tb_diario_pessoal.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("DiarioPessoal", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do DiarioPessoalModel
        /// </summary>
        /// <param name="DiarioPessoal"></param>
        public void Atualizar(DiarioPessoalModel DiarioPessoalModel)
        {
            try
            {
                var repDiarioPessoal = new RepositorioGenerico<tb_diario_pessoal>();
                tb_diario_pessoal _tb_diario_pessoal = repDiarioPessoal.ObterEntidade(dP => dP.IdConsultaFixo == DiarioPessoalModel.IdConsultaFixo && dP.IdMedicamento == DiarioPessoalModel.IdMedicamento);
                Atribuir(DiarioPessoalModel, _tb_diario_pessoal);

                repDiarioPessoal.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiarioPessoal", e.Message, e);
            }
        }

        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(int IdMedicamento, int IdBebida)
        {
            if (IdBebida == 0 || IdMedicamento == 0)
            {
                throw new NegocioException("Atenção! Você esqueceu de selecionar uma ou mais campos.");
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Remove dados do diario pessoal especificando: consulta fixo, medicamento, horario e quantidade
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idMedicamento"></param>
        /// <param name="horario"></param>
        /// <param name="quantidade"></param>
        public void Remover(long idConsultaFixo, int idMedicamento, string horario, string quantidade)
        {
            try
            {
                var repDiarioPessoal = new RepositorioGenerico<tb_diario_pessoal>();
                repDiarioPessoal.Remover(dP => dP.IdConsultaFixo == idConsultaFixo && dP.IdMedicamento == idMedicamento && dP.Horario == horario && dP.Quantidade == quantidade);
                repDiarioPessoal.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiarioPessoal", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiarioPessoalModel> GetQuery()
        {
            var repDiarioPessoal = new RepositorioGenerico<tb_diario_pessoal>();
            var pvEntities = (pvEntities)repDiarioPessoal.ObterContexto();
            var query = from tb_diario_pessoal in pvEntities.tb_diario_pessoal
                        join tb_medicamentos in pvEntities.tb_medicamentos
                        on tb_diario_pessoal.IdMedicamento equals tb_medicamentos.IdMedicamento
                        join tb_bebida in pvEntities.tb_bebida
                        on tb_diario_pessoal.IdBebida equals tb_bebida.IdBebida
                        select new DiarioPessoalModel
                        {
                            IdConsultaFixo = tb_diario_pessoal.IdConsultaFixo,
                            IdMedicamento = tb_diario_pessoal.IdMedicamento,
                            Periodo = tb_diario_pessoal.Periodo,
                            Horario = tb_diario_pessoal.Horario,
                            Quantidade = tb_diario_pessoal.Quantidade,
                            IdBebida = tb_diario_pessoal.IdBebida,
                            HorarioComplemento = tb_diario_pessoal.HorarioComplemento,
                            Dose = tb_diario_pessoal.Dose,
                            Medicamento = tb_medicamentos.Nome,
                            NomeBebida = tb_bebida.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os DiarioPessoalModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiarioPessoalModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DiarioPessoalModel com o código da consulta fixa especificicado
        /// </summary>
        /// <param name="IdConsultaFixo"></param>
        /// <returns></returns>
        public IEnumerable<DiarioPessoalModel> Obter(long IdConsultaFixo)
        {
            return GetQuery().Where(DiarioPessoalModel => DiarioPessoalModel.IdConsultaFixo == IdConsultaFixo).OrderBy(DiarioPessoalModel => DiarioPessoalModel.Horario).ToList();
        }

        /// <summary>
        /// Obtem o diario pessoal especificando a consulta fixa e o medicamento
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <param name="idMendicamento"></param>
        /// <returns></returns>
        public DiarioPessoalModel ObterPorMedicamento(long idConsultaFixo, int idMendicamento)
        {
            return GetQuery().Where(dp => dp.IdConsultaFixo == idConsultaFixo && dp.IdMedicamento == idMendicamento).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="DiarioPessoal"></param>
        /// <param name="_tb_diario_pessoal"></param>
        private static void Atribuir(DiarioPessoalModel DiarioPessoalModel, tb_diario_pessoal _tb_diario_pessoal)
        {
            _tb_diario_pessoal.IdConsultaFixo = DiarioPessoalModel.IdConsultaFixo;
            _tb_diario_pessoal.IdMedicamento = DiarioPessoalModel.IdMedicamento;
            _tb_diario_pessoal.Periodo = DiarioPessoalModel.Periodo;
            _tb_diario_pessoal.Horario = DiarioPessoalModel.Horario;
            _tb_diario_pessoal.Quantidade = DiarioPessoalModel.Quantidade;
            _tb_diario_pessoal.IdBebida = DiarioPessoalModel.IdBebida;
            _tb_diario_pessoal.Dose = DiarioPessoalModel.Dose;
            _tb_diario_pessoal.HorarioComplemento = DiarioPessoalModel.HorarioComplemento;
        }

        /// <summary>
        /// Realiza a correção do medicamento prescrito de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="demoAntrop"></param>
        /// <param name="demoAntropGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<DiarioPessoalModel> listaDiario, IEnumerable<DiarioPessoalModel> listaDiarioPessoalGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var diario in listaDiario)
            {
                contem = false;
                foreach (var diarioGabarito in listaDiarioPessoalGabarito)
                {
                    if (diario.IdMedicamento == diarioGabarito.IdMedicamento)
                    {
                        contem = true;
                        if (!diario.Periodo.Equals(diarioGabarito.Periodo) || !diario.Horario.Equals(diarioGabarito.Horario) || !diario.HorarioComplemento.Equals(diarioGabarito.HorarioComplemento) || !diario.Dose.Equals(diarioGabarito.Dose) || !diario.Quantidade.Equals(diarioGabarito.Quantidade) || diario.IdBebida != diarioGabarito.IdBebida)
                        { 
                            erroRespostas = erroRespostas + "Gabarito correto do Medicamento "+  diarioGabarito.Medicamento + ": " + diarioGabarito.Periodo + ", " + diarioGabarito.Horario + "hrs, " + (diarioGabarito.HorarioComplemento == null || diarioGabarito.HorarioComplemento == "" ? "EM BRANCO" : diarioGabarito.HorarioComplemento) +  ", " + diarioGabarito.Dose + ", " + diarioGabarito.Quantidade + " e " + diarioGabarito.NomeBebida + ";" + "<br>";
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito += diario.Medicamento + "; " + "<br>";
                }
            }
            foreach (var diarioGabarito in listaDiarioPessoalGabarito)
            {
                contem = false;
                foreach (var diario in listaDiario)
                {
                    if (diario.IdMedicamento == diarioGabarito.IdMedicamento)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta += diarioGabarito.Medicamento + "; " + "<br>";
                }
            }
            modelState.AddModelError("ErroDiarioPessoal", (erroRespostas.Equals("") ? "" : erroRespostas + "<br>") +
                  (erroNaoContemNoGabarito.Equals("") ? "" : "Medicamentos que não contém no Gabarito: <br>" + erroNaoContemNoGabarito + "<br>") +
                  (erroContemGabaritoNaoContemResposta.Equals("") ? "" : "Medicamentos que não foram adicionados do Gabarito: <br>" + erroContemGabaritoNaoContemResposta));
        }
    }
}