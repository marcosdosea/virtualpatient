using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Cadastro;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio.Cadastro
{
    public class GerenciadorIntervencao
    {
        private static GerenciadorIntervencao gIntervencao;

        private GerenciadorIntervencao() { }

        public static GerenciadorIntervencao GetInstance()
        {
            if (gIntervencao == null)
            {
                gIntervencao = new GerenciadorIntervencao();
            }
            return gIntervencao;
        }

        /// <summary>
        /// Insere dados do Intervencao
        /// </summary>
        /// <param name="intervencao"></param>
        /// <returns></returns>
        public int Inserir(IntervencaoModel intervencao)
        {
            var repIntervencao = new RepositorioGenerico<tb_intervencao>();
            tb_intervencao _intervencaoE = new tb_intervencao();
            try
            {
                Atribuir(intervencao, _intervencaoE);

                repIntervencao.Inserir(_intervencaoE);
                repIntervencao.SaveChanges();

                return _intervencaoE.IdIntervencao;
            }
            catch (Exception e)
            {
                throw new DadosException("Intervencao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do intervencao
        /// </summary>
        /// <param name="intervencao"></param>
        public void Atualizar(IntervencaoModel intervencao)
        {
            try
            {
                var repIntervencao = new RepositorioGenerico<tb_intervencao>();
                tb_intervencao _intervencaoE = repIntervencao.ObterEntidade(c => c.IdIntervencao == intervencao.IdIntervencao);
                Atribuir(intervencao, _intervencaoE);

                repIntervencao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Intervencao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do intervencao
        /// </summary>
        /// <param name="idIntervencao"></param>
        public void Remover(int idIntervencao)
        {
            try
            {
                var repIntervencao = new RepositorioGenerico<tb_intervencao>();
                repIntervencao.Remover(c => c.IdIntervencao == idIntervencao);
                repIntervencao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Intervencao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<IntervencaoModel> GetQuery()
        {
            var repIntervencao = new RepositorioGenerico<tb_intervencao>();
            var pvEntities = (pvEntities)repIntervencao.ObterContexto();
            var query = from tb_intervencao in pvEntities.tb_intervencao
                        join tb_grupo_intervencao in pvEntities.tb_grupo_intervencao
                        on tb_intervencao.IdGrupoIntervencao equals tb_grupo_intervencao.IdGrupoIntervencao
                        select new IntervencaoModel
                        {
                            IdIntervencao = tb_intervencao.IdIntervencao,
                            IdGrupoIntervencao = tb_intervencao.IdGrupoIntervencao,
                            DescricaoIntervencao = tb_intervencao.DescricaoIntervencao,
                            DescricaoGrupoIntervencao = tb_grupo_intervencao.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os curso cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<IntervencaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém intervencao com o código especificiado
        /// </summary>
        /// <param name="idIntervencao"></param>
        /// <returns></returns>
        public IntervencaoModel Obter(int idIntervencao)
        {
            return GetQuery().Where(intervencao => intervencao.IdIntervencao == idIntervencao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém queixas que iniciam com o descricaoIntervencao
        /// </summary>
        /// <param name="descricaoIntervencao"></param>
        /// <returns></returns>
        public IEnumerable<IntervencaoModel> ObterPorNome(string descricaoIntervencao)
        {
            return GetQuery().Where(intervencao => intervencao.DescricaoIntervencao.StartsWith(descricaoIntervencao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="intervencao"></param>
        /// <param name="_intervencaoE"></param>
        private static void Atribuir(IntervencaoModel intervencao, tb_intervencao _intervencaoE)
        {
            _intervencaoE.DescricaoIntervencao = intervencao.DescricaoIntervencao;
            _intervencaoE.IdGrupoIntervencao = intervencao.IdGrupoIntervencao;
        }

        public IEnumerable<IntervencaoModel> ObterPorGrupoIntervencao(int idGrupoIntervencao)
        {
            return GetQuery().Where(intervencao => intervencao.IdGrupoIntervencao == idGrupoIntervencao).ToList();
        }
    }
}