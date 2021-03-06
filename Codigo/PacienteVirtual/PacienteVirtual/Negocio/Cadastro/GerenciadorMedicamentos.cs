﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorMedicamentos
    {
        private static GerenciadorMedicamentos gMedicamentos;

        private GerenciadorMedicamentos()
        {
        }

        public static GerenciadorMedicamentos GetInstance()
        {
            if (gMedicamentos == null)
            {
                gMedicamentos = new GerenciadorMedicamentos();
            }
            return gMedicamentos;
        }

        /// <summary>
        /// Insere dados do medicamento
        /// </summary>
        /// <param name="medicamento"></param>
        /// <returns></returns>
        public int Inserir(MedicamentosModel medicamentos)
        {
            var repMedicamentos = new RepositorioGenerico<tb_medicamentos>();
            tb_medicamentos _medicamentosE = new tb_medicamentos();
            try
            {
                Atribuir(medicamentos, _medicamentosE);

                repMedicamentos.Inserir(_medicamentosE);
                repMedicamentos.SaveChanges();

                return _medicamentosE.IdMedicamento;
            }
            catch (Exception e)
            {
                throw new NegocioException(e.Message);
                //throw new DadosException("Medicamentos", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do medicamentos
        /// </summary>
        /// <param name="medicamentos"></param>
        public void Atualizar(MedicamentosModel medicamentos)
        {
            try
            {
                var repMedicamentos = new RepositorioGenerico<tb_medicamentos>();
                tb_medicamentos _medicamentosE = repMedicamentos.ObterEntidade(d => d.IdMedicamento == medicamentos.IdMedicamento);
                Atribuir(medicamentos, _medicamentosE);

                repMedicamentos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Medicamentos", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do medicamento
        /// </summary>
        /// <param name="idMedicamentos"></param>
        public void Remover(int idMedicamentos)
        {
            try
            {
                var repMedicamentos = new RepositorioGenerico<tb_medicamentos>();
                repMedicamentos.Remover(d => d.IdMedicamento == idMedicamentos);
                repMedicamentos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Medicamentos", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<MedicamentosModel> GetQuery()
        {
            var repMedicamentos = new RepositorioGenerico<tb_medicamentos>();
            var pvEntities = (pvEntities)repMedicamentos.ObterContexto();
            var query = from medicamentos in pvEntities.tb_medicamentos
                        select new MedicamentosModel
                        {
                            IdMedicamento = medicamentos.IdMedicamento,
                            Nome = medicamentos.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os medicamentos cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentosModel> ObterTodos()
        {
            return GetQuery().ToList().OrderBy(med => med.Nome);
        }

        /// <summary>
        /// Obtém medicamentos com o código especificiado
        /// </summary>
        /// <param name="idMedicamentos"></param>
        /// <returns></returns>
        public MedicamentosModel Obter(int idMedicamentos)
        {
            return GetQuery().Where(medicamentos => medicamentos.IdMedicamento == idMedicamentos).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém medicamentos que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<MedicamentosModel> ObterPorNome(string nome)
        {
            return GetQuery().Where(medicamentos => medicamentos.Nome.StartsWith(nome)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentos"></param>
        /// <param name="_medicamentosE"></param>
        private static void Atribuir(MedicamentosModel medicamentos, tb_medicamentos _medicamentosE)
        {
            _medicamentosE.Nome = medicamentos.Nome;
        }
    }
}