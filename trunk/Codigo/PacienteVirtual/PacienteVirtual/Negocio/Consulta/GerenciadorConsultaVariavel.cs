using Persistence;
using PacienteVirtual.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorConsultaVariavel
    {
        private static GerenciadorConsultaVariavel gConsultaFixo;

        private GerenciadorConsultaVariavel() { }

        public static GerenciadorConsultaVariavel GetInstance()
        {
            if (gConsultaFixo == null)
            {
                gConsultaFixo = new GerenciadorConsultaVariavel();
            }
            return gConsultaFixo;
        }

        /// <summary>
        /// Insere dados do consultaVariavel
        /// </summary>
        /// <param name="consultaVariavel"></param>
        /// <returns></returns>
        public long Inserir(ConsultaVariavelModel consultaVariavel)
        {
            var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel>();
            tb_consulta_variavel _consultaVariavelE = new tb_consulta_variavel();
            try
            {
                Atribuir(consultaVariavel, _consultaVariavelE);

                repConsultaVariavel.Inserir(_consultaVariavelE);
                repConsultaVariavel.SaveChanges();

                return _consultaVariavelE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavel", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do consultaVariavel
        /// </summary>
        /// <param name="consultaVariavel"></param>
        public void Atualizar(ConsultaVariavelModel consultaVariavel)
        {
            try
            {
                var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel>();
                tb_consulta_variavel _consultaVariavelE = repConsultaVariavel.ObterEntidade(cv => cv.IdConsultaVariavel == consultaVariavel.IdConsultaVariavel);
                Atribuir(consultaVariavel, _consultaVariavelE);

                repConsultaVariavel.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavel", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do consultaVariavel
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaVariavel)
        {
            //if (idConsultaVariavel == 1)
            //    throw new NegocioException("A consultaVariavel não pode ser removido.");
            try
            {
                var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel>();
                repConsultaVariavel.Remover(cv => cv.IdConsultaVariavel == idConsultaVariavel);
                repConsultaVariavel.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaVariavel", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ConsultaVariavelModel> GetQuery()
        {
            var repConsultaVariavel = new RepositorioGenerico<tb_consulta_variavel>();
            var pvEntities = (pvEntities)repConsultaVariavel.ObterContexto();
            var query = from tb_consulta_variavel in pvEntities.tb_consulta_variavel
                        //join tb_pessoa in pvEntities.tb_pessoa
                        //on tb_consulta_variavel.IdPessoa equals tb_pessoa.IdPessoa

                        select new ConsultaVariavelModel
                        {
                            IdConsultaVariavel = tb_consulta_variavel.IdConsultaVariavel,
                            IdConsultaFixo = tb_consulta_variavel.IdConsultaFixo,
                            IdTurma = tb_consulta_variavel.IdTurma,
                            IdPessoa = tb_consulta_variavel.IdPessoa,
                            IdRelato = tb_consulta_variavel.IdRelato,
                            IdRazaoEncontro = tb_consulta_variavel.IdRazaoEncontro,
                            DataPreenchimento = (DateTime)tb_consulta_variavel.DataPreenchimento,
                            Lembretes = tb_consulta_variavel.Lembretes,
                            ComentariosTutor = tb_consulta_variavel.ComentariosTutor,

                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os consultaVariavel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConsultaVariavelModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém consultaVariavel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public ConsultaVariavelModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(consultaVariavel => consultaVariavel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }


        /// <summary>
        /// Obtém consultaVariavel com o código da Turma, Pessoa e Relato especificiado
        /// </summary>
        /// <returns></returns>
        public ConsultaVariavelModel Obter(int idTurma, int idPessoa, int idRelato)
        {
            return GetQuery().Where(consultaVariavel => consultaVariavel.IdTurma == idTurma
                && consultaVariavel.IdPessoa == idPessoa && consultaVariavel.IdRelato == idRelato).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        // public IEnumerable<ConsultaVariavelModel> ObterPorNome(int IdPaciente)
        //{
        //    return GetQuery().Where(consultaVariavel => consultaVariavel.IdPessoa == IdPaciente).ToList();
        //}

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaVariavel"></param>
        /// <param name="_consultaVariavelE"></param>
        private static void Atribuir(ConsultaVariavelModel consultaVariavel, tb_consulta_variavel _consultaVariavelE)
        {
            _consultaVariavelE.IdConsultaVariavel = consultaVariavel.IdConsultaVariavel;
            _consultaVariavelE.IdConsultaFixo = consultaVariavel.IdConsultaFixo;
            _consultaVariavelE.IdTurma = consultaVariavel.IdTurma;
            _consultaVariavelE.IdPessoa = consultaVariavel.IdPessoa;
            _consultaVariavelE.IdRelato = consultaVariavel.IdRelato;
            _consultaVariavelE.IdRazaoEncontro = consultaVariavel.IdRazaoEncontro;
            _consultaVariavelE.DataPreenchimento = (DateTime)consultaVariavel.DataPreenchimento;
            _consultaVariavelE.Lembretes = consultaVariavel.Lembretes;
            _consultaVariavelE.ComentariosTutor = consultaVariavel.ComentariosTutor;
        }
    }
}