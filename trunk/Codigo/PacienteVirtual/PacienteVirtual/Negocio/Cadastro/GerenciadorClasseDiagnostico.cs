using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorClasseDiagnostico
    {
        public static GerenciadorClasseDiagnostico gClasseDiagnostico;

        private GerenciadorClasseDiagnostico()
        {
        }

        public static GerenciadorClasseDiagnostico GetInstance()
        {
            if (gClasseDiagnostico == null)
            {
                gClasseDiagnostico = new GerenciadorClasseDiagnostico();
            }
            return gClasseDiagnostico;
        }

        /// <summary>
        /// inserir dados da classeDiagnostico
        /// </summary>
        /// <param name="classeDiagnostico"></param>
        /// <returns></returns>
        public int Inserir(ClasseDiagnosticoModel classeDiagnostico)
        {
            var repClasseDiagnostico = new RepositorioGenerico<tb_classe_diagnostico>();
            tb_classe_diagnostico _tb_classe_diagnostico = new tb_classe_diagnostico();
            try
            {
                Atribuir(classeDiagnostico, _tb_classe_diagnostico);

                repClasseDiagnostico.Inserir(_tb_classe_diagnostico);
                repClasseDiagnostico.SaveChanges();

                return _tb_classe_diagnostico.IdClasseDiagnostico;
            }
            catch (Exception e)
            {
                throw new NegocioException("ClasseDiagnostico", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da ClasseDiagnostico
        /// </summary>
        /// <param name="classeDiagnostico"></param>
        public void Atualizar(ClasseDiagnosticoModel classeDiagnostico)
        {
            try
            {
                var repClasseDiagnostico = new RepositorioGenerico<tb_classe_diagnostico>();
                tb_classe_diagnostico _tb_classe_diagnostico = repClasseDiagnostico.ObterEntidade(d => d.IdClasseDiagnostico == classeDiagnostico.IdClasseDiagnostico);
                Atribuir(classeDiagnostico, _tb_classe_diagnostico);

                repClasseDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ClasseDiagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da ClasseDiagnostico
        /// </summary>
        /// <param name="idClasseDiagnostico"></param>
        public void Remover(int idClasseDiagnostico)
        {
            try
            {
                var repClasseDiagnostico = new RepositorioGenerico<tb_classe_diagnostico>();
                repClasseDiagnostico.Remover(d => d.IdClasseDiagnostico == idClasseDiagnostico);
                repClasseDiagnostico.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ClasseDiagnostico", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ClasseDiagnosticoModel> GetQuery()
        {
            var repClasseDiagnostico = new RepositorioGenerico<tb_classe_diagnostico>();
            var pvEntities = (pvEntities)repClasseDiagnostico.ObterContexto();
            var query = from classeDiagnostico in pvEntities.tb_classe_diagnostico
                        select new ClasseDiagnosticoModel
                        {
                            IdClasseDiagnostico = classeDiagnostico.IdClasseDiagnostico,
                            IdDominioDiagnostico = classeDiagnostico.IdDominioDiagnostico,
                            DescricaoClasseDiagnostico = classeDiagnostico.DescricaoClasse,

                            DescricaoDominioDiagnostico = classeDiagnostico.tb_dominio_diagnostico.DescricaoDominio
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os GruposDiagnosticos cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ClasseDiagnosticoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ClasseDiagnostico com o código especificiado
        /// </summary>
        /// <param name="idClasseDiagnostico"></param>
        /// <returns></returns>
        public ClasseDiagnosticoModel Obter(int idClasseDiagnostico)
        {
            return GetQuery().Where(classeDiagnostico => classeDiagnostico.IdClasseDiagnostico == idClasseDiagnostico).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem classes diagnostico de determinado dominio diagnostico
        /// </summary>
        /// <param name="idDominioDiagnnostico">Identificador do domínio do diagnostico</param>
        /// <returns>Lista de Classes Diagnostico</returns>
        public IEnumerable<ClasseDiagnosticoModel> ObterPorDominio(int idDominioDiagnnostico)
        {
            return GetQuery().Where(c => c.IdClasseDiagnostico == idDominioDiagnnostico).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="classeDiagnostico"></param>
        /// <param name="_tb_classe_diagnostico"></param>
        private static void Atribuir(ClasseDiagnosticoModel classeDiagnostico, tb_classe_diagnostico _tb_classe_diagnostico)
        {
            _tb_classe_diagnostico.DescricaoClasse = classeDiagnostico.DescricaoClasseDiagnostico;
            _tb_classe_diagnostico.IdDominioDiagnostico = classeDiagnostico.IdDominioDiagnostico;
        }
    }
}