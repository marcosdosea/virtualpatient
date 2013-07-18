using Dados;
using PacienteVirtual.Models.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models.Negocio
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

        /// <summary>
        /// Insere dados do expMedicamentos
        /// </summary>
        /// <param name="expMedicamentos"></param>
        /// <returns></returns>
        public long Inserir(ExperienciaMedicamentosModel expMedicamentos)
        {
            var repCurso = new RepositorioGenerico<ExperienciaMedicamentosE>();
            ExperienciaMedicamentosE _expMedicamentosE = new ExperienciaMedicamentosE();
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
                var repCurso = new RepositorioGenerico<ExperienciaMedicamentosE>();
                ExperienciaMedicamentosE _expMedicamentosE = repCurso.ObterEntidade(c => c.IdConsultaFixo == expMedicamentos.IdConsultaFixo);
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
                var repCurso = new RepositorioGenerico<ExperienciaMedicamentosE>();
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
            var repCurso = new RepositorioGenerico<ExperienciaMedicamentosE>();
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
        private static void Atribuir(ExperienciaMedicamentosModel expMedicamentos, ExperienciaMedicamentosE _expMedicamentosE)
        {

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