using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorPessoa
    {
        private static GerenciadorPessoa gPessoa;

        private GerenciadorPessoa()
        {
        }

        public static GerenciadorPessoa GetInstance()
        {
            if (gPessoa == null)
            {
                gPessoa = new GerenciadorPessoa();
            }
            return gPessoa;
        }

        /// <summary>
        /// Insere dados do pessoa
        /// </summary>
        /// <param name="pessoa"></param>
        /// <returns></returns>
        public int Inserir(PessoaModel pessoa)
        {
            var repPessoa = new RepositorioGenerico<tb_pessoa>();
            tb_pessoa _pessoaE = new tb_pessoa();
            try
            {
                Atribuir(pessoa, _pessoaE);

                repPessoa.Inserir(_pessoaE);
                repPessoa.SaveChanges();

                return _pessoaE.IdPessoa;
            }
            catch (Exception e)
            {
                throw new DadosException("Pessoa", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do pessoa
        /// </summary>
        /// <param name="pessoa"></param>
        public void Atualizar(PessoaModel pessoa)
        {
            try
            {
                var repPessoa = new RepositorioGenerico<tb_pessoa>();
                tb_pessoa _pessoaE = repPessoa.ObterEntidade(d => d.IdPessoa == pessoa.IdPessoa);
                Atribuir(pessoa, _pessoaE);

                repPessoa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Pessoa", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do pessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        public void Remover(int idPessoa)
        {
            try
            {
                var repPessoa = new RepositorioGenerico<tb_pessoa>();
                repPessoa.Remover(d => d.IdPessoa == idPessoa);
                repPessoa.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Pessoa", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<PessoaModel> GetQuery()
        {
            var repPessoa = new RepositorioGenerico<tb_pessoa>();
            var pvEntities = (pvEntities)repPessoa.ObterContexto();
            var query = from pessoa in pvEntities.tb_pessoa
                        select new PessoaModel
                        {
                            IdPessoa = pessoa.IdPessoa,
                            Nome = pessoa.Nome
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os pessoa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PessoaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém pessoa com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public PessoaModel Obter(int idPessoa)
        {
            return GetQuery().Where(pessoa => pessoa.IdPessoa == idPessoa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém pessoas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<PessoaModel> ObterPorNome(string nome)
        {
            return GetQuery().Where(pessoa => pessoa.Nome.StartsWith(nome)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="pessoa"></param>
        /// <param name="_pessoaE"></param>
        private static void Atribuir(PessoaModel pessoa, tb_pessoa _pessoaE)
        {
            _pessoaE.Nome = pessoa.Nome;
            
        }
    }
}