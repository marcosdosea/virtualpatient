using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Cadastro;
using PacienteVirtual.Models;
using Persistence;
using Negocio;

namespace PacienteVirtual.Negocio.Cadastro
{
    public class GerenciadorObjetivoTerapeutico
    {
        public static GerenciadorObjetivoTerapeutico gObjetivoTerapeutico;

        private GerenciadorObjetivoTerapeutico()
        {
        }

        public static GerenciadorObjetivoTerapeutico GetInstance()
        {
            if (gObjetivoTerapeutico == null)
            {
                gObjetivoTerapeutico = new GerenciadorObjetivoTerapeutico();
            }
            return gObjetivoTerapeutico;
        }

        /// <summary>
        /// inserir dados da objetivoTerapeutico
        /// </summary>
        /// <param name="objetivoTerapeutico"></param>
        /// <returns></returns>
        public int Inserir(ObjetivoTerapeuticoModel objetivoTerapeutico)
        {
            var repObjetivoTerapeutico = new RepositorioGenerico<tb_objetivo_terapeutico>();
            tb_objetivo_terapeutico _tb_objetivo_terapeutico = new tb_objetivo_terapeutico();
            try
            {
                Atribuir(objetivoTerapeutico, _tb_objetivo_terapeutico);

                repObjetivoTerapeutico.Inserir(_tb_objetivo_terapeutico);
                repObjetivoTerapeutico.SaveChanges();

                return _tb_objetivo_terapeutico.IdObjetivoTerapeutico;
            }
            catch (Exception e)
            {
                throw new NegocioException("ObjetivoTerapeutico", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da ObjetivoTerapeutico
        /// </summary>
        /// <param name="objetivoTerapeutico"></param>
        public void Atualizar(ObjetivoTerapeuticoModel objetivoTerapeutico)
        {
            try
            {
                var repObjetivoTerapeutico = new RepositorioGenerico<tb_objetivo_terapeutico>();
                tb_objetivo_terapeutico _tb_objetivo_terapeutico = repObjetivoTerapeutico.ObterEntidade(d => d.IdObjetivoTerapeutico == objetivoTerapeutico.IdObjetivoTerapeutico);
                Atribuir(objetivoTerapeutico, _tb_objetivo_terapeutico);

                repObjetivoTerapeutico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ObjetivoTerapeutico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da ObjetivoTerapeutico
        /// </summary>
        /// <param name="idObjetivoTerapeutico"></param>
        public void Remover(int idObjetivoTerapeutico)
        {
            try
            {
                var repObjetivoTerapeutico = new RepositorioGenerico<tb_objetivo_terapeutico>();
                repObjetivoTerapeutico.Remover(d => d.IdObjetivoTerapeutico == idObjetivoTerapeutico);
                repObjetivoTerapeutico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ObjetivoTerapeutico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ObjetivoTerapeuticoModel> GetQuery()
        {
            var repObjetivoTerapeutico = new RepositorioGenerico<tb_objetivo_terapeutico>();
            var pvEntities = (pvEntities)repObjetivoTerapeutico.ObterContexto();
            var query = from tb_objetivo_terapeutico in pvEntities.tb_objetivo_terapeutico
                        select new ObjetivoTerapeuticoModel
                        {
                            IdObjetivoTerapeutico = tb_objetivo_terapeutico.IdObjetivoTerapeutico,
                            DescricaoObjetivoTerapeutico = tb_objetivo_terapeutico.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os objetivos terapeuticos cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ObjetivoTerapeuticoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ObjetivoTerapeutico com o código especificiado
        /// </summary>
        /// <param name="idObjetivoTerapeutico"></param>
        /// <returns></returns>
        public ObjetivoTerapeuticoModel Obter(int idObjetivoTerapeutico)
        {
            return GetQuery().Where(ob => ob.IdObjetivoTerapeutico == idObjetivoTerapeutico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém a partir da descricção
        /// </summary>
        /// <param name="descricao"></param>
        /// <returns></returns>
        public IEnumerable<ObjetivoTerapeuticoModel> ObterPorNome(string descricao)
        {
            return GetQuery().Where(ob => ob.DescricaoObjetivoTerapeutico.StartsWith(descricao)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="objetivoTerapeutico"></param>
        /// <param name="_tb_objetivo_terapeutico"></param>
        private static void Atribuir(ObjetivoTerapeuticoModel objetivoTerapeutico, tb_objetivo_terapeutico _tb_objetivo_terapeutico)
        {
            _tb_objetivo_terapeutico.Descricao = objetivoTerapeutico.DescricaoObjetivoTerapeutico;
        }
    }
}