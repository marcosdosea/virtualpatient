using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dados;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorHistorico
    {
        private static GerenciadorHistorico gHistorico;

        private GerenciadorHistorico() { }

        public static GerenciadorHistorico GetInstance()
        {
            if (gHistorico == null)
            {
                gHistorico = new GerenciadorHistorico();
            }
            return gHistorico;
        }

        /// <summary>
        /// Insere dados do Historico
        /// </summary>
        /// <param name="Historico"></param>
        /// <returns></returns>
        public long Inserir(HistoricoModel Historico)
        {
            var repHistorico = new RepositorioGenerico<HistoricoE>();
            HistoricoE _HistoricoE = new HistoricoE();
            try
            {
                Atribuir(Historico, _HistoricoE);

                repHistorico.Inserir(_HistoricoE);
                repHistorico.SaveChanges();

                return _HistoricoE.IdHistorico;
            }
            catch (Exception e)
            {
                throw new DadosException("Historico", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do Historico
        /// </summary>
        /// <param name="Historico"></param>
        public void Atualizar(HistoricoModel Historico)
        {
            try
            {
                var repHistorico = new RepositorioGenerico<HistoricoE>();
                HistoricoE _HistoricoE = repHistorico.ObterEntidade(h => h.IdHistorico == Historico.IdHistorico);
                Atribuir(Historico, _HistoricoE);

                repHistorico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Historico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do Historico
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idHistorico)
        {
            try
            {
                var repHistorico = new RepositorioGenerico<HistoricoE>();
                repHistorico.Remover(h => h.IdHistorico == idHistorico);
                repHistorico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Historico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<HistoricoModel> GetQuery()
        {
            var repHistorico = new RepositorioGenerico<HistoricoE>();
            var pvEntities = (pvEntities)repHistorico.ObterContexto();
            var query = from tb_historico in pvEntities.tb_historico
                        select new HistoricoModel
                        {
                            IdHistorico = tb_historico.IdHistorico,
                            IdPessoa = tb_historico.IdPessoa,
                            IdTurma = tb_historico.IdTurma,
                            IdPaciente = tb_historico.IdPaciente,
                            IdTutor = tb_historico.IdTutor,
                            IdRelato = tb_historico.IdRelato,
                            DataEnvio = (DateTime)tb_historico.DataEnvio,
                            DataResposta = (DateTime) tb_historico.DataResposta,
                            Estado = (int) tb_historico.Estado, //Atenção: o campo na base pode ser "null"
                            ComentarioTutor = tb_historico.ComentarioTutor
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os Historico cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<HistoricoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Historico com o código especificiado
        /// </summary>
        /// <returns></returns>
        public HistoricoModel Obter(long IdHistorico)
        {
            return GetQuery().Where(Historico => Historico.IdHistorico == IdHistorico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<HistoricoModel> ObterPorIdHistorico(long IdHistorico)
        {
            return GetQuery().Where(Historico => Historico.IdHistorico == IdHistorico).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="Historico"></param>
        /// <param name="_HistoricoE"></param>
        private static void Atribuir(HistoricoModel Historico, HistoricoE _HistoricoE)
        {
            _HistoricoE.IdHistorico = Historico.IdHistorico;
            _HistoricoE.IdPessoa = Historico.IdPessoa;
            _HistoricoE.IdTurma = Historico.IdTurma;
            _HistoricoE.IdPaciente = Historico.IdPaciente;
            _HistoricoE.IdTutor = Historico.IdTutor;
            _HistoricoE.IdRelato = Historico.IdRelato;
            _HistoricoE.DataEnvio = Historico.DataEnvio;
            _HistoricoE.DataResposta = Historico.DataResposta;
            _HistoricoE.Estado = Historico.Estado;
            _HistoricoE.ComentarioTutor = Historico.ComentarioTutor;

        }

    }
}