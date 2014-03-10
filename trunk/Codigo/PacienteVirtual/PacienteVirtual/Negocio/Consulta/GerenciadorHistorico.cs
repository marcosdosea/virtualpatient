using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
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
            var repHistorico = new RepositorioGenerico<tb_historico>();
            tb_historico _tb_historico = new tb_historico();
            try
            {
                Atribuir(Historico, _tb_historico);

                repHistorico.Inserir(_tb_historico);
                repHistorico.SaveChanges();

                return _tb_historico.IdHistorico;
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
                var repHistorico = new RepositorioGenerico<tb_historico>();
                tb_historico _tb_historico = repHistorico.ObterEntidade(h => h.IdHistorico == Historico.IdHistorico);
                Atribuir(Historico, _tb_historico);

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
                var repHistorico = new RepositorioGenerico<tb_historico>();
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
            var repHistorico = new RepositorioGenerico<tb_historico>();
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
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="Historico"></param>
        /// <param name="_tb_historico"></param>
        private static void Atribuir(HistoricoModel Historico, tb_historico _tb_historico)
        {
            _tb_historico.IdHistorico = Historico.IdHistorico;
            _tb_historico.IdPessoa = Historico.IdPessoa;
            _tb_historico.IdTurma = Historico.IdTurma;
            _tb_historico.IdPaciente = Historico.IdPaciente;
            _tb_historico.IdTutor = Historico.IdTutor;
            _tb_historico.IdRelato = Historico.IdRelato;
            _tb_historico.DataEnvio = Historico.DataEnvio;
            _tb_historico.DataResposta = Historico.DataResposta;
            _tb_historico.Estado = Historico.Estado;
            _tb_historico.ComentarioTutor = Historico.ComentarioTutor;

        }

    }
}