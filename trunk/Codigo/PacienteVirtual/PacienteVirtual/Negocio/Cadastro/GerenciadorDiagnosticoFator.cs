using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDiagnosticoFator
    {
        public static GerenciadorDiagnosticoFator gDiagnosticoFator;

        private GerenciadorDiagnosticoFator()
        {
        }

        public static GerenciadorDiagnosticoFator GetInstance()
        {
            if (gDiagnosticoFator == null)
            {
                gDiagnosticoFator = new GerenciadorDiagnosticoFator();
            }
            return gDiagnosticoFator;
        }

        /// <summary>
        /// inserir dados da diagnosticoFator
        /// </summary>
        /// <param name="diagnosticoFator"></param>
        /// <returns></returns>
        public int Inserir(DiagnosticoFatorModel diagnosticoFator)
        {
            var repDiagnosticoFator = new RepositorioGenerico<tb_diagnostico_fator>();
            tb_diagnostico_fator _tb_diagnostico_fator = new tb_diagnostico_fator();
            try
            {
                Atribuir(diagnosticoFator, _tb_diagnostico_fator);

                repDiagnosticoFator.Inserir(_tb_diagnostico_fator);
                repDiagnosticoFator.SaveChanges();

                return _tb_diagnostico_fator.IdDiagnosticoFator;
            }
            catch (Exception e)
            {
                throw new NegocioException("DiagnosticoFator", e.Message, e);
            }

        }

        /// <summary>
        /// Atualiza dados da DiagnosticoFator
        /// </summary>
        /// <param name="diagnosticoFator"></param>
        public void Atualizar(DiagnosticoFatorModel diagnosticoFator)
        {
            try
            {
                var repDiagnosticoFator = new RepositorioGenerico<tb_diagnostico_fator>();
                tb_diagnostico_fator _tb_diagnostico_fator = repDiagnosticoFator.ObterEntidade(d => d.IdDiagnosticoFator == diagnosticoFator.IdDiagnosticoFator);
                Atribuir(diagnosticoFator, _tb_diagnostico_fator);

                repDiagnosticoFator.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoFator", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados da DiagnosticoFator
        /// </summary>
        /// <param name="idDiagnosticoFator"></param>
        public void Remover(int idDiagnosticoFator)
        {
            try
            {
                var repDiagnosticoFator = new RepositorioGenerico<tb_diagnostico_fator>();
                repDiagnosticoFator.Remover(d => d.IdDiagnosticoFator == idDiagnosticoFator);
                repDiagnosticoFator.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DiagnosticoFator", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DiagnosticoFatorModel> GetQuery()
        {
            var repDiagnosticoFator = new RepositorioGenerico<tb_diagnostico_fator>();
            var pvEntities = (pvEntities)repDiagnosticoFator.ObterContexto();
            var query = from diagnosticoFator in pvEntities.tb_diagnostico_fator
                        select new DiagnosticoFatorModel
                        {
                            IdDiagnosticoFator = diagnosticoFator.IdDiagnosticoFator,
                            IdDiagnostico = diagnosticoFator.IdDiagnostico,
                            DescricaoFatorDiagnostico = diagnosticoFator.DescricaoFator,
                            DescricaoDiagnostico = diagnosticoFator.tb_diagnostico.Diagnostico
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os diagnosticoFator cadastradas
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiagnosticoFatorModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém DiagnosticoFator com o código especificiado
        /// </summary>
        /// <param name="idDiagnosticoFator"></param>
        /// <returns></returns>
        public DiagnosticoFatorModel Obter(int idDiagnosticoFator)
        {
            return GetQuery().Where(diagnosticoFator => diagnosticoFator.IdDiagnosticoFator == idDiagnosticoFator).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtem todos os fatores de determinado diagnostico
        /// </summary>
        /// <param name="idDiagnostico">Identificador do diagnostico</param>
        /// <returns></returns>
        public IEnumerable<DiagnosticoFatorModel> ObterPorDiagnostico(int idDiagnostico)
        {
            return GetQuery().Where(diagnosticoFator => diagnosticoFator.IdDiagnostico == idDiagnostico).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="diagnosticoFator"></param>
        /// <param name="_tb_diagnostico_fator"></param>
        private static void Atribuir(DiagnosticoFatorModel diagnosticoFator, tb_diagnostico_fator _tb_diagnostico_fator)
        {
            _tb_diagnostico_fator.IdDiagnosticoFator = diagnosticoFator.IdDiagnosticoFator;
            _tb_diagnostico_fator.IdDiagnostico = diagnosticoFator.IdDiagnostico;
            _tb_diagnostico_fator.DescricaoFator = diagnosticoFator.DescricaoFatorDiagnostico;
        }

        public void CorrigirRespostas(IEnumerable<DiagnosticoFatorModel> listaFator, IEnumerable<DiagnosticoFatorModel> 
            listaFatorGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            bool contem;
            foreach (var fator in listaFator)
            {
                contem = false;
                foreach (var fatorGabarito in listaFatorGabarito)
                {
                    if (fator.IdDiagnosticoFator == fatorGabarito.IdDiagnosticoFator)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + fator.DescricaoFatorDiagnostico + ";<br>";
                }
            }
            foreach (var fatorGabarito in listaFatorGabarito)
            {
                contem = false;
                foreach (var fator in listaFator)
                {
                    if (fator.IdDiagnosticoFator == fatorGabarito.IdDiagnosticoFator)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + fatorGabarito.DescricaoFatorDiagnostico + 
                        ";<br>";
                }
            }
            modelState.AddModelError("ErroFator", (erroNaoContemNoGabarito.Equals("") ? " " : "Fatores Diagnósticos que não contém " +
                "no Gabarito: " + erroNaoContemNoGabarito + "<br>") + (erroContemGabaritoNaoContemResposta.Equals("") ? " " :
                "Fatores Diagnósticos que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }
    }
}