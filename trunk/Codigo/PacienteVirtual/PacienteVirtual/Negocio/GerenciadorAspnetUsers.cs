using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorAspnetUsers
    {
        private static GerenciadorAspnetUsers gAspnetUsers;

        private GerenciadorAspnetUsers()
        {
        }

        public static GerenciadorAspnetUsers GetInstance()
        {
            if (gAspnetUsers == null)
            {
                gAspnetUsers = new GerenciadorAspnetUsers();
            }
            return gAspnetUsers;
        }

        /// <summary>
        /// Insere dados do pessoa
        /// </summary>
        /// <param name="pessoa"></param>
        /// <returns></returns>
        public int Inserir(AspnetUserModel aspnetUser)
        {
            var repAspnetUser = new RepositorioGenerico<my_aspnet_users>();
            my_aspnet_users _aspnetUserE = new my_aspnet_users();
            try
            {
                Atribuir(aspnetUser, _aspnetUserE);

                repAspnetUser.Inserir(_aspnetUserE);
                repAspnetUser.SaveChanges();

                return _aspnetUserE.id;
            }
            catch (Exception e)
            {
                throw new DadosException("AspnetUser", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados do pessoa
        /// </summary>
        /// <param name="pessoa"></param>
        public void Atualizar(AspnetUserModel aspnetUser)
        {
            try
            {
                var repAspnetUsers = new RepositorioGenerico<my_aspnet_users>();
                my_aspnet_users _aspnet_usersE = repAspnetUsers.ObterEntidade(d => d.id == aspnetUser.Id);
                Atribuir(aspnetUser, _aspnet_usersE);

                repAspnetUsers.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AspnetUser", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do pessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        public void Remover(int idAspnetUser)
        {
            try
            {
                var repAspnetUsers = new RepositorioGenerico<my_aspnet_users>();
                repAspnetUsers.Remover(d => d.id == idAspnetUser);
                repAspnetUsers.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("AspnetUser", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AspnetUserModel> GetQuery()
        {
            var repAspnetUsers = new RepositorioGenerico<my_aspnet_users>();
            var pvEntities = (pvEntities)repAspnetUsers.ObterContexto();
            var query = from my_aspnet_user in pvEntities.my_aspnet_users
                        select new AspnetUserModel
                        {
                            Id = my_aspnet_user.id,
                            ApplicationId = my_aspnet_user.applicationId,
                            Nome = my_aspnet_user.name
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os pessoa cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AspnetUserModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém pessoa com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public AspnetUserModel Obter(int idAspnetUser)
        {
            return GetQuery().Where(pessoa => pessoa.Id == idAspnetUser).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém pessoas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public AspnetUserModel ObterPorNome(string nomeUser)
        {
            return GetQuery().Where(pessoa => pessoa.Nome == nomeUser).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="pessoa"></param>
        /// <param name="_pessoaE"></param>
        private static void Atribuir(AspnetUserModel aspnetuser, my_aspnet_users _aspnetUserE)
        {
            _aspnetUserE.id = aspnetuser.Id;
            _aspnetUserE.applicationId = aspnetuser.ApplicationId;
            _aspnetUserE.name = aspnetuser.Nome;
        }


    }
}