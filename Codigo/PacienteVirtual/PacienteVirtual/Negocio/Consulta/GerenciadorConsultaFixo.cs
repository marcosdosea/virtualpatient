using Persistence;
using PacienteVirtual.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorConsultaFixo
    {
        private static GerenciadorConsultaFixo gConsultaFixo;

        private GerenciadorConsultaFixo() { }

        public static GerenciadorConsultaFixo GetInstance()
        {
            if (gConsultaFixo == null)
            {
                gConsultaFixo = new GerenciadorConsultaFixo();
            }
            return gConsultaFixo;
        }

        /// <summary>
        /// Insere dados do consultaFixo
        /// </summary>
        /// <param name="consultaFixo"></param>
        /// <returns></returns>
        public long Inserir(ConsultaFixoModel consultaFixo)
        {
            var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
            tb_consulta_fixo _consultaFixoE = new tb_consulta_fixo();
            try
            {
                Atribuir(consultaFixo, _consultaFixoE);

                repConsultaFixo.Inserir(_consultaFixoE);
                repConsultaFixo.SaveChanges();

                return _consultaFixoE.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do consultaFixo
        /// </summary>
        /// <param name="consultaFixo"></param>
        public void Atualizar(ConsultaFixoModel consultaFixo)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                tb_consulta_fixo _consultaFixoE = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == consultaFixo.IdConsultaFixo);
                Atribuir(consultaFixo, _consultaFixoE);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do consultaFixo
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaFixo)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
                repConsultaFixo.Remover(cf => cf.IdConsultaFixo == idConsultaFixo);
                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaFixo", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ConsultaFixoModel> GetQuery()
        {
            var repConsultaFixo = new RepositorioGenerico<tb_consulta_fixo>();
            var pvEntities = (pvEntities)repConsultaFixo.ObterContexto();
            var query = from tb_consulta_fixo in pvEntities.tb_consulta_fixo
                        select new ConsultaFixoModel
                        {
                            IdConsultaFixo = tb_consulta_fixo.IdConsultaFixo,
                            EhGabarito = tb_consulta_fixo.EhGabarito,
                            DataAtualizacao = (DateTime)tb_consulta_fixo.DataAtualizacao,
                            ComentariosTutor = tb_consulta_fixo.ComentariosTutor,
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os consultaFixo cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConsultaFixoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém consultaFixo com o código especificiado
        /// </summary>
        /// <returns></returns>
        public ConsultaFixoModel Obter(long idConsultaFixo)
        {
            return GetQuery().Where(consultaFixo => consultaFixo.IdConsultaFixo == idConsultaFixo).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
       // public IEnumerable<ConsultaFixoModel> ObterPorNome(int IdPaciente)
        //{
        //    return GetQuery().Where(consultaFixo => consultaFixo.IdPessoa == IdPaciente).ToList();
        //}

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaFixo"></param>
        /// <param name="_consultaFixoE"></param>
        private static void Atribuir(ConsultaFixoModel consultaFixo, tb_consulta_fixo _consultaFixoE)
        {
            _consultaFixoE.IdConsultaFixo = consultaFixo.IdConsultaFixo;
            _consultaFixoE.EhGabarito = consultaFixo.EhGabarito;
            _consultaFixoE.DataAtualizacao = (DateTime)consultaFixo.DataAtualizacao;
            _consultaFixoE.ComentariosTutor = consultaFixo.ComentariosTutor;

        }

        public ConsultaFixoModel TotalConsultasFixas()
        {
            return ObterTodos().ToList().OrderByDescending(o => o.IdConsultaFixo).ElementAtOrDefault(0);
        }
    }
}