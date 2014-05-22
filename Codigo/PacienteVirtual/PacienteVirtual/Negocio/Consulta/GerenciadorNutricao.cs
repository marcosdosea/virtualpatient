using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using System.Web.Mvc;
using Persistence;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorNutricao
    { private static GerenciadorNutricao gNutricao;
        private GerenciadorNutricao() { }

        public static GerenciadorNutricao GetInstance()
        {
            if (gNutricao == null)
            {
                gNutricao = new GerenciadorNutricao();
            }
            return gNutricao;
        }

        /// <summary>
        /// Faz correção de Nutricao de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="Nutricao"></param>
        /// <param name="NutricaoGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(NutricaoModel nutricao, NutricaoModel nutricaoGabarito, ModelStateDictionary modelState)
        {
        }

        /// <summary>
        /// Insere dados do Nutricao
        /// </summary>
        /// <param name="Nutricao"></param>
        /// <returns></returns>
        public long Inserir(NutricaoModel NutricaoModel)
        {
            var repNutricao = new RepositorioGenerico<tb_nutricao>();
            tb_nutricao _tb_nutricao = new tb_nutricao();
            try
            {
                Atribuir(NutricaoModel, _tb_nutricao);

                repNutricao.Inserir(_tb_nutricao);
                repNutricao.SaveChanges();

                return _tb_nutricao.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("Nutricao", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do Nutricao
        /// </summary>
        /// <param name="Nutricao"></param>
        public void Atualizar(NutricaoModel NutricaoModel)
        {
            try
            {
                var repNutricao = new RepositorioGenerico<tb_nutricao>();
                tb_nutricao _tb_nutricao = repNutricao.ObterEntidade(dP => dP.IdConsultaVariavel == NutricaoModel.IdConsultaVariavel);
                Atribuir(NutricaoModel, _tb_nutricao);

                repNutricao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Nutricao", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do Nutricao
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repNutricao = new RepositorioGenerico<tb_nutricao>();
                repNutricao.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repNutricao.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("Nutricao", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<NutricaoModel> GetQuery()
        {
            var repNutricao = new RepositorioGenerico<tb_nutricao>();
            var pvEntities = (pvEntities)repNutricao.ObterContexto();
            var query = from nutricao in pvEntities.tb_nutricao
                        select new NutricaoModel
                        {
                            IdConsultaVariavel = nutricao.IdConsultaVariavel,
                            Peso = (double)nutricao.Peso,
                            Altura = (double)nutricao.Altura,
                            EstadoNutricional = (nutricao.EstadoNutricional == "AumentoPeso" ? ListaEstadoNutricional.AumentoPeso : (nutricao.EstadoNutricional == "Caqueixa" ? ListaEstadoNutricional.Caqueixa : (nutricao.EstadoNutricional == "PerdaPeso" ? ListaEstadoNutricional.PerdaPeso : (nutricao.EstadoNutricional == "PesoNormal" ? ListaEstadoNutricional.PesoNormal : ListaEstadoNutricional.Sobrepeso)))),
                            NutricaoOral = nutricao.NutricaoOral,
                            Disfagia = nutricao.Disfagia,
                            DificuldadeMastigar = nutricao.DificuldadeMastigar,
                            SangramentoGengival = nutricao.SangramentoGengival,
                            AusenciaDentes = nutricao.AusenciaDentes,
                            Nausea = nutricao.Nausea,
                            Emese = nutricao.Emese,
                            Pirose = nutricao.Pirose,
                            IngestaHidrica = nutricao.IngestaHidrica,
                            IngestaHidricaValor = (double)nutricao.IngestaHidricaValor,
                            RestricaoHidrica = nutricao.RestricaoHidrica,
                            RestricaoHidricaValor = (double)nutricao.RestricaoHidricaValor,
                            SemRestricao = nutricao.SemRestricao,
                            RestricaoAlimentar = nutricao.RestricaoAlimentar,
                            RestricaoAlimentarTexto = nutricao.RestricaoAlimentarTexto,
                            HabitosAlimentares = nutricao.HabitosAlimentares,
                            DispositivosAlimentacao = (nutricao.DispositivosAlimentacao == "NaoSeAplica" ? ListaDispositivosAlimentacao.NaoSeAplica : (nutricao.DispositivosAlimentacao == "Gastrostomia" ? ListaDispositivosAlimentacao.Gastrostomia : (nutricao.DispositivosAlimentacao == "Jejunostomia" ? ListaDispositivosAlimentacao.Jejunostomia : (nutricao.DispositivosAlimentacao=="NPT" ? ListaDispositivosAlimentacao.NPT : (nutricao.DispositivosAlimentacao == "SNE" ? ListaDispositivosAlimentacao.SNE : ListaDispositivosAlimentacao.SNG))))),
                            Instalada = (DateTime)nutricao.Instalada
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os NutricaoModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<NutricaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém NutricaoModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public NutricaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(NutricaoModel => NutricaoModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }


        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="NutricaoModel"></param>
        /// <param name="_tb_nutricao"></param>
        private static void Atribuir(NutricaoModel nutricao, tb_nutricao _nutricaoE)
        {
            _nutricaoE.IdConsultaVariavel = nutricao.IdConsultaVariavel;
            _nutricaoE.Peso = (decimal)nutricao.Peso;
            _nutricaoE.Altura = (decimal)nutricao.Altura;
            _nutricaoE.EstadoNutricional = nutricao.EstadoNutricional.ToString();
            _nutricaoE.NutricaoOral = nutricao.NutricaoOral;
            _nutricaoE.Disfagia = nutricao.Disfagia;
            _nutricaoE.DificuldadeMastigar = nutricao.DificuldadeMastigar;
            _nutricaoE.SangramentoGengival = nutricao.SangramentoGengival;
            _nutricaoE.AusenciaDentes = nutricao.AusenciaDentes;
            _nutricaoE.Nausea = nutricao.Nausea;
            _nutricaoE.Emese = nutricao.Emese;
            _nutricaoE.Pirose = nutricao.Pirose;
            _nutricaoE.IngestaHidrica = nutricao.IngestaHidrica;
            _nutricaoE.IngestaHidricaValor = (decimal)nutricao.IngestaHidricaValor;
            _nutricaoE.RestricaoHidrica = nutricao.RestricaoHidrica;
            _nutricaoE.RestricaoHidricaValor = (decimal)nutricao.RestricaoHidricaValor;
            _nutricaoE.SemRestricao = nutricao.SemRestricao;
            _nutricaoE.RestricaoAlimentar = nutricao.RestricaoAlimentar;
            _nutricaoE.RestricaoAlimentarTexto = nutricao.RestricaoAlimentarTexto;
            _nutricaoE.HabitosAlimentares = nutricao.HabitosAlimentares;
            _nutricaoE.DispositivosAlimentacao = nutricao.DispositivosAlimentacao.ToString();
            _nutricaoE.Instalada = (DateTime)nutricao.Instalada;
        }
    }
}