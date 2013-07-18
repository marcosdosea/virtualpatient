using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorRazaoEncontro
    {
        private static GerenciadorRazaoEncontro gRazaoEncontro;

        private GerenciadorRazaoEncontro()
        {
        }

        public static GerenciadorRazaoEncontro GetInstance()
        {
            if (gRazaoEncontro == null)
            {
                gRazaoEncontro = new GerenciadorRazaoEncontro();
            }
            return gRazaoEncontro;
        }

        /// <summary>
        /// Insere dados do razaoEncontro
        /// </summary>
        /// <param name="razaoEncontro"></param>
        /// <returns></returns>
        public int Inserir(RazaoEncontroModel razaoEncontro)
        {
            var repRazaoEncontro = new RepositorioGenerico<RazaoEncontroE>();
            RazaoEncontroE _razaoEncontroE = new RazaoEncontroE();
            try
            {
                Atribuir(razaoEncontro, _razaoEncontroE);

                repRazaoEncontro.Inserir(_razaoEncontroE);
                repRazaoEncontro.SaveChanges();

                return _razaoEncontroE.IdRazaoEncontro;
            }
            catch (Exception e)
            {
                throw new DadosException("RazaoEncontro", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do razaoEncontro
        /// </summary>
        /// <param name="razaoEncontro"></param>
        public void Atualizar(RazaoEncontroModel razaoEncontro)
        {
            try
            {
                var repRazaoEncontro = new RepositorioGenerico<RazaoEncontroE>();
                RazaoEncontroE _razaoEncontroE = repRazaoEncontro.ObterEntidade(d => d.IdRazaoEncontro == razaoEncontro.IdRazaoEncontro);
                Atribuir(razaoEncontro, _razaoEncontroE);

                repRazaoEncontro.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("RazaoEncontro", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do razaoEncontro
        /// </summary>
        /// <param name="idRazaoEncontro"></param>
        public void Remover(int idRazaoEncontro)
        {
            try
            {
                var repRazaoEncontro = new RepositorioGenerico<RazaoEncontroE>();
                repRazaoEncontro.Remover(d => d.IdRazaoEncontro == idRazaoEncontro);
                repRazaoEncontro.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("RazaoEncontro", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<RazaoEncontroModel> GetQuery()
        {
            var repRazaoEncontro = new RepositorioGenerico<RazaoEncontroE>();
            var pvEntities = (pvEntities)repRazaoEncontro.ObterContexto();
            var query = from razaoEncontro in pvEntities.tb_razao_encontro
                        select new RazaoEncontroModel
                        {
                            IdRazaoEncontro = razaoEncontro.IdRazaoEncontro,
                            DescricaoRazao = razaoEncontro.DescricaoRazao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os razaoEncontro cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<RazaoEncontroModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém razaoEncontro com o código especificiado
        /// </summary>
        /// <param name="idRazaoEncontro"></param>
        /// <returns></returns>
        public RazaoEncontroModel Obter(int idRazaoEncontro)
        {
            return GetQuery().Where(razaoEncontro => razaoEncontro.IdRazaoEncontro == idRazaoEncontro).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém ocupaçoes que iniciam com o descrição
        /// </summary>
        /// <param name="descricaoRazao"></param>
        /// <returns></returns>
        public IEnumerable<RazaoEncontroModel> ObterPorNome(string descricaoRazao)
        {
            return GetQuery().Where(razaoEncontro => razaoEncontro.DescricaoRazao.StartsWith(descricaoRazao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="razaoEncontro"></param>
        /// <param name="_razaoEncontroE"></param>
        private static void Atribuir(RazaoEncontroModel razaoEncontro, RazaoEncontroE _razaoEncontroE)
        {
            _razaoEncontroE.DescricaoRazao = razaoEncontro.DescricaoRazao;
        }
    }
}