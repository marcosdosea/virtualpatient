using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Cadastro;
using Persistence;
using PacienteVirtual.Models;

namespace PacienteVirtual.Negocio.Cadastro
{
    public class GerenciadorSuspeitaPrm
    {
        private static GerenciadorSuspeitaPrm gSuspeitaPrm;

        private GerenciadorSuspeitaPrm()
        {
        }

        public static GerenciadorSuspeitaPrm GetInstance()
        {
            if (gSuspeitaPrm == null)
            {
                gSuspeitaPrm = new GerenciadorSuspeitaPrm();
            }
            return gSuspeitaPrm;
        }

        /// <summary>
        /// Insere dados do suspeitaPrm
        /// </summary>
        /// <param name="suspeitaPrm"></param>
        /// <returns></returns>
        public int Inserir(SuspeitaPrmModel suspeitaPrm)
        {
            var repSuspeitaPrm = new RepositorioGenerico<tb_suspeita_prm>();
            tb_suspeita_prm suspeita_prmE = new tb_suspeita_prm();
            try
            {
                Atribuir(suspeitaPrm, suspeita_prmE);

                repSuspeitaPrm.Inserir(suspeita_prmE);
                repSuspeitaPrm.SaveChanges();

                return suspeita_prmE.IdSuspeitaPRM;
            }
            catch (Exception e)
            {
                throw new DadosException("SuspeitaPrm", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do suspeitaPrm
        /// </summary>
        /// <param name="suspeitaPrm"></param>
        public void Atualizar(SuspeitaPrmModel suspeitaPrm)
        {
            try
            {
                var repSuspeitaPrm = new RepositorioGenerico<tb_suspeita_prm>();
                tb_suspeita_prm suspeita_prmE = repSuspeitaPrm.ObterEntidade(d => d.IdSuspeitaPRM == suspeitaPrm.IdSuspeitaPrm);
                Atribuir(suspeitaPrm, suspeita_prmE);

                repSuspeitaPrm.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("SuspeitaPrm", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do suspeitaPrm
        /// </summary>
        /// <param name="idSuspeitaPrm"></param>
        public void Remover(int idSuspeitaPrm)
        {
            try
            {
                var repSuspeitaPrm = new RepositorioGenerico<tb_suspeita_prm>();
                repSuspeitaPrm.Remover(d => d.IdSuspeitaPRM == idSuspeitaPrm);
                repSuspeitaPrm.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("SuspeitaPrm", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<SuspeitaPrmModel> GetQuery()
        {
            var repSuspeitaPrm = new RepositorioGenerico<tb_suspeita_prm>();
            var pvEntities = (pvEntities)repSuspeitaPrm.ObterContexto();
            var query = from suspeitaPrm in pvEntities.tb_suspeita_prm
                        select new SuspeitaPrmModel
                        {
                            IdSuspeitaPrm = suspeitaPrm.IdSuspeitaPRM,
                            Descricao = suspeitaPrm.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os suspeitaPrm cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SuspeitaPrmModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém suspeitaPrm com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public SuspeitaPrmModel Obter(int idSuspeitaPrm)
        {
            return GetQuery().Where(suspeitaPrm => suspeitaPrm.IdSuspeitaPrm == idSuspeitaPrm).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém ocupaçoes que iniciam com o descrição
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<SuspeitaPrmModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(suspeitaPrm => suspeitaPrm.Descricao.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="suspeitaPrm"></param>
        /// <param name="suspeita_prmE"></param>
        private static void Atribuir(SuspeitaPrmModel suspeitaPrm, tb_suspeita_prm suspeita_prmE)
        {
            suspeita_prmE.Descricao = suspeitaPrm.Descricao;
        }
    }
}