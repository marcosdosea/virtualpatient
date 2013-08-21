using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

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
                tb_medicamento_nao_prescrito _tb_medicamento_nao_prescrito = repMedicamentoNaoPrescrito.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentoNaoPrescritoModel.IdConsultaVariavel);
                Atribuir(medicamentoNaoPrescritoModel, _tb_medicamento_nao_prescrito);

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
        /// Remove dados do MedicamentoNaoPrescrito
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repMedicamentoNaoPrescrito = new RepositorioGenerico<tb_medicamento_nao_prescrito>();
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