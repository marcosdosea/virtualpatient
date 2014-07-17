using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorExamesFisicos
    {
        private static GerenciadorExamesFisicos gExamesFisicos;
        private GerenciadorExamesFisicos() { }

        public static GerenciadorExamesFisicos GetInstance()
        {
            if (gExamesFisicos == null)
            {
                gExamesFisicos = new GerenciadorExamesFisicos();
            }
            return gExamesFisicos;
        }

        /// <summary>
        /// Faz correção das Alergias da consulta de acordo com o gabarito
        /// </summary>
        /// <param name="listaAlergia"></param>
        /// <param name="listaAlergiaGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostasAlergias(IEnumerable<AlergiaModel> listaAlergia, IEnumerable<AlergiaModel> listaAlergiaGabarito, ModelStateDictionary modelState)
        {
            string erroNaoContemNoGabarito = "";
            string erroContemGabaritoNaoContemResposta = "";
            bool contem;
            foreach (var alergia in listaAlergia)
            {
                contem = false;
                foreach (var alergiaGabarito in listaAlergiaGabarito)
                {
                    if (alergia.IdAlergia == alergiaGabarito.IdAlergia)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroNaoContemNoGabarito = erroNaoContemNoGabarito + alergia.Alergia + ";<br>";
                }
            }
            foreach (var alergiaGabarito in listaAlergiaGabarito)
            {
                contem = false;
                foreach (var alergia in listaAlergia)
                {
                    if (alergia.IdAlergia == alergiaGabarito.IdAlergia)
                    {
                        contem = true;
                        break;
                    }
                }
                if (!contem)
                {
                    erroContemGabaritoNaoContemResposta = erroContemGabaritoNaoContemResposta + alergiaGabarito.Alergia + ";<br>";
                }
            }
            modelState.AddModelError("ErroAlergia", (erroNaoContemNoGabarito.Equals("") ? " " : "Alergias que não contém no Gabarito: " + erroNaoContemNoGabarito + "<br>") +
                (erroContemGabaritoNaoContemResposta.Equals("") ? " " : "Alergias que não foram adicionados: " + erroContemGabaritoNaoContemResposta));
        }

        /// <summary>
        /// Insere dados do ExamesFisicos
        /// </summary>
        /// <param name="ExamesFisicos"></param>
        /// <returns></returns>
        public long Inserir(ExamesFisicosModel examesFisicosModel)
        {
            var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
            tb_exames_fisicos _tb_exames_fisicos = new tb_exames_fisicos();
            try
            {
                Atribuir(examesFisicosModel, _tb_exames_fisicos);

                repExamesFisicos.Inserir(_tb_exames_fisicos);
                repExamesFisicos.SaveChanges();

                return _tb_exames_fisicos.IdConsultaVariavel;
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do ExamesFisicos
        /// </summary>
        /// <param name="ExamesFisicos"></param>
        public void Atualizar(ExamesFisicosModel examesFisicosModel)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == examesFisicosModel.IdConsultaVariavel);
                Atribuir(examesFisicosModel, _tb_exames_fisicos);

                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do ExamesFisicos
        /// </summary>
        /// <param name="idConsultaVariavel"></param>
        public void Remover(long idConsultaVariavel)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                repExamesFisicos.Remover(dP => dP.IdConsultaVariavel == idConsultaVariavel);
                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Insere uma alergia em um exame físico
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="alergiaModel"></param>
        public void InserirAlergia(ExamesFisicosModel examesFisicosModel, int idAlergia)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                var repAlergia = new RepositorioGenerico<tb_alergia>(repExamesFisicos.ObterContexto());
                
                tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == examesFisicosModel.IdConsultaVariavel);
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(al => al.IdAlergia == idAlergia);

                _tb_exames_fisicos.tb_alergia.Add(_tb_alergia);

                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Remove uma alergia em um exame físico
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="alergiaModel"></param>
        public void RemoverAlergia(ExamesFisicosModel examesFisicosModel, int idAlergia)
        {
            try
            {
                var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
                var repAlergia = new RepositorioGenerico<tb_alergia>(repExamesFisicos.ObterContexto());

                tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(dP => dP.IdConsultaVariavel == examesFisicosModel.IdConsultaVariavel);
                tb_alergia _tb_alergia = repAlergia.ObterEntidade(al => al.IdAlergia == idAlergia);

                _tb_exames_fisicos.tb_alergia.Remove(_tb_alergia);

                repExamesFisicos.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExamesFisicos", e.Message, e);
            }
        }

        /// <summary>
        /// Obtém todas as alergias relacionadas a consulta
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="alergiaModel"></param>
        public IEnumerable<AlergiaModel> ObterAlergias(long idConsultaVariavel)
        {
            var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
            tb_exames_fisicos _tb_exames_fisicos = repExamesFisicos.ObterEntidade(ef => ef.IdConsultaVariavel == idConsultaVariavel);
            var query = from alergias in _tb_exames_fisicos.tb_alergia
                        select new AlergiaModel
                        {
                            IdAlergia = alergias.IdAlergia,
                            Alergia = alergias.Alergia
                        };
            return query;
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ExamesFisicosModel> GetQuery()
        {
            var repExamesFisicos = new RepositorioGenerico<tb_exames_fisicos>();
            var pvEntities = (pvEntities)repExamesFisicos.ObterContexto();
            var query = from tb_exames_fisicos in pvEntities.tb_exames_fisicos
                        select new ExamesFisicosModel
                        {
                            IdConsultaVariavel = tb_exames_fisicos.IdConsultaVariavel,
                            Peso = (float) tb_exames_fisicos.Peso,
                            Altura = (float)tb_exames_fisicos.Altura,
                            PressaoDiastolica = (float)tb_exames_fisicos.PressaoDiastolica,
                            PressaoSistolica = (float)tb_exames_fisicos.PressaoSistolica,
                            Glicemia = (float)tb_exames_fisicos.Glicemia,
                            IndiceMassaCorporea = (float) tb_exames_fisicos.IndiceMassaCorporea,
                            CircunferenciaAbdominal = (float) tb_exames_fisicos.CircunferenciaAbdominal
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os ExamesFisicosModel cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ExamesFisicosModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém ExamesFisicosModel com o código da consulta variavel especificiado
        /// </summary>
        /// <returns></returns>
        public ExamesFisicosModel Obter(long idConsultaVariavel)
        {
            return GetQuery().Where(ExamesFisicosModel => ExamesFisicosModel.IdConsultaVariavel == idConsultaVariavel).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Faz a correção do ExameFisico de uma consulta de acordo com o gabarito 
        /// </summary>
        /// <param name="examesFisicos"></param>
        /// <param name="examesFisicosGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(ExamesFisicosModel examesFisicos, ExamesFisicosModel examesFisicosGabarito, ModelStateDictionary modelState)
        {
            if (examesFisicos.Altura != examesFisicosGabarito.Altura)
            {
                modelState.AddModelError("Altura", "Gabarito: " + examesFisicosGabarito.Altura + ".");
            }
            if (examesFisicos.Peso != examesFisicosGabarito.Peso)
            {
                modelState.AddModelError("Peso", "Gabarito: " + examesFisicosGabarito.Peso + ".");
            }
            if (examesFisicos.PressaoDiastolica != examesFisicosGabarito.PressaoDiastolica)
            {
                modelState.AddModelError("PressaoDiastolica", "Gabarito: " + examesFisicosGabarito.PressaoDiastolica + ".");
            }
            if (examesFisicos.PressaoSistolica != examesFisicosGabarito.PressaoSistolica)
            {
                modelState.AddModelError("PressaoSistolica", "Gabarito: " + examesFisicosGabarito.PressaoSistolica + ".");
            }
            if (examesFisicos.Glicemia != examesFisicosGabarito.Glicemia)
            {
                modelState.AddModelError("Glicemia", "Gabarito: " + examesFisicosGabarito.Glicemia + ".");
            }
            if (examesFisicos.IndiceMassaCorporea != examesFisicosGabarito.IndiceMassaCorporea)
            {
                modelState.AddModelError("IndiceMassaCorporea", "Gabarito: " + examesFisicosGabarito.IndiceMassaCorporea + ".");
            }
            if (examesFisicos.CircunferenciaAbdominal != examesFisicosGabarito.CircunferenciaAbdominal)
            {
                modelState.AddModelError("CircunferenciaAbdominal", "Gabarito: " + examesFisicosGabarito.CircunferenciaAbdominal + ".");
            }
        }


        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="examesFisicosModel"></param>
        /// <param name="_tb_exames_fisicos"></param>
        private static void Atribuir(ExamesFisicosModel examesFisicosModel, tb_exames_fisicos _tb_exames_fisicos)
        {
            _tb_exames_fisicos.IdConsultaVariavel = examesFisicosModel.IdConsultaVariavel;
            _tb_exames_fisicos.Peso = examesFisicosModel.Peso;
            _tb_exames_fisicos.Altura = examesFisicosModel.Altura;
            _tb_exames_fisicos.PressaoDiastolica = examesFisicosModel.PressaoDiastolica;
            _tb_exames_fisicos.PressaoSistolica = examesFisicosModel.PressaoSistolica;
            _tb_exames_fisicos.Glicemia = examesFisicosModel.Glicemia;
            _tb_exames_fisicos.IndiceMassaCorporea = examesFisicosModel.IndiceMassaCorporea;
            _tb_exames_fisicos.CircunferenciaAbdominal = examesFisicosModel.CircunferenciaAbdominal;
        }
    }
}