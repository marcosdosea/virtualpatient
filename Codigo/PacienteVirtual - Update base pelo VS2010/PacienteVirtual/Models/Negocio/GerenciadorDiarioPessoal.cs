using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
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
            var repHistorico = new RepositorioGenerico<DiarioPessoalE>();
            DiarioPessoalE _DiarioPessoalE = new DiarioPessoalE();
            try
            {
                Atribuir(DiarioPessoalModel, _DiarioPessoalE);

                repHistorico.Inserir(_DiarioPessoalE);
                repHistorico.SaveChanges();

                return _DiarioPessoalE.IdConsultaFixo;
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
                var repHistorico = new RepositorioGenerico<DiarioPessoalE>();
                DiarioPessoalE _DiarioPessoalE = repHistorico.ObterEntidade(dP => dP.IdConsultaFixo == DiarioPessoalModel.IdConsultaFixo);
                Atribuir(DiarioPessoalModel, _DiarioPessoalE);

                repHistorico.SaveChanges();
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
        public void Remover(long idConsultaFixo)
        {
            try
            {
                var repHistorico = new RepositorioGenerico<DiarioPessoalE>();
                repHistorico.Remover(dP => dP.IdConsultaFixo == idConsultaFixo);
                repHistorico.SaveChanges();
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
            var repHistorico = new RepositorioGenerico<DiarioPessoalE>();
            var pvEntities = (pvEntities)repHistorico.ObterContexto();
            var query = from tb_diario_pessoal in pvEntities.tb_diario_pessoal
                        select new DiarioPessoalModel
                        {
                            IdConsultaFixo = tb_diario_pessoal.IdConsultaFixo,
                            IdMedicamento = tb_diario_pessoal.IdMedicamento,
                            Periodo = tb_diario_pessoal.Periodo,
                            Horario = tb_diario_pessoal.Horario,
                            Quantidade = tb_diario_pessoal.Quantidade,
                            TipoBebida = tb_diario_pessoal.TipoBebida,

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
        public DiarioPessoalModel Obter(long IdConsultaFixo)
        {
            return GetQuery().Where(DiarioPessoalModel => DiarioPessoalModel.IdConsultaFixo == IdConsultaFixo).ToList().ElementAtOrDefault(0);
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
        /// <param name="_DiarioPessoalE"></param>
        private static void Atribuir(DiarioPessoalModel DiarioPessoalModel, DiarioPessoalE _DiarioPessoalE)
        {
            _DiarioPessoalE.IdConsultaFixo = DiarioPessoalModel.IdConsultaFixo;
            _DiarioPessoalE.IdMedicamento = DiarioPessoalModel.IdMedicamento;
            _DiarioPessoalE.Periodo = DiarioPessoalModel.Periodo;
            _DiarioPessoalE.Horario = DiarioPessoalModel.Horario;
            _DiarioPessoalE.Quantidade = DiarioPessoalModel.Quantidade;
            _DiarioPessoalE.TipoBebida = DiarioPessoalModel.TipoBebida;

        }

    }
}