using System;
using System.Collections.Generic;
using System.Linq;
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
            var query = from tb_pessoa in pvEntities.tb_pessoa
                        join my_aspnet_users in pvEntities.my_aspnet_users
                        on tb_pessoa.idUser equals my_aspnet_users.id
                        select new PessoaModel
                        {
                            IdPessoa = tb_pessoa.IdPessoa,
                            IdUser = tb_pessoa.idUser,
                            Nome = tb_pessoa.Nome,
                            Cpf = tb_pessoa.Cpf,
                            Fone = tb_pessoa.Fone,
                            Matricula = tb_pessoa.Matricula,

                            UserName = my_aspnet_users.name
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
        /// obtem pessoa por CPF
        /// </summary>
        /// <param name="CPF"></param>
        /// <returns></returns>
        public PessoaModel ObterPorCPF(string CPF)
        {
            return GetQuery().Where(pessoa => pessoa.Cpf == CPF).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem todas as pessoas cadastradas no sistema e define se a pessoas é administradora ou não do curso de Farmacia
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PessoaModel> ObterPessoaStatusAdministradoresFarmacia()
        {
            IEnumerable<PessoaModel> pessoas = ObterTodos();
            IEnumerable<TurmaPessoaModel> pessoasTurmaAdministador = GerenciadorTurmaPessoa.GetInstance().ObterTurmaPessoaPorTurma(Global.TurmaAdminFarmacia);
            DefineStatusAdministrador(pessoas, pessoasTurmaAdministador);
            return pessoas;
        }

        /// <summary>
        /// Obtem todas as pessoas cadastradas no sistema e define se a pessoas é administradora ou não do curso de Enfermagem
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PessoaModel> ObterPessoaStatusAdministradoresEnfermagem()
        {
            IEnumerable<PessoaModel> pessoas = ObterTodos();
            IEnumerable<TurmaPessoaModel> pessoasTurmaAdministador = GerenciadorTurmaPessoa.GetInstance().ObterTurmaPessoaPorTurma(Global.TurmaAdminEnfermagem);
            DefineStatusAdministrador(pessoas, pessoasTurmaAdministador);
            return pessoas;
        }

        private static void DefineStatusAdministrador(IEnumerable<PessoaModel> pessoas, IEnumerable<TurmaPessoaModel> pessoasTurmaAdministador)
        {
            bool statusAdministrador = false;
            foreach (var itemPessoa in pessoas)
            {
                statusAdministrador = false;
                foreach (var itemPessoaTurma in pessoasTurmaAdministador)
                {
                    if (itemPessoa.IdPessoa == itemPessoaTurma.IdPessoa && itemPessoaTurma.Ativa == true)
                    {
                        statusAdministrador = true;
                        break;
                    }
                }
                itemPessoa.StatusAdministrador = statusAdministrador;
            }
        }

        /// <summary>
        /// Obtém pessoas que iniciam com o user_name
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public PessoaModel ObterPorUserName(string userName)
        {
            return GetQuery().Where(pessoa => string.Compare(userName, pessoa.UserName, true) == 0).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém pessoas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public PessoaModel ObterPorNome(string nomePessoa)
        {
            return GetQuery().Where(pessoa => pessoa.Nome == nomePessoa).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="pessoa"></param>
        /// <param name="_pessoaE"></param>
        private static void Atribuir(PessoaModel pessoa, tb_pessoa _pessoaE)
        {
            _pessoaE.Nome = pessoa.Nome;
            _pessoaE.idUser = pessoa.IdUser;
            _pessoaE.Cpf = pessoa.Cpf;
            _pessoaE.Fone = pessoa.Fone;
            _pessoaE.Matricula = pessoa.Matricula;
        }


    }
}