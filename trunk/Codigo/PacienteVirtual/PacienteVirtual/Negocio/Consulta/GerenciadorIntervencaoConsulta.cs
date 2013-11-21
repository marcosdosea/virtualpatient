using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Consulta;
using Persistence;
using PacienteVirtual.Models;

namespace PacienteVirtual.Negocio.Consulta
{
    public class GerenciadorIntervencaoConsulta
    {
        private static GerenciadorIntervencaoConsulta gIntervencaoConsulta;
        private GerenciadorIntervencaoConsulta() { }

        public static GerenciadorIntervencaoConsulta GetInstance()
        {
            if (gIntervencaoConsulta == null)
            {
                gIntervencaoConsulta = new GerenciadorIntervencaoConsulta();
            }
            return gIntervencaoConsulta;
        }

        /// <summary>
        /// Insere dados do IntervencaoConsulta
        /// </summary>
        /// <param name="IntervencaoConsulta"></param>
        /// <returns></returns>
        public long Inserir(IntervencaoConsultaModel IntervencaoConsultaModel)
        {
            var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
            tb_consulta_variavel_intervencao _tb_consulta_variavel_intervencao = new tb_consulta_variavel_intervencao();
            try
            {
                Atribuir(IntervencaoConsultaModel, _tb_consulta_variavel_intervencao);

                repIntervencaoConsulta.Inserir(_tb_consulta_variavel_intervencao);
                repIntervencaoConsulta.SaveChanges();

                return _tb_consulta_variavel_intervencao.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do IntervencaoConsulta
        /// </summary>
        /// <param name="IntervencaoConsulta"></param>
        public void Atualizar(IntervencaoConsultaModel IntervencaoConsultaModel)
        {
            try
            {
                var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
                tb_consulta_variavel_intervencao _tb_consulta_variavel_intervencao = repIntervencaoConsulta.ObterEntidade(iC => iC.IdConsultaVariavel == IntervencaoConsultaModel.IdConsultaVariavel);
                Atribuir(IntervencaoConsultaModel, _tb_consulta_variavel_intervencao);

                repIntervencaoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do IntervencaoConsulta
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, long idIntervencao)
        {
            try
            {

                var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
                repIntervencaoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdIntervencao == idIntervencao);
                repIntervencaoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }


        /// <summary>
        /// Remove dados do MedicamentosPrescrito
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, int idIntervencao)
        {
            try
            {
                var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
                repIntervencaoConsulta.Remover(iC => iC.IdConsultaVariavel == idConsultaVariavel && iC.IdIntervencao == idIntervencao);
                repIntervencaoConsulta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("IntervencaoConsulta", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<IntervencaoConsultaModel> GetQuery()
        {
            var repIntervencaoConsulta = new RepositorioGenerico<tb_consulta_variavel_intervencao>();
            var pvEntities = (pvEntities)repIntervencaoConsulta.ObterContexto();
            var query = from tb_consulta_variavel_intervencao in pvEntities.tb_consulta_variavel_intervencao
                        join tb_intervencao in pvEntities.tb_intervencao
                        on tb_consulta_variavel_intervencao.IdIntervencao equals tb_intervencao.IdIntervencao
                        select new IntervencaoConsultaModel
                        {
                            IdConsultaVariavel = tb_consulta_variavel_intervencao.IdConsultaVariavel,
                            IdIntervencao = tb_consulta_variavel_intervencao.IdIntervencao,
                            Paciente = (bool) tb_consulta_variavel_intervencao.comunicaPaciente,
                            Outro = tb_consulta_variavel_intervencao.comunicaOutro,
                            Justificativa = tb_consulta_variavel_intervencao.justificativa,

                            DescricaoIntervencao = tb_intervencao.DescricaoIntervencao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os IntervencaoConsultaModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<IntervencaoConsultaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém IntervencaoConsultaModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<IntervencaoConsultaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(IntervencaoConsultaModel => IntervencaoConsultaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtém IntervencaoConsulta que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<IntervencaoConsultaModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(IntervencaoConsultaModel => IntervencaoConsultaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="IntervencaoConsultaModel"></param>
        /// <param name="_tb_consulta_variavel_intervencao"></param>
        private static void Atribuir(IntervencaoConsultaModel IntervencaoConsultaModel, tb_consulta_variavel_intervencao _tb_consulta_variavel_intervencao)
        {
            _tb_consulta_variavel_intervencao.IdConsultaVariavel = IntervencaoConsultaModel.IdConsultaVariavel;
            _tb_consulta_variavel_intervencao.IdIntervencao = IntervencaoConsultaModel.IdIntervencao;
            _tb_consulta_variavel_intervencao.comunicaOutro = IntervencaoConsultaModel.Outro;
            _tb_consulta_variavel_intervencao.comunicaPaciente = IntervencaoConsultaModel.Paciente;
            _tb_consulta_variavel_intervencao.justificativa = IntervencaoConsultaModel.Justificativa;

        }
    }
}