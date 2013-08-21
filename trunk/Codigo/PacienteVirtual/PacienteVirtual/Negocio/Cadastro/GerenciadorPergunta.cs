using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPergunta
    {
        private static GerenciadorPergunta gPergunta;

        private GerenciadorPergunta()
        {
        }

        public static GerenciadorPergunta GetInstance()
        {
            if (gPergunta == null)
            {
                gPergunta = new GerenciadorPergunta();
            }
            return gPergunta;
        }

        /// <summary>
        /// Insere dados do pergunta
        /// </summary>
        /// <param name="pergunta"></param>
        /// <returns></returns>
        public int Inserir(PerguntaModel pergunta)
        {
            var repPergunta = new RepositorioGenerico<PerguntaE>();
            PerguntaE _perguntaE = new PerguntaE();
            try
            {
                Atribuir(pergunta, _perguntaE);

                repPergunta.Inserir(_perguntaE);
                repPergunta.SaveChanges();

                return _perguntaE.IdPergunta;
            }
            catch (Exception e)
            {
                throw new DadosException("Pergunta", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do pergunta
        /// </summary>
        /// <param name="pergunta"></param>
        public void Atualizar(PerguntaModel pergunta)
        {
            try
            {
                var repPergunta = new RepositorioGenerico<PerguntaE>();
                PerguntaE _perguntaE = repPergunta.ObterEntidade(d => d.IdPergunta == pergunta.IdPergunta);
                Atribuir(pergunta, _perguntaE);

                repPergunta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Pergunta", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do pergunta
        /// </summary>
        /// <param name="idPergunta"></param>
        public void Remover(int idPergunta)
        {
            try
            {
                var repPergunta = new RepositorioGenerico<PerguntaE>();
                repPergunta.Remover(d => d.IdPergunta == idPergunta);
                repPergunta.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Pergunta", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PerguntaModel> GetQuery()
        {
            var repPergunta = new RepositorioGenerico<PerguntaE>();
            var pvEntities = (pvEntities)repPergunta.ObterContexto();
            var query = from pergunta in pvEntities.tb_pergunta
                        select new PerguntaModel
                        {
                            IdPergunta = pergunta.IdPergunta,
                            Pergunta = pergunta.Pergunta
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os pergunta cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PerguntaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém pergunta com o código especificiado
        /// </summary>
        /// <param name="idPergunta"></param>
        /// <returns></returns>
        public PerguntaModel Obter(int idPergunta)
        {
            return GetQuery().Where(pergunta => pergunta.IdPergunta == idPergunta).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém perguntas que iniciam com o nomePergunta
        /// </summary>
        /// <param name="nomePergunta"></param>
        /// <returns></returns>
        public IEnumerable<PerguntaModel> ObterPorNome(string nomePergunta)
        {
            return GetQuery().Where(pergunta => pergunta.Pergunta.StartsWith(nomePergunta)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="pergunta"></param>
        /// <param name="_perguntaE"></param>
        private static void Atribuir(PerguntaModel pergunta, PerguntaE _perguntaE)
        {
            _perguntaE.Pergunta = pergunta.Pergunta;
        }
    }
}