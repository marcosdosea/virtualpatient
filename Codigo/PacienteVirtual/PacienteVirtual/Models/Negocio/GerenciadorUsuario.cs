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
    public class GerenciadorUsuario
    {
        public static GerenciadorUsuario gUsuario;

        private GerenciadorUsuario()
        {
        }

        public static GerenciadorUsuario GetInstance()
        {
            if (gUsuario == null)
            {
                gUsuario = new GerenciadorUsuario();
            }
            return gUsuario;
        }

        /// <summary>
        /// inserir dados do Usuario
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public int Inserir(UsuarioModel usuario)
        {
            var repUsuario = new RepositorioGenerico<UsuarioE>();
            UsuarioE _tb_usuario = new UsuarioE();
            try
            {
                Atribuir(usuario, _tb_usuario);

                repUsuario.Inserir(_tb_usuario);
                repUsuario.SaveChanges();

                return _tb_usuario.IdUsuario;
            }
            catch (Exception e)
            {
                throw new NegocioException();
            }

        }

        /// <summary>
        /// Atualiza dados da Usuario
        /// </summary>
        /// <param name="usuario"></param>
        public void Atualizar(UsuarioModel usuario)
        {
            try
            {
                var repUsuario = new RepositorioGenerico<UsuarioE>();
                UsuarioE _tb_usuario = repUsuario.ObterEntidade(d => d.IdUsuario == usuario.IdUsuario);
                Atribuir(usuario, _tb_usuario);

                repUsuario.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("usuario", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do Usuario
        /// </summary>
        /// <param name="IdUsuario"></param>
        public void Remover(int idUsuario)
        {
            try
            {
                var repUsuario = new RepositorioGenerico<UsuarioE>();
                repUsuario.Remover(d => d.IdUsuario == idUsuario);
                repUsuario.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("usuario", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<UsuarioModel> GetQuery()
        {
            var repUsuario = new RepositorioGenerico<UsuarioE>();
            var pvEntities = (pvEntities) repUsuario.ObterContexto();
            var query = from usuario in pvEntities.tb_usuario
                        select new UsuarioModel
                        {
                            IdUsuario = usuario.IdUsuario,
                            Cpf = usuario.Cpf,
                            NomeUsuario = usuario.NomeUsuario,
                            Email = usuario.Email,
                            Login = usuario.Login,
                            Senha = usuario.Senha,
                            tpUsuario = usuario.tpUsuario
                        };
            return query;
        }

        /// <summary>
        /// Obtém todas os usuários cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<UsuarioModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém Usuário com o código especificiado
        /// </summary>
        /// <param name="idUsuário"></param>
        /// <returns></returns>
        public UsuarioModel Obter(int idUsuario)
        {
            return GetQuery().Where(usuario => usuario.IdUsuario == idUsuario).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém Usuários que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<UsuarioModel> ObterPorNome(string nomeUsuario)
        {
            return GetQuery().Where(usuario => usuario.NomeUsuario.StartsWith(nomeUsuario)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="_tb_usuario"></param>
        private static void Atribuir(UsuarioModel usuario, UsuarioE _tb_usuario)
        {
            _tb_usuario.Cpf = usuario.Cpf;
            _tb_usuario.NomeUsuario = usuario.NomeUsuario;
            _tb_usuario.Email = usuario.Email;
            _tb_usuario.Login = usuario.Login;
            _tb_usuario.Senha = usuario.Senha;
            _tb_usuario.tpUsuario = usuario.tpUsuario;
        }
    }
}