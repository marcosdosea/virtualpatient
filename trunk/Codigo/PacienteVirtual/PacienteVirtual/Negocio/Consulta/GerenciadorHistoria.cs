using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorHistoria
    {
        private static GerenciadorHistoria gHistoria;

        private GerenciadorHistoria() { }

        public static GerenciadorHistoria GetInstance()
        {
            if (gHistoria == null)
            {
                gHistoria = new GerenciadorHistoria();
            }
            return gHistoria;
        }

        /// <summary>
        /// Insere dados do historia
        /// </summary>
        /// <param name="historia"></param>
        /// <returns></returns>
        public long Inserir(HistoriaModel historia)
        {
            var repHistoria = new RepositorioGenerico<tb_historia>();
            tb_historia _historiaE = new tb_historia();
            try
            {
                Atribuir(historia, _historiaE);

                repHistoria.Inserir(_historiaE);
                repHistoria.SaveChanges();

                return _historiaE.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("Historia", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do historia
        /// </summary>
        /// <param name="historia"></param>
        public void Atualizar(HistoriaModel historia)
        {
            try
            {
                var repHistoria = new RepositorioGenerico<tb_historia>();
                tb_historia _historiaE = repHistoria.ObterEntidade(h => h.IdConsultaFixo == historia.IdConsultaFixo);
                Atribuir(historia, _historiaE);

                repHistoria.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Historia", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do historia
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaFixo)
        {
            //if (idConsultaFixo == 1)
            //    throw new NegocioException("A historia não pode ser removido.");
            try
            {
                var repHistoria = new RepositorioGenerico<tb_historia>();
                repHistoria.Remover(h => h.IdConsultaFixo == idConsultaFixo);
                repHistoria.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Historia", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<HistoriaModel> GetQuery()
        {
            var repHistoria = new RepositorioGenerico<tb_historia>();
            var pvEntities = (pvEntities)repHistoria.ObterContexto();
            var query = from historia in pvEntities.tb_historia
                        select new HistoriaModel
                        {
                            IdConsultaFixo = historia.IdConsultaFixo,
                            HistoriaFamiliar = historia.HistoriaFamiliar,
                            HistoriaMedicaPregressa = historia.HistoriaMedicaPregressa,
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os historia cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<HistoriaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém historia com o código especificiado
        /// </summary>
        /// <returns></returns>
        public HistoriaModel Obter(long idConsultaFixo)
        {
            return GetQuery().Where(historia => historia.IdConsultaFixo == idConsultaFixo).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<HistoriaModel> ObterPorIdCursoFixo(long IdConsultaFixo)
        {
            return GetQuery().Where(historia => historia.IdConsultaFixo == IdConsultaFixo).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="historia"></param>
        /// <param name="_historiaE"></param>
        private static void Atribuir(HistoriaModel historia, tb_historia _historiaE)
        {
            _historiaE.IdConsultaFixo = historia.IdConsultaFixo;
            _historiaE.HistoriaFamiliar = historia.HistoriaFamiliar;
            _historiaE.HistoriaMedicaPregressa = historia.HistoriaMedicaPregressa;
        }



    }
}