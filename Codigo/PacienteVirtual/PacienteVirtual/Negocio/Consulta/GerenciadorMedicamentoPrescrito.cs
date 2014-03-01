﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorMedicamentoPrescrito
    {

        private static GerenciadorMedicamentoPrescrito gMedicamentoPrescrito;
        private GerenciadorMedicamentoPrescrito() { }

        public static GerenciadorMedicamentoPrescrito GetInstance()
        {
            if (gMedicamentoPrescrito == null)
            {
                gMedicamentoPrescrito = new GerenciadorMedicamentoPrescrito();
            }
            return gMedicamentoPrescrito;
        }

        /// <summary>
        /// Realiza a correção de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="demoAntrop"></param>
        /// <param name="demoAntropGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<MedicamentoPrescritoModel> ListaMedPresc, IEnumerable<MedicamentoPrescritoModel> listaMedPrescGabarito, ModelStateDictionary modelState)
        {
            MedicamentoPrescritoModel a = listaMedPrescGabarito.ElementAtOrDefault(0);
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var med in ListaMedPresc)
            {
                contem = false;
                foreach (var medGabarito in listaMedPrescGabarito)
                {
                    if (med.IdMedicamento == medGabarito.IdMedicamento)
                    {
                        contem = true;
                        if (med.Fitoterapico != medGabarito.Fitoterapico || !med.Dosagem.Equals(medGabarito.Dosagem) || !med.Posologia.Equals(medGabarito.Posologia) || !med.Prescritor.Equals(medGabarito.Prescritor) || !med.Especialidade.Equals(medGabarito.Especialidade))
                        {
                            erroRespostas = erroRespostas + "Gabarito Medicamento " + med.MedicamentoNome + ": " + (medGabarito.Fitoterapico == true ? "Sim" : "Não") + ", " + medGabarito.Dosagem + ", " + medGabarito.Posologia + ", " + medGabarito.Prescritor + " e " + medGabarito.Especialidade + ". \r\n"; 
                        }
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + med.MedicamentoNome + ".\r\n";
                }
            }
            foreach (var medGabarito in listaMedPrescGabarito)
            {
                contem = false;
                foreach (var med in ListaMedPresc)
                {
                    if (med.IdMedicamento == medGabarito.IdMedicamento)
                    {
                        contem = true;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + medGabarito.MedicamentoNome +". "+ Environment.NewLine;
                }
            }
            if (erroNaoContemNoGabarito.Length != 0 || erroRespostas.Length != 0 || erroContemGabaritoNaoContemResposta.Length != 0)
            {
                modelState.AddModelError("IdConsultaVariavel", "Medicamentos que não "+Environment.NewLine +"contém no Gabarito: " + erroNaoContemNoGabarito + Environment.NewLine + erroRespostas + Environment.NewLine +"Medicamentos que não foram adicionados: " + erroContemGabaritoNaoContemResposta);
            }
        }

        /// <summary>
        /// Insere dados do MedicamentoPrescrito
        /// </summary>
        /// <param name="MedicamentoPrescrito"></param>
        /// <returns></returns>
        public long Inserir(MedicamentoPrescritoModel medicamentoPrescritoModel)
        {
            var repMedicamentoPrescrito = new RepositorioGenerico<tb_medicamento_prescrito>();
            tb_medicamento_prescrito _tb_medicamento_prescrito = new tb_medicamento_prescrito();
            try
            {
                Atribuir(medicamentoPrescritoModel, _tb_medicamento_prescrito);

                repMedicamentoPrescrito.Inserir(_tb_medicamento_prescrito);
                repMedicamentoPrescrito.SaveChanges();

                return _tb_medicamento_prescrito.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoPrescrito", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do MedicamentoPrescrito
        /// </summary>
        /// <param name="MedicamentoPrescrito"></param>
        public void Atualizar(MedicamentoPrescritoModel medicamentoPrescritoModel)
        {
            try
            {
                var repMedicamentoPrescrito = new RepositorioGenerico<tb_medicamento_prescrito>();
                tb_medicamento_prescrito _tb_medicamento_prescrito = repMedicamentoPrescrito.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentoPrescritoModel.IdConsultaVariavel && dP.IdMedicamento == medicamentoPrescritoModel.IdMedicamento);
                Atribuir(medicamentoPrescritoModel, _tb_medicamento_prescrito);

                repMedicamentoPrescrito.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoPrescrito", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do MedicamentoPrescrito
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, long idMedicamento)
        {
            try
            {

                var repMedicamentoPrescrito = new RepositorioGenerico<tb_medicamento_prescrito>();
                repMedicamentoPrescrito.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel && dP.IdMedicamento == idMedicamento);
                repMedicamentoPrescrito.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoPrescrito", e.Message, e);
            }
        }


        /// <summary>
        /// Remove dados do MedicamentosPrescrito
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, int idMedicamento)
        {
            try
            {
                var repMedicamentoPrescrito = new RepositorioGenerico<tb_medicamento_prescrito>();
                repMedicamentoPrescrito.Remover(mP => mP.IdConsultaVariavel == idConsultaVariavel && mP.IdMedicamento == idMedicamento);
                repMedicamentoPrescrito.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoPrescrito", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<MedicamentoPrescritoModel> GetQuery()
        {
            var repMedicamentoPrescrito = new RepositorioGenerico<tb_medicamento_prescrito>();
            var pvEntities = (pvEntities)repMedicamentoPrescrito.ObterContexto();
            var query = from tb_medicamento_prescrito in pvEntities.tb_medicamento_prescrito
                        join tb_medicamentos in pvEntities.tb_medicamentos
                        on tb_medicamento_prescrito.IdMedicamento equals tb_medicamentos.IdMedicamento
                        select new MedicamentoPrescritoModel
                        {
                            IdConsultaVariavel = tb_medicamento_prescrito.IdConsultaVariavel,
                            IdMedicamento = tb_medicamento_prescrito.IdMedicamento,
                            Fitoterapico = (bool) tb_medicamento_prescrito.Fitoterapico,
                            Dosagem = tb_medicamento_prescrito.Dosagem,
                            Posologia = tb_medicamento_prescrito.Posologia,
                            Prescritor = tb_medicamento_prescrito.Prescritor,
                            Especialidade = tb_medicamento_prescrito.Especialidade,

                            MedicamentoNome = tb_medicamentos.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os MedicamentoPrescritoModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentoPrescritoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém MedicamentoPrescritoModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentoPrescritoModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentoPrescritoModel => MedicamentoPrescritoModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtém medicamentoPrescrito que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<MedicamentoPrescritoModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentoPrescritoModel => MedicamentoPrescritoModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        public MedicamentoPrescritoModel ObterPorMedicamento(long idConsultaVariavel, int idMendicamento)
        {
            return GetQuery().Where(cvq => cvq.IdConsultaVariavel == idConsultaVariavel && cvq.IdMedicamento == idMendicamento).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentoPrescritoModel"></param>
        /// <param name="_tb_medicamento_prescrito"></param>
        private static void Atribuir(MedicamentoPrescritoModel medicamentoPrescritoModel, tb_medicamento_prescrito _tb_medicamento_prescrito)
        {
            _tb_medicamento_prescrito.IdConsultaVariavel = medicamentoPrescritoModel.IdConsultaVariavel;
            _tb_medicamento_prescrito.IdMedicamento = medicamentoPrescritoModel.IdMedicamento;
            _tb_medicamento_prescrito.Fitoterapico = medicamentoPrescritoModel.Fitoterapico;
            _tb_medicamento_prescrito.Dosagem = medicamentoPrescritoModel.Dosagem;
            _tb_medicamento_prescrito.Posologia = medicamentoPrescritoModel.Posologia;
            _tb_medicamento_prescrito.Prescritor = medicamentoPrescritoModel.Prescritor;
            _tb_medicamento_prescrito.Especialidade = medicamentoPrescritoModel.Especialidade;

        }

    }
}