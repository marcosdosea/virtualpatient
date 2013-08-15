using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
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
        /// Insere dados do MedicamentosAnteriores
        /// </summary>
        /// <param name="medicamentosAnteriores"></param>
        /// <returns></returns>
        public long Inserir(MedicamentosAnterioresModel medicamentosAnterioresModel)
        {
            var repMedicamentosAnteriores = new RepositorioGenerico<MedicamentosAnterioresE>();
            MedicamentosAnterioresE _MedicamentosAnterioresE = new MedicamentosAnterioresE();
            try
            {
                Atribuir(medicamentosAnterioresModel, _MedicamentosAnterioresE);

                repMedicamentosAnteriores.Inserir(_MedicamentosAnterioresE);
                repMedicamentosAnteriores.SaveChanges();

                return _MedicamentosAnterioresE.IdConsultaVariavel;
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
                var repMedicamentosAnteriores = new RepositorioGenerico<MedicamentosAnterioresE>();
                MedicamentosAnterioresE _MedicamentosAnterioresE = repMedicamentosAnteriores.ObterEntidade(dP => dP.IdConsultaVariavel == medicamentosAnterioresModel.IdConsultaVariavel);
                Atribuir(medicamentosAnterioresModel, _MedicamentosAnterioresE);

                repMedicamentosAnteriores.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("MedicamentosAnteriores", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do MedicamentosAnteriores
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, long idMedicamento)
        {
            try
            {
                var repMedicamentosAnteriores = new RepositorioGenerico<MedicamentosAnterioresE>();
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
        /// Remove dados do MedicamentosAnteriores
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repMedicamentosAnteriores = new RepositorioGenerico<MedicamentosAnterioresE>();
                repMedicamentosAnteriores.Remover(mA => mA.IdConsultaVariavel == idConsultaVariavel);
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
            var repMedicamentosAnteriores = new RepositorioGenerico<MedicamentosAnterioresE>();
            var pvEntities = (pvEntities)repMedicamentosAnteriores.ObterContexto();
            var query = from tb_medicamentos_anteriores in pvEntities.tb_medicamentos_anteriores
                        select new MedicamentosAnterioresModel
                        {
                            IdConsultaVariavel = tb_medicamentos_anteriores.IdConsultaVariavel,
                            IdMedicamento = tb_medicamentos_anteriores.IdMedicamento,
                            Indicacao = tb_medicamentos_anteriores.Indicacao,
                            Resposta = tb_medicamentos_anteriores.Resposta,
                            Periodo = tb_medicamentos_anteriores.Periodo,
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
        /// Obtém MedicamentosAnteriores com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MedicamentosAnterioresModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentosAnterioresModel => MedicamentosAnterioresModel.IdConsultaVariavel == idConsultaVariavel);
        }

        /// <summary>
        /// Obtém MedicamentosAnteriores que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<MedicamentosAnterioresModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(MedicamentosAnterioresModel => MedicamentosAnterioresModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="medicamentosAnterioresModel"></param>
        /// <param name="_MedicamentosAnterioresE"></param>
        private static void Atribuir(MedicamentosAnterioresModel medicamentosAnterioresModel, MedicamentosAnterioresE _MedicamentosAnterioresE)
        {
            _MedicamentosAnterioresE.IdConsultaVariavel = medicamentosAnterioresModel.IdConsultaVariavel;
            _MedicamentosAnterioresE.IdMedicamento = medicamentosAnterioresModel.IdMedicamento;
            _MedicamentosAnterioresE.Indicacao = medicamentosAnterioresModel.Indicacao;
            _MedicamentosAnterioresE.Resposta = medicamentosAnterioresModel.Resposta;
            _MedicamentosAnterioresE.Periodo = medicamentosAnterioresModel.Periodo;
        }
    }
}