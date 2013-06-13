using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;
using Negocio;
using PacienteVirtual.Models.ViewModel;

namespace PacienteVirtual.Models.Negocio
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
            var repPaciente = new RepositorioGenerico<PacienteE>();
            PacienteE _tb_paciente = new PacienteE();
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
                var repPaciente = new RepositorioGenerico<PacienteE>();
                PacienteE _tb_paciente = repPaciente.ObterEntidade(d => d.IdPaciente == paciente.IdPaciente);
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
                var repPaciente = new RepositorioGenerico<PacienteE>();
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
            var repPaciente = new RepositorioGenerico<PacienteE>();
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
        /// Consulta para retornar dados da entidade paciente com seus relatos
        /// </summary>
        /// <returns></returns>
        //private IQueryable<VMPaciente> GetQueryRelatos()
        //{
        //    var repPaciente = new RepositorioGenerico<PacienteE>();
        //    var pvEntities = (pvEntities)repPaciente.ObterContexto();
        //    var query = from pacient in pvEntities.tb_paciente
        //                join relatos in pvEntities.tb_relato_clinico
        //               on pacient.IdPaciente equals relatos.IdPaciente 
        //                select new VMPaciente
        //                {
        //                    paciente = pacient,
        //                    relatosClinico = orderGroup as List<RelatoClinicoModel>
   
        //                };
        //    return query;
        //}

        /// <summary>
        /// Obtém todos os pacientes cadastradas
        /// </summary>
        /// <returns></returns>
        //public IEnumerable<VMPaciente> ObterTodosVM()
        //{
        //    return GetQueryRelatos().ToList();
        //}

        /// <summary>
        /// Obtém todos os pacientes cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PacienteModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Paciente com o código especificiado
        /// </summary>
        /// <param name="idPaciente"></param>
        /// <returns></returns>
        public PacienteModel Obter(int idPaciente)
        {
            return GetQuery().Where(paciente => paciente.IdPaciente == idPaciente).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<PacienteModel> ObterPorNome(string nome)
        {
            return GetQuery().Where(paciente => paciente.NomePaciente.StartsWith(nome)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="paciente"></param>
        /// <param name="_tb_paciente"></param>
        private static void Atribuir(PacienteModel paciente, PacienteE _tb_paciente)
        {
            //_tb_paciente.IdPaciente = paciente.IdPaciente;
            _tb_paciente.Nome = paciente.NomePaciente;
            _tb_paciente.Foto = paciente.Foto;
        }
    }
}