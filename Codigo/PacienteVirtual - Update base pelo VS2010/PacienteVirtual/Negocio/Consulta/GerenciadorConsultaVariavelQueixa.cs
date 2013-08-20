using Persistence;
using PacienteVirtual.Models.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorConsultaVariavelQueixa
    {
        private static GerenciadorConsultaVariavelQueixa gConsultaFixo;

        private GerenciadorConsultaVariavelQueixa() { }

        public static GerenciadorConsultaVariavelQueixa GetInstance()
        {
            if (gConsultaFixo == null)
            {
                gConsultaFixo = new GerenciadorConsultaVariavelQueixa();
            }
            return gConsultaFixo;
        }

        /// <summary>
        /// Insere dados do consultaVariavelQueixa
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        /// <returns></returns>
        public long Inserir(ConsultaVariavelQueixaModel consultaVariavelQueixa)
        {
            var repConsultaVariavel = new RepositorioGenerico<ConsultaVariavelQueixaE>();
            ConsultaVariavelQueixaE _consultaVariavelQueixaE = new ConsultaVariavelQueixaE();
            try
            {
                Atribuir(consultaVariavelQueixa, _consultaVariavelQueixaE);

                repConsultaVariavel.Inserir(_consultaVariavelQueixaE);
                repConsultaVariavel.SaveChanges();

                return _consultaVariavelQueixaE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavelQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do consultaVariavelQueixa
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        public void Atualizar(ConsultaVariavelQueixaModel consultaVariavelQueixa)
        {
            try
            {
                var repConsultaVariavel = new RepositorioGenerico<ConsultaVariavelQueixaE>();
                ConsultaVariavelQueixaE _consultaVariavelQueixaE = repConsultaVariavel.ObterEntidade(cvq => cvq.IdConsultaVariavel == consultaVariavelQueixa.IdConsultaVariavel);
                Atribuir(consultaVariavelQueixa, _consultaVariavelQueixaE);

                repConsultaVariavel.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavelQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do consultaVariavelQueixa
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaVariavel, int idQueixa)
        {
            //if (idConsultaVariavel == 1)
            //    throw new NegocioException("A consultaVariavelQueixa não pode ser removido.");
            try
            {
                var repConsultaVariavel = new RepositorioGenerico<ConsultaVariavelQueixaE>();
                repConsultaVariavel.Remover(cvq => cvq.IdConsultaVariavel == idConsultaVariavel && cvq.IdQueixa == idQueixa);
                repConsultaVariavel.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavelQueixa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ConsultaVariavelQueixaModel> GetQuery()
        {
            var repConsultaVariavel = new RepositorioGenerico<ConsultaVariavelQueixaE>();
            var pvEntities = (pvEntities)repConsultaVariavel.ObterContexto();
            var query = from tb_consulta_variavel_queixa in pvEntities.tb_consulta_variavel_queixa
                        join tb_acao_queixa in pvEntities.tb_acao_queixa
                        on tb_consulta_variavel_queixa.IdAcaoQueixa equals tb_acao_queixa.IdAcaoQueixa

                        select new ConsultaVariavelQueixaModel
                        {
                            IdConsultaVariavel = tb_consulta_variavel_queixa.IdConsultaVariavel,
                            IdQueixa = tb_consulta_variavel_queixa.IdQueixa,
                            IdAcaoQueixa = tb_consulta_variavel_queixa.IdAcaoQueixa,
                            Motivo = tb_consulta_variavel_queixa.Motivo,
                            Desde = tb_consulta_variavel_queixa.Desde,
                            Prioridade = (int) tb_consulta_variavel_queixa.Prioridade,

                            DescricaoAcao = tb_acao_queixa.DescricaoAcao,
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os consultaVariavelQueixa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConsultaVariavelQueixaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém consultaVariavelQueixa com o código especificiado
        /// </summary>
        /// <returns></returns>
        public ConsultaVariavelQueixaModel Obter(long idConsultaVariavel, int idQueixa)
        {
            return GetQuery().Where(consultaVariavelQueixa => consultaVariavelQueixa.IdConsultaVariavel == idConsultaVariavel
                && consultaVariavelQueixa.IdQueixa == idQueixa ).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        // public IEnumerable<ConsultaVariavelQueixaModel> ObterPorNome(int IdPaciente)
        //{
        //    return GetQuery().Where(consultaVariavelQueixa => consultaVariavelQueixa.IdPessoa == IdPaciente).ToList();
        //}

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        /// <param name="_consultaVariavelQueixaE"></param>
        private static void Atribuir(ConsultaVariavelQueixaModel consultaVariavelQueixa, ConsultaVariavelQueixaE _consultaVariavelQueixaE)
        {
            _consultaVariavelQueixaE.IdConsultaVariavel = consultaVariavelQueixa.IdConsultaVariavel;
            _consultaVariavelQueixaE.IdQueixa = consultaVariavelQueixa.IdQueixa;
            _consultaVariavelQueixaE.IdAcaoQueixa = consultaVariavelQueixa.IdAcaoQueixa;
            _consultaVariavelQueixaE.Motivo = consultaVariavelQueixa.Motivo;
            _consultaVariavelQueixaE.Desde = consultaVariavelQueixa.Desde;
            _consultaVariavelQueixaE.Prioridade = consultaVariavelQueixa.Prioridade;
        }
    }
}