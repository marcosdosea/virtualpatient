using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

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
        /// Remove dados do DiarioPessoalModel
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaFixo, int idMedicamento)
        {
            try
            {
                var repDiarioPessoal = new RepositorioGenerico<tb_diario_pessoal>();
                repDiarioPessoal.Remover(dP => dP.IdConsultaFixo == idConsultaFixo && dP.IdMedicamento == idMedicamento);
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
        /// Obtém DiarioPessoalModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiarioPessoalModel> Obter(long IdConsultaFixo)
        {
            return GetQuery().Where(DiarioPessoalModel => DiarioPessoalModel.IdConsultaFixo == IdConsultaFixo).OrderBy(DiarioPessoalModel => DiarioPessoalModel.Horario).OrderBy(DiarioPessoalModel => DiarioPessoalModel.Periodo);
        }

        public DiarioPessoalModel ObterPorMedicamento(long idConsultaFixo, int idMendicamento)
        {
            return GetQuery().Where(dp => dp.IdConsultaFixo == idConsultaFixo && dp.IdMedicamento == idMendicamento).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<DiarioPessoalModel> ObterPorIdHistorico(long IdConsultaFixo)
        {
            return GetQuery().Where(DiarioPessoalModel => DiarioPessoalModel.IdConsultaFixo == IdConsultaFixo).ToList();
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

        }

    }
}