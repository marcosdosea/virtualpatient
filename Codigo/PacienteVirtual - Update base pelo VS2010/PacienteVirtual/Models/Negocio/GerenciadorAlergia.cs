using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;
using Dados;

namespace PacienteVirtual.Models.Negocio
{
    public class GerenciadorAlergia
    {
        public static GerenciadorAlergia gAlergia;

        private GerenciadorAlergia() { }

        public static GerenciadorAlergia GetInstance()
        {
            if (gAlergia == null)
            {
                gAlergia = new GerenciadorAlergia();
            }
            return gAlergia;
        }

        /// <summary>
        /// Insere dados do alergia
        /// </summary>
        /// <param name="alergia"></param>
        /// <returns></returns>
        public int Inserir(AlergiaModel alergia)
        {
            var repConsultaFixo = new RepositorioGenerico<AlergiaE>();
            AlergiaE _alergiaE = new AlergiaE();
            try
            {
                Atribuir(alergia, _alergiaE);

                repConsultaFixo.Inserir(_alergiaE);
                repConsultaFixo.SaveChanges();

                return _alergiaE.IdAlergia;
            }
            catch (Exception e)
            {
                throw new DadosException("Alergia", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do alergia
        /// </summary>
        /// <param name="alergia"></param>
        public void Atualizar(AlergiaModel alergia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<AlergiaE>();
                AlergiaE _alergiaE = repConsultaFixo.ObterEntidade(cf => cf.IdAlergia == alergia.IdAlergia);
                Atribuir(alergia, _alergiaE);

                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Alergia", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do alergia
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(int idAlergia)
        {
            try
            {
                var repConsultaFixo = new RepositorioGenerico<AlergiaE>();
                repConsultaFixo.Remover(cf => cf.IdAlergia == idAlergia);
                repConsultaFixo.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Alergia", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<AlergiaModel> GetQuery()
        {
            var repAlergia = new RepositorioGenerico<AlergiaE>();
            var pvEntities = (pvEntities)repAlergia.ObterContexto();
            var query = from alergia in pvEntities.tb_alergia

                        select new AlergiaModel
                        {
                            IdAlergia = alergia.IdAlergia,
                            Alergia = alergia.Alergia,
   
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os alergia cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<AlergiaModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém alergia com o código especificiado
        /// </summary>
        /// <returns></returns>
        public AlergiaModel Obter(long idAlergia)
        {
            return GetQuery().Where(alergia => alergia.IdAlergia == idAlergia).ToList().ElementAtOrDefault(0);
        }
        
        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="alergia"></param>
        /// <param name="_alergiaE"></param>
        private static void Atribuir(AlergiaModel alergia, AlergiaE _alergiaE)
        {
            _alergiaE.Alergia = alergia.Alergia;
        }
    }
}