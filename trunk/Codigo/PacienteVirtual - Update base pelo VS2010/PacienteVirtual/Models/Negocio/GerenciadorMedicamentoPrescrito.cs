using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
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
        /// Insere dados do MedicamentoPrescrito
        /// </summary>
        /// <param name="MedicamentoPrescrito"></param>
        /// <returns></returns>
        public long Inserir(MedicamentoPrescritoModel medicamentoPrescritoModel)
        {
            var repMedicamentoPrescrito = new RepositorioGenerico<MedicamentoPrescritoE>();
            MedicamentoPrescritoE _MedicamentoPrescritoE = new MedicamentoPrescritoE();
            try
            {
                Atribuir(medicamentoPrescritoModel, _MedicamentoPrescritoE);

                repMedicamentoPrescrito.Inserir(_MedicamentoPrescritoE);
                repMedicamentoPrescrito.SaveChanges();

                return _MedicamentoPrescritoE.IdConsultaVariavel;
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
                var repMedicamentoPrescrito = new RepositorioGenerico<MedicamentoPrescritoE>();
                MedicamentoPrescritoE _MedicamentoPrescritoE = repMedicamentoPrescrito.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentoPrescritoModel.IdConsultaVariavel);
                Atribuir(medicamentoPrescritoModel, _MedicamentoPrescritoE);

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
        public void Remover(long idConsultaVariavel)
        {
            try
            {

                var repMedicamentoPrescrito = new RepositorioGenerico<MedicamentoPrescritoE>();
                repMedicamentoPrescrito.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
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
            var repMedicamentoPrescrito = new RepositorioGenerico<MedicamentoPrescritoE>();
            var pvEntities = (pvEntities)repMedicamentoPrescrito.ObterContexto();
            var query = from tb_medicamento_prescrito in pvEntities.tb_medicamento_prescrito
                        select new MedicamentoPrescritoModel
                        {
                            IdConsultaVariavel = tb_medicamento_prescrito.IdConsultaVariavel,
                            IdMedicamento = tb_medicamento_prescrito.IdMedicamento,
                            Fitoterapico = (bool) tb_medicamento_prescrito.Fitoterapico,
                            Dosagem = tb_medicamento_prescrito.Dosagem,
                            Posologia = tb_medicamento_prescrito.Posologia,
                            Prescritor = tb_medicamento_prescrito.Prescritor,
                            Especialidade = tb_medicamento_prescrito.Especialidade,
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
        public MedicamentoPrescritoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentoPrescritoModel => MedicamentoPrescritoModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
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

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentoPrescritoModel"></param>
        /// <param name="_MedicamentoPrescritoE"></param>
        private static void Atribuir(MedicamentoPrescritoModel medicamentoPrescritoModel, MedicamentoPrescritoE _MedicamentoPrescritoE)
        {
            _MedicamentoPrescritoE.IdConsultaVariavel = medicamentoPrescritoModel.IdConsultaVariavel;
            _MedicamentoPrescritoE.IdMedicamento = medicamentoPrescritoModel.IdMedicamento;
            _MedicamentoPrescritoE.Fitoterapico = medicamentoPrescritoModel.Fitoterapico;
            _MedicamentoPrescritoE.Dosagem = medicamentoPrescritoModel.Dosagem;
            _MedicamentoPrescritoE.Posologia = medicamentoPrescritoModel.Posologia;
            _MedicamentoPrescritoE.Prescritor = medicamentoPrescritoModel.Prescritor;
            _MedicamentoPrescritoE.Especialidade = medicamentoPrescritoModel.Especialidade;

        }

    }
}