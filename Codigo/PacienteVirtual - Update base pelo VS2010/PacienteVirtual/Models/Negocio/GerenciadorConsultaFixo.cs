using Dados;
using PacienteVirtual.Models.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models.Negocio
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
            var repConsultaFixo = new RepositorioGenerico<ConsultaFixoE>();
            ConsultaFixoE _consultaFixoE = new ConsultaFixoE();
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
                var repConsultaFixo = new RepositorioGenerico<ConsultaFixoE>();
                ConsultaFixoE _consultaFixoE = repConsultaFixo.ObterEntidade(cf => cf.IdConsultaFixo == consultaFixo.IdConsultaFixo);
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
            //if (idConsultaFixo == 1)
            //    throw new NegocioException("A consultaFixo não pode ser removido.");
            try
            {
                var repConsultaFixo = new RepositorioGenerico<ConsultaFixoE>();
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
            var repConsultaFixo = new RepositorioGenerico<ConsultaFixoE>();
            var pvEntities = (pvEntities)repConsultaFixo.ObterContexto();
            var query = from tb_consulta_fixo in pvEntities.tb_consulta_fixo
                        select new ConsultaFixoModel
                        {
                            IdConsultaFixo = tb_consulta_fixo.IdConsultaFixo,
                            IdPaciente = tb_consulta_fixo.IdPaciente,
                            EhGabarito = tb_consulta_fixo.EhGabarito,
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
        public IEnumerable<ConsultaFixoModel> ObterPorNome(int IdPaciente)
        {
            return GetQuery().Where(consultaFixo => consultaFixo.IdPaciente == IdPaciente).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaFixo"></param>
        /// <param name="_consultaFixoE"></param>
        private static void Atribuir(ConsultaFixoModel consultaFixo, ConsultaFixoE _consultaFixoE)
        {
            _consultaFixoE.IdPaciente = consultaFixo.IdPaciente;
            _consultaFixoE.EhGabarito = consultaFixo.EhGabarito;
        }
    }
}