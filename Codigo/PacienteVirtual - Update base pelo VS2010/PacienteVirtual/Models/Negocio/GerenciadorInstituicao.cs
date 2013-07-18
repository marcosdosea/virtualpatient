using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dados;
using System.Data.Common;
using PacienteVirtual.Models;
using PacienteVirtual.Models.Data;
using Negocio;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorInstituicao
    {
        public static GerenciadorInstituicao gInstituicao;

        private GerenciadorInstituicao()
        {
        }

        public static GerenciadorInstituicao GetInstance() 
        {
            if (gInstituicao == null)
            {
                gInstituicao = new GerenciadorInstituicao();
            }
            return gInstituicao;
        }

        /// <summary>
        /// inserir dados da Instituição
        /// </summary>
        /// <param name="instituicao"></param>
        /// <returns></returns>
        public int Inserir(InstituicaoModel instituicao)
        {
            var repInstituicao = new RepositorioGenerico<InstituicaoE>();
            InstituicaoE _tb_instituicao = new InstituicaoE();
            try
            {
                Atribuir(instituicao, _tb_instituicao);

                repInstituicao.Inserir(_tb_instituicao);
                repInstituicao.SaveChanges();

                return _tb_instituicao.IdInstituicao;
            }
            catch (Exception e)
            {
                throw new DadosException("instituicao", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da Instituição
        /// </summary>
        /// <param name="instituicao"></param>
        public void Atualizar(InstituicaoModel instituicao)
        {
            try
            {
                var repInstituicao = new RepositorioGenerico<InstituicaoE>();
                InstituicaoE _tb_instituicao = repInstituicao.ObterEntidade(d => d.IdInstituicao == instituicao.IdInstituicao);
                Atribuir(instituicao, _tb_instituicao);

                repInstituicao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("instituicao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da Instituição
        /// </summary>
        /// <param name="idInstituicao"></param>
        public void Remover(int idInstituicao)
        {
            try
            {
                var repInstituicao = new RepositorioGenerico<InstituicaoE>();
                repInstituicao.Remover(d => d.IdInstituicao == idInstituicao);
                repInstituicao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("instituicao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<InstituicaoModel> GetQuery()
        {
            var repInstituicao = new RepositorioGenerico<InstituicaoE>();
            var pvEntities = (pvEntities)repInstituicao.ObterContexto();
            var query = from instituicao in pvEntities.tb_instituicao
                        select new InstituicaoModel
                        {
                            IdInstituicao = instituicao.IdInstituicao,
                            NomeInstituicao = instituicao.NomeInstituicao,
                            Sigla = instituicao.Sigla
                        };
            return query;
        }

        /// <summary>
        /// Obtém todas as instituições cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<InstituicaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Instituicao com o código especificiado
        /// </summary>
        /// <param name="idInstituicao"></param>
        /// <returns></returns>
        public InstituicaoModel Obter(int idInstituicao)
        {
            return GetQuery().Where(instituicao => instituicao.IdInstituicao == idInstituicao).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém Instituicões que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<InstituicaoModel> ObterPorNome(string nomeInstituicao)
        {
            return GetQuery().Where(instituicao => instituicao.NomeInstituicao.StartsWith(nomeInstituicao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="instituicao"></param>
        /// <param name="_tb_instituicao"></param>
        private static void Atribuir(InstituicaoModel instituicao, InstituicaoE _tb_instituicao)
        {
            _tb_instituicao.NomeInstituicao = instituicao.NomeInstituicao;
            _tb_instituicao.Sigla = instituicao.Sigla;
        }
    }
}