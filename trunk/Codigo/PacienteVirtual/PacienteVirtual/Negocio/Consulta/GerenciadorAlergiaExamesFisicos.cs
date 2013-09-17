using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Consulta;
using Persistence;
using PacienteVirtual.Models;

namespace PacienteVirtual.Negocio.Consulta
{
    public class GerenciadorAlergiaExamesFisicos
    {
        private static GerenciadorAlergiaExamesFisicos gAlergiaExamesFisicos;
        private GerenciadorAlergiaExamesFisicos() { }

        public static GerenciadorAlergiaExamesFisicos GetInstance()
        {
            if (gAlergiaExamesFisicos == null)
            {
                gAlergiaExamesFisicos = new GerenciadorAlergiaExamesFisicos();
            }
            return gAlergiaExamesFisicos;
        }

        /// <summary>
        /// Insere dados do AlergiaExamesFisicos
        /// </summary>
        /// <param name="AlergiaExamesFisicos"></param>
        /// <returns></returns>
        /*public long Inserir(AlergiaExamesFisicosModel alergiaExamesFisicosModel)
        {
            var repAlergiaExamesFisicos = new RepositorioGenerico<tb_medicamento_prescrito>();
            tb_medicamento_prescrito _tb_medicamento_prescrito = new tb_medicamento_prescrito();
            try
            {
                Atribuir(alergiaExamesFisicosModel, _tb_medicamento_prescrito);

                repAlergiaExamesFisicos.Inserir(_tb_medicamento_prescrito);
                repAlergiaExamesFisicos.SaveChanges();

                return _tb_medicamento_prescrito.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("AlergiaExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do AlergiaExamesFisicos
        /// </summary>
        /// <param name="AlergiaExamesFisicos"></param>
        public void Atualizar(AlergiaExamesFisicosModel alergiaExamesFisicosModel)
        {
            try
            {
                var repAlergiaExamesFisicos = new RepositorioGenerico<tb_medicamento_prescrito>();
                tb_medicamento_prescrito _tb_medicamento_prescrito = repAlergiaExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == alergiaExamesFisicosModel.IdConsultaVariavel);
                Atribuir(alergiaExamesFisicosModel, _tb_medicamento_prescrito);

                repAlergiaExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AlergiaExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do AlergiaExamesFisicos
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, long idMedicamento)
        {
            try
            {

                var repAlergiaExamesFisicos = new RepositorioGenerico<tb_medicamento_prescrito>();
                repAlergiaExamesFisicos.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel && dP.IdMedicamento == idMedicamento);
                repAlergiaExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AlergiaExamesFisicos", e.Message, e);
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
                var repAlergiaExamesFisicos = new RepositorioGenerico<tb_medicamento_prescrito>();
                repAlergiaExamesFisicos.Remover(mP => mP.IdConsultaVariavel == idConsultaVariavel && mP.IdMedicamento == idMedicamento);
                repAlergiaExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AlergiaExamesFisicos", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AlergiaExamesFisicosModel> GetQuery()
        {
            var repAlergiaExamesFisicos = new RepositorioGenerico<tb_medicamento_prescrito>();
            var pvEntities = (pvEntities)repAlergiaExamesFisicos.ObterContexto();
            var query = from tb_medicamento_prescrito in pvEntities.tb_medicamento_prescrito
                        join tb_medicamentos in pvEntities.tb_medicamentos
                        on tb_medicamento_prescrito.IdMedicamento equals tb_medicamentos.IdMedicamento
                        select new AlergiaExamesFisicosModel
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
        /// Obtém todos os AlergiaExamesFisicosModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AlergiaExamesFisicosModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém AlergiaExamesFisicosModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AlergiaExamesFisicosModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(AlergiaExamesFisicosModel => AlergiaExamesFisicosModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtém medicamentoPrescrito que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<AlergiaExamesFisicosModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(AlergiaExamesFisicosModel => AlergiaExamesFisicosModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="alergiaExamesFisicosModel"></param>
        /// <param name="_tb_medicamento_prescrito"></param>
        private static void Atribuir(AlergiaExamesFisicosModel alergiaExamesFisicosModel, tb_medicamento_prescrito _tb_medicamento_prescrito)
        {
            _tb_medicamento_prescrito.IdConsultaVariavel = alergiaExamesFisicosModel.IdConsultaVariavel;
            _tb_medicamento_prescrito.IdMedicamento = alergiaExamesFisicosModel.IdMedicamento;
            _tb_medicamento_prescrito.Fitoterapico = alergiaExamesFisicosModel.Fitoterapico;
            _tb_medicamento_prescrito.Dosagem = alergiaExamesFisicosModel.Dosagem;
            _tb_medicamento_prescrito.Posologia = alergiaExamesFisicosModel.Posologia;
            _tb_medicamento_prescrito.Prescritor = alergiaExamesFisicosModel.Prescritor;
            _tb_medicamento_prescrito.Especialidade = alergiaExamesFisicosModel.Especialidade;

        }*/
    }
}