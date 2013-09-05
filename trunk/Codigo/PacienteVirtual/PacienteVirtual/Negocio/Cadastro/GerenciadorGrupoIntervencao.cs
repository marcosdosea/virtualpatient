using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Cadastro;
using Persistence;
using PacienteVirtual.Models;
using Negocio;

namespace PacienteVirtual.Negocio.Cadastro
{
    public class GerenciadorGrupoIntervencao
    {
         public static GerenciadorGrupoIntervencao gGrupoIntervecao;

        private GerenciadorGrupoIntervencao()
        {
        }

        public static GerenciadorGrupoIntervencao GetInstance()
        {
            if (gGrupoIntervecao == null)
            {
                gGrupoIntervecao = new GerenciadorGrupoIntervencao();
            }
            return gGrupoIntervecao;
        }

        /// <summary>
        /// inserir dados do grupo grupoIntervencao
        /// </summary>
        /// <param name="grupoIntervencao"></param>
        /// <returns></returns>
        public int Inserir(GrupoIntervencaoModel grupoIntervencao)
        {
            var repGrupoIntervencao = new RepositorioGenerico<tb_grupo_intervencao>();
            tb_grupo_intervencao _tb_grupo_intervencao = new tb_grupo_intervencao();
            try
            {
                Atribuir(grupoIntervencao, _tb_grupo_intervencao);

                repGrupoIntervencao.Inserir(_tb_grupo_intervencao);
                repGrupoIntervencao.SaveChanges();

                return _tb_grupo_intervencao.IdGrupoIntervencao;
            }
            catch (Exception e)
            {
                throw new NegocioException("Grupo Intervencao", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Grupo Intervencao
        /// </summary>
        /// <param name="grupoIntervencao"></param>
        public void Atualizar(GrupoIntervencaoModel grupoIntervencao)
        {
            try
            {
                var repGrupoIntervencao = new RepositorioGenerico<tb_grupo_intervencao>();
                tb_grupo_intervencao _tb_grupo_intervencao = repGrupoIntervencao.ObterEntidade(d => d.IdGrupoIntervencao == grupoIntervencao.IdGrupoIntervencao);
                Atribuir(grupoIntervencao, _tb_grupo_intervencao);

                repGrupoIntervencao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Grupo Intervencao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Grupo Intervencao
        /// </summary>
        /// <param name="idGrupoIntervencao"></param>
        public void Remover(int idGrupoIntervencao)
        {
            try
            {
                var repGrupoIntervencao = new RepositorioGenerico<tb_grupo_intervencao>();
                repGrupoIntervencao.Remover(d => d.IdGrupoIntervencao == idGrupoIntervencao);
                repGrupoIntervencao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Grupo Intervencao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<GrupoIntervencaoModel> GetQuery()
        {
            var repGrupoIntervencao = new RepositorioGenerico<tb_grupo_intervencao>();
            var pvEntities = (pvEntities)repGrupoIntervencao.ObterContexto();
            var query = from grupoIntervencao in pvEntities.tb_grupo_intervencao
                        select new GrupoIntervencaoModel
                        {
                            IdGrupoIntervencao = grupoIntervencao.IdGrupoIntervencao,
                            DescricaoGrupoIntervencao = grupoIntervencao.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os grupos cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<GrupoIntervencaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Grupo Intervencao com o código especificiado
        /// </summary>
        /// <param name="idGrupoIntervencao"></param>
        /// <returns></returns>
        public GrupoIntervencaoModel Obter(int idGrupoIntervencao)
        {
            return GetQuery().Where(grupoIntervencao => grupoIntervencao.IdGrupoIntervencao == idGrupoIntervencao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do grupo
        /// </summary>
        /// <param name="descricao"></param>
        /// <returns></returns>
        public IEnumerable<GrupoIntervencaoModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(grupoIntervencao => grupoIntervencao.DescricaoGrupoIntervencao.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="grupoIntervencao"></param>
        /// <param name="_tb_grupo_intervencao"></param>
        private static void Atribuir(GrupoIntervencaoModel grupoIntervencao, tb_grupo_intervencao _tb_grupo_intervencao)
        {
            _tb_grupo_intervencao.Descricao = grupoIntervencao.DescricaoGrupoIntervencao;
        }
    }
}