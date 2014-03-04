using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorExperienciaMedicamentos
    {
        private static GerenciadorExperienciaMedicamentos gExpMedicamentos;

        private GerenciadorExperienciaMedicamentos() { }

        public static GerenciadorExperienciaMedicamentos GetInstance()
        {
            if (gExpMedicamentos == null)
            {
                gExpMedicamentos = new GerenciadorExperienciaMedicamentos();
            }
            return gExpMedicamentos;
        }

        public void CorrigirRespostas(ExperienciaMedicamentosModel experienciaMedicamentos, ExperienciaMedicamentosModel epGabarito, ModelStateDictionary modelState)
        {
            if (experienciaMedicamentos.IdRespostaEsperaTratamento != epGabarito.IdRespostaEsperaTratamento)
            {
                modelState.AddModelError("IdRespostaEsperaTratamento", "Gabarito: \"" + GerenciadorResposta.GetInstance().Obter(epGabarito.IdRespostaEsperaTratamento).Resposta + "\"");
            }
            if (experienciaMedicamentos.IdRespostaPreocupacoes != epGabarito.IdRespostaPreocupacoes)
            {
                modelState.AddModelError("IdRespostaPreocupacoes", "Gabarito: \"" + GerenciadorResposta.GetInstance().Obter(epGabarito.IdRespostaPreocupacoes).Resposta + "\"");
            }
            if (experienciaMedicamentos.IdRespostaGrauEntendimento != epGabarito.IdRespostaGrauEntendimento)
            {
                modelState.AddModelError("IdRespostaGrauEntendimento", "Gabarito: \"" + GerenciadorResposta.GetInstance().Obter(epGabarito.IdRespostaGrauEntendimento).Resposta + "\"");
            }
            if (experienciaMedicamentos.IdRespostaCultural != epGabarito.IdRespostaCultural)
            {
                modelState.AddModelError("IdRespostaCultural", "Gabarito: \"" + GerenciadorResposta.GetInstance().Obter(epGabarito.IdRespostaCultural).Resposta + "\"");
            }
            if (experienciaMedicamentos.IdRespostaComportamento != epGabarito.IdRespostaComportamento)
            {
                modelState.AddModelError("IdRespostaComportamento", "Gabarito: \"" + GerenciadorResposta.GetInstance().Obter(epGabarito.IdRespostaComportamento).Resposta + "\"");
            }
            if (experienciaMedicamentos.IdRespostaIncorporadoPlano != epGabarito.IdRespostaIncorporadoPlano)
            {
                modelState.AddModelError("IdRespostaIncorporadoPlano", "Gabarito: \"" + GerenciadorResposta.GetInstance().Obter(epGabarito.IdRespostaIncorporadoPlano).Resposta + "\"");
            }
            if (experienciaMedicamentos.AtencaoPreocupacoes != epGabarito.AtencaoPreocupacoes)
            {
                modelState.AddModelError("AtencaoPreocupacoes", "Gabarito: \"" + (epGabarito.AtencaoPreocupacoes == true ? "Sim" : "Não") + "\"");
            }
            if (experienciaMedicamentos.AtencaoComportamento != epGabarito.AtencaoComportamento)
            {
                modelState.AddModelError("AtencaoComportamento", "Gabarito: \"" + (epGabarito.AtencaoComportamento == true ? "Sim" : "Não") + "\"");
            }
            if (experienciaMedicamentos.AtencaoCultural != epGabarito.AtencaoCultural)
            {
                modelState.AddModelError("AtencaoCultural", "Gabarito: \"" + (epGabarito.AtencaoCultural == true ? "Sim" : "Não") + "\"");
            }
            if (experienciaMedicamentos.AtencaoEsperaTratamento != epGabarito.AtencaoEsperaTratamento)
            {
                modelState.AddModelError("AtencaoEsperaTratamento", "Gabarito: \"" + (epGabarito.AtencaoEsperaTratamento == true ? "Sim" : "Não") + "\"");
            }
            if (experienciaMedicamentos.AtencaoGrauEntendimento != epGabarito.AtencaoGrauEntendimento)
            {
                modelState.AddModelError("AtencaoGrauEntendimento", "Gabarito: \"" + (epGabarito.AtencaoGrauEntendimento == true ? "Sim" : "Não") + "\"");
            }
        }

        /// <summary>
        /// Insere dados do expMedicamentos
        /// </summary>
        /// <param name="expMedicamentos"></param>
        /// <returns></returns>
        public long Inserir(ExperienciaMedicamentosModel expMedicamentos)
        {
            var repCurso = new RepositorioGenerico<tb_experiencia_medicamentos>();
            tb_experiencia_medicamentos _expMedicamentosE = new tb_experiencia_medicamentos();
            try
            {
                Atribuir(expMedicamentos, _expMedicamentosE);

                repCurso.Inserir(_expMedicamentosE);
                repCurso.SaveChanges();

                return _expMedicamentosE.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("ExperienciaMedicamentos", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do expMedicamentos
        /// </summary>
        /// <param name="expMedicamentos"></param>
        public void Atualizar(ExperienciaMedicamentosModel expMedicamentos)
        {
            try
            {
                var repCurso = new RepositorioGenerico<tb_experiencia_medicamentos>();
                tb_experiencia_medicamentos _expMedicamentosE = repCurso.ObterEntidade(c => c.IdConsultaFixo == expMedicamentos.IdConsultaFixo);
                Atribuir(expMedicamentos, _expMedicamentosE);

                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExperienciaMedicamentos", e.Message, e);
            }
        }

        /// <summary>
        /// Remove dados do expMedicamentos
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaFixo)
        {
            try
            {
                var repCurso = new RepositorioGenerico<tb_experiencia_medicamentos>();
                repCurso.Remover(c => c.IdConsultaFixo == idConsultaFixo);
                repCurso.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("ExperienciaMedicamentos", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<ExperienciaMedicamentosModel> GetQuery()
        {
            var repCurso = new RepositorioGenerico<tb_experiencia_medicamentos>();
            var pvEntities = (pvEntities)repCurso.ObterContexto();
            var query = from expMedicamentos in pvEntities.tb_experiencia_medicamentos
                        select new ExperienciaMedicamentosModel
                        {
                            IdConsultaFixo = (int) expMedicamentos.IdConsultaFixo,
                            IdRespostaEsperaTratamento = expMedicamentos.IdRespostaEsperaTratamento,
                            IdRespostaPreocupacoes = expMedicamentos.IdRespostaPreocupacoes,
                            IdRespostaGrauEntendimento = expMedicamentos.IdRespostaGrauEntendimento,
                            IdRespostaCultural = expMedicamentos.IdRespostaCultural,
                            IdRespostaComportamento = expMedicamentos.IdRespostaComportamento,
                            IdRespostaIncorporadoPlano = expMedicamentos.IdRespostaIncorporadoPlano,
                            
                            AtencaoEsperaTratamento = expMedicamentos.AtencaoEsperaTratamento,
                            AtencaoPreocupacoes = expMedicamentos.AtencaoPreocupacoes,
                            AtencaoGrauEntendimento = expMedicamentos.AtencaoGrauEntendimento,
                            AtencaoCultural = expMedicamentos.AtencaoCultural,
                            AtencaoComportamento = expMedicamentos.AtencaoComportamento
                        };

            return query;
        }

        /// <summary>
        /// Obtém todos os expMedicamentos cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ExperienciaMedicamentosModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém expMedicamentos com o código especificiado
        /// </summary>
        /// <param name="codDisciplina"></param>
        /// <returns></returns>
        public ExperienciaMedicamentosModel Obter(long idConsultaFixo)
        {
            return GetQuery().Where(expMedicamentos => expMedicamentos.IdConsultaFixo == idConsultaFixo).ToList().ElementAtOrDefault(0);
        }
        
        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="expMedicamentos"></param>
        /// <param name="_expMedicamentosE"></param>
        private static void Atribuir(ExperienciaMedicamentosModel expMedicamentos, tb_experiencia_medicamentos _expMedicamentosE)
        {
            _expMedicamentosE.IdConsultaFixo = expMedicamentos.IdConsultaFixo;
            _expMedicamentosE.IdRespostaEsperaTratamento = expMedicamentos.IdRespostaEsperaTratamento;
            _expMedicamentosE.IdRespostaPreocupacoes = expMedicamentos.IdRespostaPreocupacoes;
            _expMedicamentosE.IdRespostaGrauEntendimento = expMedicamentos.IdRespostaGrauEntendimento;
            _expMedicamentosE.IdRespostaCultural = expMedicamentos.IdRespostaCultural;
            _expMedicamentosE.IdRespostaComportamento = expMedicamentos.IdRespostaComportamento;
            _expMedicamentosE.IdRespostaIncorporadoPlano = expMedicamentos.IdRespostaIncorporadoPlano;
            _expMedicamentosE.AtencaoEsperaTratamento = expMedicamentos.AtencaoEsperaTratamento;
            _expMedicamentosE.AtencaoPreocupacoes = expMedicamentos.AtencaoPreocupacoes;
            _expMedicamentosE.AtencaoGrauEntendimento = expMedicamentos.AtencaoGrauEntendimento;
            _expMedicamentosE.AtencaoCultural = expMedicamentos.AtencaoCultural;
            _expMedicamentosE.AtencaoComportamento = expMedicamentos.AtencaoComportamento;

        }
    }
}