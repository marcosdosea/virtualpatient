using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorEstiloVida
    {

        private static GerenciadorEstiloVida gEstiloVida;
        private GerenciadorEstiloVida() { }

        public static GerenciadorEstiloVida GetInstance()
        {
            if (gEstiloVida == null)
            {
                gEstiloVida = new GerenciadorEstiloVida();
            }
            return gEstiloVida;
        }

        /// <summary>
        /// Insere dados do EstiloVida
        /// </summary>
        /// <param name="EstiloVida"></param>
        /// <returns></returns>
        public long Inserir(EstiloVidaModel estiloVidaModel)
        {
            var repEstiloVida = new RepositorioGenerico<EstiloVidaE>();
            EstiloVidaE _EstiloVidaE = new EstiloVidaE();
            try
            {
                Atribuir(estiloVidaModel, _EstiloVidaE);

                repEstiloVida.Inserir(_EstiloVidaE);
                repEstiloVida.SaveChanges();

                return _EstiloVidaE.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("EstiloVida", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do EstiloVida
        /// </summary>
        /// <param name="EstiloVida"></param>
        public void Atualizar(EstiloVidaModel estiloVidaModel)
        {
            try
            {
                var repEstiloVida = new RepositorioGenerico<EstiloVidaE>();
                EstiloVidaE _EstiloVidaE = repEstiloVida.ObterEntidade(dP => dP.IdConsultaVariavel == estiloVidaModel.IdConsultaVariavel);
                Atribuir(estiloVidaModel, _EstiloVidaE);

                repEstiloVida.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("EstiloVida", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do EstiloVida
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repEstiloVida = new RepositorioGenerico<EstiloVidaE>();
                repEstiloVida.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repEstiloVida.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("EstiloVida", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<EstiloVidaModel> GetQuery()
        {
            var repEstiloVida = new RepositorioGenerico<EstiloVidaE>();
            var pvEntities = (pvEntities)repEstiloVida.ObterContexto();
            var query = from tb_estilo_vida in pvEntities.tb_estilo_vida
                        select new EstiloVidaModel
                        {
                            IdConsultaVariavel = tb_estilo_vida.IdConsultaVariavel,
                            TabacoConsumo = tb_estilo_vida.TabacoConsumo,
                            TabacoUso = tb_estilo_vida.TabacoUso,
                            TabacoParou = tb_estilo_vida.TabacoParou,
                            CafeConsumo = tb_estilo_vida.CafeConsumo,
                            CafeUso = tb_estilo_vida.CafeUso,
                            CafeParou = tb_estilo_vida.CafeParou,
                            AlcoolConsumo = tb_estilo_vida.AlcoolConsumo,
                            AlcoolUso = tb_estilo_vida.AlcoolUso,
                            AlcoolParou = tb_estilo_vida.AlcoolParou,
                            AlcoolTipoBebida = tb_estilo_vida.AlcoolTipoBebida,
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os EstiloVidaModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EstiloVidaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém EstiloVidaModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public EstiloVidaModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(EstiloVidaModel => EstiloVidaModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém estilovida que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<EstiloVidaModel> ObterPorIdHistorico(long idConsultaVariavel)
        {
            return GetQuery().Where(EstiloVidaModel => EstiloVidaModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="estiloVidaModel"></param>
        /// <param name="_EstiloVidaE"></param>
        private static void Atribuir(EstiloVidaModel estiloVidaModel, EstiloVidaE _EstiloVidaE)
        {
            _EstiloVidaE.IdConsultaVariavel = estiloVidaModel.IdConsultaVariavel;
            _EstiloVidaE.TabacoConsumo = estiloVidaModel.TabacoConsumo;
            _EstiloVidaE.TabacoUso = estiloVidaModel.TabacoUso;
            _EstiloVidaE.TabacoParou = estiloVidaModel.TabacoParou;
            _EstiloVidaE.CafeConsumo = estiloVidaModel.CafeConsumo;
            _EstiloVidaE.CafeUso = estiloVidaModel.CafeUso;
            _EstiloVidaE.CafeParou = estiloVidaModel.CafeParou;
            _EstiloVidaE.AlcoolConsumo = estiloVidaModel.AlcoolConsumo;
            _EstiloVidaE.AlcoolUso = estiloVidaModel.AlcoolUso;
            _EstiloVidaE.AlcoolParou = estiloVidaModel.AlcoolParou;
            _EstiloVidaE.AlcoolTipoBebida = estiloVidaModel.AlcoolTipoBebida;

        }

    }
}