using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorConsultaParametro
    {
        private static GerenciadorConsultaParametro gConsultaParametro;
        private GerenciadorConsultaParametro() { }

        public static GerenciadorConsultaParametro GetInstance()
        {
            if (gConsultaParametro == null)
            {
                gConsultaParametro = new GerenciadorConsultaParametro();
            }
            return gConsultaParametro;
        }

        /// <summary>
        /// Faz correcao do ParamentroConsulta de uma consulta
        /// </summary>
        /// <param name="ListaParametro"></param>
        /// <param name="listaParametroGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(IEnumerable<ConsultaParametroModel> ListaParametro, IEnumerable<ConsultaParametroModel> listaParametroGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            string erroRespostas = "";
            bool contem;
            foreach (var parametro in ListaParametro)
            {
                contem = false;
                foreach (var parametroGabarito in listaParametroGabarito)
                {
                    if (parametro.IdParametroClinico == parametroGabarito.IdParametroClinico)
                    {
                        contem = true;
                        if (parametro.Valor != parametroGabarito.Valor || !parametro.ValorReferencia.Equals(parametroGabarito.ValorReferencia) || !parametro.Unidade.Equals(parametroGabarito.Unidade))
                        {
                            erroRespostas = erroRespostas + "Gabarito do Parâmetro Clínico: " + parametro.ParametroClinico + ": " + parametroGabarito.Valor + ", " + parametroGabarito.ValorReferencia + " e " + parametroGabarito.Unidade + "; " + Environment.NewLine;
                        }
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + parametro.ParametroClinico + "; " + Environment.NewLine;
                }
            }
            foreach (var parametroGabarito in listaParametroGabarito)
            {
                contem = false;
                foreach (var parametro in ListaParametro)
                {
                    if (parametro.IdParametroClinico == parametroGabarito.IdParametroClinico)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + parametroGabarito.ParametroClinico + "; " + Environment.NewLine;
                }
            }
            modelState.AddModelError("ErroParametroClinico", (erroRespostas.Equals("") ? "" : erroRespostas + Environment.NewLine) +
                (erroNaoContemNoGabarito.Equals("") ? "" : "Parâmetros Clínicos que não contém no Gabarito: " + erroNaoContemNoGabarito + Environment.NewLine) +
                (erroContemGabaritoNaoContemResposta.Equals("") ? "" : "Parâmetros Clínicos que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Insere dados do ConsultaParametro
        /// </summary>
        /// <param name="ConsultaParametro"></param>
        /// <returns></returns>
        public long Inserir(ConsultaParametroModel consultaParametroModel)
        {
            var repConsultaParametro = new RepositorioGenerico<tb_consulta_parametro>();
            tb_consulta_parametro _tb_consulta_parametro = new tb_consulta_parametro();
            try
            {
                Atribuir(consultaParametroModel, _tb_consulta_parametro);

                repConsultaParametro.Inserir(_tb_consulta_parametro);
                repConsultaParametro.SaveChanges();

                return _tb_consulta_parametro.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaParametro", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do ConsultaParametro
        /// </summary>
        /// <param name="ConsultaParametro"></param>
        public void Atualizar(ConsultaParametroModel consultaParametroModel)
        {
            try
            {
                var repConsultaParametro = new RepositorioGenerico<tb_consulta_parametro>();
                tb_consulta_parametro _tb_consulta_parametro = repConsultaParametro.ObterEntidade(dP => dP.IdConsultaVariavel == consultaParametroModel.IdConsultaVariavel);
                Atribuir(consultaParametroModel, _tb_consulta_parametro);

                repConsultaParametro.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaParametro", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do ConsultaParametro
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel, long idParametroClinico)
        {
            try
            {
                var repConsultaParametro = new RepositorioGenerico<tb_consulta_parametro>();
                repConsultaParametro.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel && dP.IdParametroClinico == idParametroClinico);
                repConsultaParametro.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ConsultaParametro", e.Message, e);
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ConsultaParametroModel> GetQuery()
        {
            var repConsultaParametro = new RepositorioGenerico<tb_consulta_parametro>();
            var pvEntities = (pvEntities)repConsultaParametro.ObterContexto();
            var query = from tb_consulta_parametro in pvEntities.tb_consulta_parametro
                        join tb_parametro_clinico in pvEntities.tb_parametro_clinico
                        on tb_consulta_parametro.IdParametroClinico equals tb_parametro_clinico.IdParametroClinico
                        select new ConsultaParametroModel
                        {
                            IdConsultaVariavel = tb_consulta_parametro.IdConsultaVariavel,
                            IdParametroClinico = tb_consulta_parametro.IdParametroClinico,
                            Unidade = tb_consulta_parametro.Unidade,
                            Valor = (float)tb_consulta_parametro.Valor,
                            ValorReferencia = tb_consulta_parametro.ValorReferencia,

                            ParametroClinico = tb_parametro_clinico.ParametroClinico
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os ConsultaParametroModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConsultaParametroModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ConsultaParametroModel com o código especificiado
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ConsultaParametroModel> Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(ConsultaParametroModel => ConsultaParametroModel.IdConsultaVariavel == idConsultaVariavel).ToList();
        }
        
        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="consultaParametroModel"></param>
        /// <param name="_tb_consulta_parametro"></param>
        private static void Atribuir(ConsultaParametroModel consultaParametroModel, tb_consulta_parametro _tb_consulta_parametro)
        {
            _tb_consulta_parametro.IdConsultaVariavel = consultaParametroModel.IdConsultaVariavel;
            _tb_consulta_parametro.IdParametroClinico = consultaParametroModel.IdParametroClinico;
            _tb_consulta_parametro.Valor = consultaParametroModel.Valor;
            _tb_consulta_parametro.ValorReferencia = consultaParametroModel.ValorReferencia;
            _tb_consulta_parametro.Unidade = consultaParametroModel.Unidade;

        }
    }
}