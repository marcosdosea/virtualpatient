using Persistence;
using PacienteVirtual.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Negocio
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
            var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
            tb_consulta_variavel_queixa _consultaVariavelQueixaE = new tb_consulta_variavel_queixa();
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
                var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
                tb_consulta_variavel_queixa _consultaVariavelQueixaE = repConsultaVariavel.ObterEntidade(cvq => cvq.IdConsultaVariavel == consultaVariavelQueixa.IdConsultaVariavel);
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
                var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
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
            var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel_queixa>();
            var pvEntities = (pvEntities)repConsultaVariavel.ObterContexto();
            var query = from tb_consulta_variavel_queixa in pvEntities.tb_consulta_variavel_queixa
                        select new ConsultaVariavelQueixaModel
                        {
                            IdConsultaVariavel = tb_consulta_variavel_queixa.IdConsultaVariavel,
                            IdQueixa = tb_consulta_variavel_queixa.IdQueixa,
                            IdObjetivoTerapeutico = tb_consulta_variavel_queixa.IdObjetivoTerapeutico,
                            IdSituacaoQueixa = tb_consulta_variavel_queixa.IdSituacaoQueixa,
                            Tipo = tb_consulta_variavel_queixa.Tipo,
                            Desde = tb_consulta_variavel_queixa.Desde,
                            Prioridade = (int) tb_consulta_variavel_queixa.Prioridade,

                            DescricaoSituacao = tb_consulta_variavel_queixa.tb_situacao_queixa.Descricao,
                            DescricaoObjetivoTerapeutico = tb_consulta_variavel_queixa.tb_objetivo_terapeutico.Descricao,
                            DescricaoQueixa = tb_consulta_variavel_queixa.tb_queixa.DescricaoQueixa
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
        public IEnumerable<ConsultaVariavelQueixaModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(consultaVariavelQueixa => consultaVariavelQueixa.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
         public IEnumerable<ConsultaVariavelQueixaModel> ObterPorConsultaVariavelTodosSuspeitaPRM(long idConsultaVariavel)
        {
            return GetQuery().Where(cv => cv.IdConsultaVariavel == idConsultaVariavel && cv.Tipo.Equals("S")).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaVariavelQueixa"></param>
        /// <param name="_consultaVariavelQueixaE"></param>
        private static void Atribuir(ConsultaVariavelQueixaModel consultaVariavelQueixa, tb_consulta_variavel_queixa _consultaVariavelQueixaE)
        {
            _consultaVariavelQueixaE.IdConsultaVariavel = consultaVariavelQueixa.IdConsultaVariavel;
            _consultaVariavelQueixaE.IdQueixa = consultaVariavelQueixa.IdQueixa;
            _consultaVariavelQueixaE.IdObjetivoTerapeutico = consultaVariavelQueixa.IdObjetivoTerapeutico;
            _consultaVariavelQueixaE.IdSituacaoQueixa = consultaVariavelQueixa.IdSituacaoQueixa;
            _consultaVariavelQueixaE.Tipo = consultaVariavelQueixa.Tipo;
            _consultaVariavelQueixaE.Desde = consultaVariavelQueixa.Desde;
            _consultaVariavelQueixaE.Prioridade = consultaVariavelQueixa.Prioridade;
        }
    }
}