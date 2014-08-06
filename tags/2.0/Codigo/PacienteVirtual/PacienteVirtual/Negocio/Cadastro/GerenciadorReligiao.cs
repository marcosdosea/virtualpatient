using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorReligiao
    {
        public static GerenciadorReligiao gReligiao;

        private GerenciadorReligiao()
        {
        }

        public static GerenciadorReligiao GetInstance()
        {
            if (gReligiao == null)
            {
                gReligiao = new GerenciadorReligiao();
            }
            return gReligiao;
        }

        /// <summary>
        /// inserir dados da religiao
        /// </summary>
        /// <param name="religiao"></param>
        /// <returns></returns>
        public int Inserir(ReligiaoModel religiao)
        {
            var repReligiao = new RepositorioGenerico<tb_religiao>();
            tb_religiao _tb_religiao = new tb_religiao();
            try
            {
                Atribuir(religiao, _tb_religiao);

                repReligiao.Inserir(_tb_religiao);
                repReligiao.SaveChanges();

                return _tb_religiao.IdReligiao;
            }
            catch (Exception e)
            {
                throw new NegocioException("Religiao", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Religiao
        /// </summary>
        /// <param name="religiao"></param>
        public void Atualizar(ReligiaoModel religiao)
        {
            try
            {
                var repReligiao = new RepositorioGenerico<tb_religiao>();
                tb_religiao _tb_religiao = repReligiao.ObterEntidade(d => d.IdReligiao == religiao.IdReligiao);
                Atribuir(religiao, _tb_religiao);

                repReligiao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Religiao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Religiao
        /// </summary>
        /// <param name="idReligiao"></param>
        public void Remover(int idReligiao)
        {
            try
            {
                var repReligiao = new RepositorioGenerico<tb_religiao>();
                repReligiao.Remover(d => d.IdReligiao == idReligiao);
                repReligiao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Religiao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ReligiaoModel> GetQuery()
        {
            var repReligiao = new RepositorioGenerico<tb_religiao>();
            var pvEntities = (pvEntities)repReligiao.ObterContexto();
            var query = from religiao in pvEntities.tb_religiao
                        select new ReligiaoModel
                        {
                            IdReligiao = religiao.IdReligiao,
                            Religiao = religiao.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos as religiões cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ReligiaoModel> ObterTodos()
        {
            return GetQuery().ToList().OrderBy(rel => rel.Religiao);
        }

        /// <summary>
        /// Obtém Religiao com o código especificiado
        /// </summary>
        /// <param name="idReligiao"></param>
        /// <returns></returns>
        public ReligiaoModel Obter(int idReligiao)
        {
            return GetQuery().Where(religiao => religiao.IdReligiao == idReligiao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir do religiao
        /// </summary>
        /// <param name="religiao"></param>
        /// <returns></returns>
        public IEnumerable<ReligiaoModel> ObterPorNome(string descricaoReligiao)
        {
            return GetQuery().Where(religiao => religiao.Religiao.StartsWith(descricaoReligiao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="religiao"></param>
        /// <param name="_tb_religiao"></param>
        private static void Atribuir(ReligiaoModel religiao, tb_religiao _tb_religiao)
        {
            _tb_religiao.Descricao = religiao.Religiao;
        }
    }
}