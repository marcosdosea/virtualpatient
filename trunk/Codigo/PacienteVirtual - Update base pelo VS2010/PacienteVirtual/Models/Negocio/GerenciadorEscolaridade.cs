using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;
using Negocio;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorEscolaridade
    {
        public static GerenciadorEscolaridade gEscolaridade;

        private GerenciadorEscolaridade()
        {
        }

        public static GerenciadorEscolaridade GetInstance()
        {
            if (gEscolaridade == null)
            {
                gEscolaridade = new GerenciadorEscolaridade();
            }
            return gEscolaridade;
        }

        /// <summary>
        /// inserir dados da escolaridade
        /// </summary>
        /// <param name="escolaridade"></param>
        /// <returns></returns>
        public int Inserir(EscolaridadeModel escolaridade)
        {
            var repEscolaridade = new RepositorioGenerico<EscolaridadeE>();
            EscolaridadeE _tb_escolaridade = new EscolaridadeE();
            try
            {
                Atribuir(escolaridade, _tb_escolaridade);

                repEscolaridade.Inserir(_tb_escolaridade);
                repEscolaridade.SaveChanges();

                return _tb_escolaridade.IdEscolaridade;
            }
            catch (Exception e)
            {
                throw new NegocioException("Escolaridade", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Escolaridade
        /// </summary>
        /// <param name="escolaridade"></param>
        public void Atualizar(EscolaridadeModel escolaridade)
        {
            try
            {
                var repEscolaridade = new RepositorioGenerico<EscolaridadeE>();
                EscolaridadeE _tb_escolaridade = repEscolaridade.ObterEntidade(d => d.IdEscolaridade == escolaridade.IdEscolaridade);
                Atribuir(escolaridade, _tb_escolaridade);

                repEscolaridade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Escolaridade", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Escolaridade
        /// </summary>
        /// <param name="idEscolaridade"></param>
        public void Remover(int idEscolaridade)
        {
            try
            {
                var repEscolaridade = new RepositorioGenerico<EscolaridadeE>();
                repEscolaridade.Remover(d => d.IdEscolaridade == idEscolaridade);
                repEscolaridade.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Escolaridade", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<EscolaridadeModel> GetQuery()
        {
            var repEscolaridade = new RepositorioGenerico<EscolaridadeE>();
            var pvEntities = (pvEntities)repEscolaridade.ObterContexto();
            var query = from escolaridade in pvEntities.tb_escolaridade
                        select new EscolaridadeModel
                        {
                            IdEscolaridade = escolaridade.IdEscolaridade,
                            EscolaridadeNivel = escolaridade.Nivel
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os niveis cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EscolaridadeModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Escolaridade com o código especificiado
        /// </summary>
        /// <param name="idEscolaridade"></param>
        /// <returns></returns>
        public EscolaridadeModel Obter(int idEscolaridade)
        {
            return GetQuery().Where(escolaridade => escolaridade.IdEscolaridade == idEscolaridade).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do nivel
        /// </summary>
        /// <param name="nivel"></param>
        /// <returns></returns>
        public IEnumerable<EscolaridadeModel> ObterPorNome(string nivel)
        {
            return GetQuery().Where(escolaridade => escolaridade.EscolaridadeNivel.StartsWith(nivel)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="escolaridade"></param>
        /// <param name="_tb_escolaridade"></param>
        private static void Atribuir(EscolaridadeModel escolaridade, EscolaridadeE _tb_escolaridade)
        {
            _tb_escolaridade.Nivel = escolaridade.EscolaridadeNivel;
        }
    }
}