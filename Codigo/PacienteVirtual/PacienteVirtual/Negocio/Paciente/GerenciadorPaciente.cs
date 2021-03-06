﻿using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPaciente
    {
        public static GerenciadorPaciente gPaciente;

        private GerenciadorPaciente()
        {
        }

        public static GerenciadorPaciente GetInstance()
        {
            if (gPaciente == null)
            {
                gPaciente = new GerenciadorPaciente();
            }
            return gPaciente;
        }

        /// <summary>
        /// inserir dados da paciente
        /// </summary>
        /// <param name="paciente"></param>
        /// <returns></returns>
        public int Inserir(PacienteModel paciente)
        {
            var repPaciente = new RepositorioGenerico<tb_paciente>();
            tb_paciente _tb_paciente = new tb_paciente();
            try
            {
                Atribuir(paciente, _tb_paciente);

                repPaciente.Inserir(_tb_paciente);
                repPaciente.SaveChanges();

                return _tb_paciente.IdPaciente;
            }
            catch (Exception e)
            {
                throw new NegocioException("Paciente", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Paciente
        /// </summary>
        /// <param name="paciente"></param>
        public void Atualizar(PacienteModel paciente)
        {
            try
            {
                var repPaciente = new RepositorioGenerico<tb_paciente>();
                tb_paciente _tb_paciente = repPaciente.ObterEntidade(d => d.IdPaciente == paciente.IdPaciente);
                Atribuir(paciente, _tb_paciente);

                repPaciente.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Paciente", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Paciente
        /// </summary>
        /// <param name="idPaciente"></param>
        public void Remover(int idPaciente)
        {
            try
            {
                var repPaciente = new RepositorioGenerico<tb_paciente>();
                repPaciente.Remover(d => d.IdPaciente == idPaciente);
                repPaciente.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Paciente", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PacienteModel> GetQuery()
        {
            var repPaciente = new RepositorioGenerico<tb_paciente>();
            var pvEntities = (pvEntities)repPaciente.ObterContexto();
            var query = from paciente in pvEntities.tb_paciente
                        select new PacienteModel
                        {
                            IdPaciente = paciente.IdPaciente,
                            NomePaciente = paciente.Nome,
                            Foto = paciente.Foto
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os pacientes cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PacienteModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Paciente com o código do paciente especificiado
        /// </summary>
        /// <param name="idPaciente"></param>
        /// <returns></returns>
        public PacienteModel Obter(int idPaciente)
        {
            return GetQuery().Where(paciente => paciente.IdPaciente == idPaciente).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem paciente de acordo com o Id retornando lista
        /// </summary>
        /// <param name="idPaciente"></param>
        /// <returns></returns>
        public IEnumerable<PacienteModel> ObterPorID(int idPaciente)
        {
            return GetQuery().Where(paciente => paciente.IdPaciente == idPaciente).ToList();
        }

        /// <summary>
        /// Obtém nome do paciente a partir do id
        /// </summary>
        /// <param name="idPaciente"></param>
        /// <returns></returns>
        public string ObterNomePorId(int idPaciente)
        {
            return GetQuery().Where(paciente => paciente.IdPaciente == idPaciente).ToList().ElementAtOrDefault(0).NomePaciente;
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="paciente"></param>
        /// <param name="_tb_paciente"></param>
        private static void Atribuir(PacienteModel paciente, tb_paciente _tb_paciente)
        {
            _tb_paciente.Nome = paciente.NomePaciente;
            _tb_paciente.Foto = paciente.Foto;
        }
    }
}