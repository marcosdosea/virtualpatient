using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
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
        /// Insere dados do MedicamentoNaoPrescrito
        /// </summary>
        /// <param name="MedicamentoNaoPrescrito"></param>
        /// <returns></returns>
        public long Inserir(MedicamentoNaoPrescritoModel medicamentoNaoPrescritoModel)
        {
            var repMedicamentoNaoPrescrito = new RepositorioGenerico<MedicamentoNaoPrescritoE>();
            MedicamentoNaoPrescritoE _MedicamentoNaoPrescritoE = new MedicamentoNaoPrescritoE();
            try
            {
                Atribuir(medicamentoNaoPrescritoModel, _MedicamentoNaoPrescritoE);

                repMedicamentoNaoPrescrito.Inserir(_MedicamentoNaoPrescritoE);
                repMedicamentoNaoPrescrito.SaveChanges();

                return _MedicamentoNaoPrescritoE.IdConsultaVariavel;
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
                var repMedicamentoNaoPrescrito = new RepositorioGenerico<MedicamentoNaoPrescritoE>();
                MedicamentoNaoPrescritoE _MedicamentoNaoPrescritoE = repMedicamentoNaoPrescrito.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentoNaoPrescritoModel.IdConsultaVariavel);
                Atribuir(medicamentoNaoPrescritoModel, _MedicamentoNaoPrescritoE);

                repMedicamentoNaoPrescrito.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentoNaoPrescrito", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do MedicamentoNaoPrescrito
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repMedicamentoNaoPrescrito = new RepositorioGenerico<MedicamentoNaoPrescritoE>();
                repMedicamentoNaoPrescrito.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
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
            var repMedicamentoNaoPrescrito = new RepositorioGenerico<MedicamentoNaoPrescritoE>();
            var pvEntities = (pvEntities)repMedicamentoNaoPrescrito.ObterContexto();
            var query = from tb_medicamento_nao_prescrito in pvEntities.tb_medicamento_nao_prescrito
                        select new MedicamentoNaoPrescritoModel
                        {
                            IdConsultaVariavel = tb_medicamento_nao_prescrito.IdConsultaVariavel,
                            IdMedicamento = tb_medicamento_nao_prescrito.IdMedicamento,
                            Fitoterapico = tb_medicamento_nao_prescrito.Fitoterapico,
                            Dosagem = tb_medicamento_nao_prescrito.Dosagem,
                            Posologia = tb_medicamento_nao_prescrito.Posologia,
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
        /// Obtém MedicamentoNaoPrescritoModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public MedicamentoNaoPrescritoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentoNaoPrescritoModel => MedicamentoNaoPrescritoModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém medicamentoNaoPrescrito que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<MedicamentoNaoPrescritoModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentoNaoPrescritoModel => MedicamentoNaoPrescritoModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentoNaoPrescritoModel"></param>
        /// <param name="_MedicamentoNaoPrescritoE"></param>
        private static void Atribuir(MedicamentoNaoPrescritoModel medicamentoNaoPrescritoModel, MedicamentoNaoPrescritoE _MedicamentoNaoPrescritoE)
        {
            _MedicamentoNaoPrescritoE.IdConsultaVariavel = medicamentoNaoPrescritoModel.IdConsultaVariavel;
            _MedicamentoNaoPrescritoE.IdMedicamento = medicamentoNaoPrescritoModel.IdMedicamento;
            _MedicamentoNaoPrescritoE.Fitoterapico = medicamentoNaoPrescritoModel.Fitoterapico;
            _MedicamentoNaoPrescritoE.Dosagem = medicamentoNaoPrescritoModel.Dosagem;
            _MedicamentoNaoPrescritoE.Posologia = medicamentoNaoPrescritoModel.Posologia;

        }
    }
}