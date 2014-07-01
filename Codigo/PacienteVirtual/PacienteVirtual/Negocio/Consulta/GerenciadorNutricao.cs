using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorNutricao
    {
        private static GerenciadorNutricao gNutricao;
        private GerenciadorNutricao() { }

        public static GerenciadorNutricao GetInstance()
        {
            if (gNutricao== null)
            {
                gNutricao = new GerenciadorNutricao();
            }
            return gNutricao;
        }

        /// <summary>
        /// Faz correção de Higiene de uma consulta de acordo com o gabarito
        /// </summary>
        /// <param name="higiene"></param>
        /// <param name="higieneGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(NutricaoModel nutricao, NutricaoModel nutricaoGabarito, ModelStateDictionary modelState)
        {
            if (nutricao.Peso != nutricaoGabarito.Peso)
            {
                modelState.AddModelError("Peso", "Gabarito: \"" + nutricaoGabarito.Peso + "\"");
            }
            if (nutricao.Altura != nutricaoGabarito.Altura)
            {
                modelState.AddModelError("Altura", "Gabarito: \"" + nutricaoGabarito.Altura + "\"");
            }
            if (nutricao.EstadoNutricional != nutricaoGabarito.EstadoNutricional)
            {
                modelState.AddModelError("EstadoNutricional", "Gabarito: \"" + nutricaoGabarito.EstadoNutricional.ToString() + "\"");
            }
            if (nutricao.NutricaoOral != nutricaoGabarito.NutricaoOral)
            {
                modelState.AddModelError("NutricaoOral", "Gabarito: \"" + (nutricaoGabarito.NutricaoOral == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.Disfagia != nutricaoGabarito.Disfagia)
            {
                modelState.AddModelError("Disfagia", "Gabarito: \"" + (nutricaoGabarito.Disfagia == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.DificuldadeMastigar != nutricaoGabarito.DificuldadeMastigar)
            {
                modelState.AddModelError("DificuldadeMastigar", "Gabarito: \"" + (nutricaoGabarito.DificuldadeMastigar == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.SangramentoGengival != nutricaoGabarito.SangramentoGengival)
            {
                modelState.AddModelError("SangramentoGengival", "Gabarito: \"" + (nutricaoGabarito.SangramentoGengival == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.AusenciaDentes != nutricaoGabarito.AusenciaDentes)
            {
                modelState.AddModelError("AusenciaDentes", "Gabarito: \"" + (nutricaoGabarito.AusenciaDentes == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.Nausea != nutricaoGabarito.Nausea)
            {
                modelState.AddModelError("Nausea", "Gabarito: \"" + (nutricaoGabarito.Nausea == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.Emese != nutricaoGabarito.Emese)
            {
                modelState.AddModelError("Emese", "Gabarito: \"" + (nutricaoGabarito.Emese == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.Pirose != nutricaoGabarito.Pirose)
            {
                modelState.AddModelError("Pirose", "Gabarito: \"" + (nutricaoGabarito.Pirose == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.IngestaHidrica != nutricaoGabarito.IngestaHidrica)
            {
                modelState.AddModelError("IngestaHidrica", "Gabarito: \"" + (nutricaoGabarito.IngestaHidrica == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.IngestaHidricaValor != nutricaoGabarito.IngestaHidricaValor)
            {
                modelState.AddModelError("IngestaHidricaValor", "Gabarito: \"" + nutricaoGabarito.IngestaHidricaValor + "\"");
            }
            if (nutricao.RestricaoHidrica != nutricaoGabarito.RestricaoHidrica)
            {
                modelState.AddModelError("RestricaoHidrica", "Gabarito: \"" + (nutricaoGabarito.RestricaoHidrica == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.RestricaoHidricaValor != nutricaoGabarito.RestricaoHidricaValor)
            {
                modelState.AddModelError("RestricaoHidricaValor", "Gabarito: \"" + nutricaoGabarito.RestricaoHidricaValor + "\"");
            }
            if (nutricao.SemRestricao != nutricaoGabarito.SemRestricao)
            {
                modelState.AddModelError("SemRestricao", "Gabarito: \"" + (nutricaoGabarito.SemRestricao == true ? "Sim" : "Não") + "\"");
            }
            if (nutricao.RestricaoAlimentar != nutricaoGabarito.RestricaoAlimentar)
            {
                modelState.AddModelError("RestricaoAlimentar", "Gabarito: \"" + (nutricaoGabarito.RestricaoAlimentar == true ? "Sim" : "Não") + "\"");
            }
            Global.CorrecaoDeStrings("RestricaoAlimentarTexto", nutricao.RestricaoAlimentarTexto, nutricaoGabarito.RestricaoAlimentarTexto, modelState);
            Global.CorrecaoDeStrings("HabitosAlimentares", nutricao.HabitosAlimentares, nutricaoGabarito.HabitosAlimentares, modelState);
            if (nutricao.DispositivosAlimentacao != nutricaoGabarito.DispositivosAlimentacao)
            {
                modelState.AddModelError("DispositivosAlimentacao", "Gabarito: \"" + nutricaoGabarito.DispositivosAlimentacao.ToString() + "\"");
            }
            if (nutricao.Instalada != nutricaoGabarito.Instalada)
            {
                modelState.AddModelError("Instalada", "Gabarito: \"" + nutricaoGabarito.Instalada + "\"");
            }
        }

        /// <summary>
        /// Insere dados do Higiene
        /// </summary>
        /// <param name="Higiene"></param>
        /// <returns></returns>
        public long Inserir(NutricaoModel nutricaoModel)
        {
            var repNutricao = new RepositorioGenerico<tb_nutricao>();
            tb_nutricao _tb_nutricao = new tb_nutricao();
            try
            {
                Atribuir(nutricaoModel, _tb_nutricao);

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
        /// Atualiza dados do Higiene
        /// </summary>
        /// <param name="Higiene"></param>
        public void Atualizar(NutricaoModel nutricaoModel)
        {
            try
            {
                var repNutricao = new RepositorioGenerico<tb_nutricao>();
                tb_nutricao _tb_nutricao = repNutricao.ObterEntidade(n => n.IdConsultaVariavel == nutricaoModel.IdConsultaVariavel);
                Atribuir(nutricaoModel, _tb_nutricao);

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
                repNutricao.Remover(n => n.IdConsultaVariavel == idConsultaVariavel);
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
            var query = from tb_nutricao in pvEntities.tb_nutricao
                        select new NutricaoModel
                        {
                            IdConsultaVariavel = tb_nutricao.IdConsultaVariavel,
                            Peso = (float)tb_nutricao.Peso,
                            Altura = (float)tb_nutricao.Altura,
                            EstadoNutricional = (tb_nutricao.EstadoNutricional == "AumentoPeso" ? ListaEstadoNutricional.AumentoPeso : (tb_nutricao.EstadoNutricional == "Caquexia" ? ListaEstadoNutricional.Caquexia : (tb_nutricao.EstadoNutricional == "PerdaPeso" ? ListaEstadoNutricional.PerdaPeso : (tb_nutricao.EstadoNutricional == "PesoNormal" ? ListaEstadoNutricional.PesoNormal : ListaEstadoNutricional.Sobrepeso)))),
                            NutricaoOral = tb_nutricao.NutricaoOral,
                            Disfagia = tb_nutricao.Disfagia,
                            DificuldadeMastigar = tb_nutricao.DificuldadeMastigar,
                            SangramentoGengival = tb_nutricao.SangramentoGengival,
                            AusenciaDentes = tb_nutricao.AusenciaDentes,
                            Nausea = tb_nutricao.Nausea,
                            Emese = tb_nutricao.Emese,
                            Pirose = tb_nutricao.Pirose,
                            IngestaHidrica = tb_nutricao.IngestaHidrica,
                            IngestaHidricaValor = (float)tb_nutricao.IngestaHidricaValor,
                            RestricaoHidrica = tb_nutricao.RestricaoHidrica,
                            RestricaoHidricaValor = (float)tb_nutricao.RestricaoHidricaValor,
                            SemRestricao = tb_nutricao.SemRestricao,
                            RestricaoAlimentar = tb_nutricao.RestricaoAlimentar,
                            RestricaoAlimentarTexto = tb_nutricao.RestricaoAlimentarTexto,
                            HabitosAlimentares = tb_nutricao.HabitosAlimentares,
                            DispositivosAlimentacao = (tb_nutricao.DispositivosAlimentacao == "NaoSeAplica" ? ListaDispositivosAlimentacao.NaoSeAplica : (tb_nutricao.DispositivosAlimentacao == "Gastrosnomia" ? ListaDispositivosAlimentacao.Gastronomia : (tb_nutricao.DispositivosAlimentacao == "Jejunostomia" ? ListaDispositivosAlimentacao.Jejunostomia : (tb_nutricao.DispositivosAlimentacao == "NPT" ? ListaDispositivosAlimentacao.NPT : (tb_nutricao.DispositivosAlimentacao == "SNE" ? ListaDispositivosAlimentacao.SNE : ListaDispositivosAlimentacao.SNG))))),
                            Instalada = (DateTime)tb_nutricao.Instalada
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os HigieneModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<NutricaoModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém HigieneModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public NutricaoModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(nutricao => nutricao.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }



        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="nutricaoModel"></param>
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