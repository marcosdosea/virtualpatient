using System;
using System.Collections.Generic;
using System.Linq;
using PacienteVirtual.Models;
using Persistence;
using System.Web.Mvc;

namespace PacienteVirtual.Negocio
{
    public class GerenciadorDemograficosAntropometricos
    {
        private static GerenciadorDemograficosAntropometricos gDemoAntrop;

        private GerenciadorDemograficosAntropometricos() { }

        public static GerenciadorDemograficosAntropometricos GetInstance()
        {
            if (gDemoAntrop == null)
            {
                gDemoAntrop = new GerenciadorDemograficosAntropometricos();
            }
            return gDemoAntrop;
        }

        /// <summary>
        /// Insere dados do demoAntrop
        /// </summary>
        /// <param name="demoAntrop"></param>
        /// <returns></returns>
        public long Inserir(DemograficosAntropometricosModel demoAntrop)
        {
            var repDemoAntrop = new RepositorioGenerico<tb_demograficos_antropometricos>();
            tb_demograficos_antropometricos _demoAntropE = new tb_demograficos_antropometricos();
            try
            {
                Atribuir(demoAntrop, _demoAntropE);
                repDemoAntrop.Inserir(_demoAntropE);
                repDemoAntrop.SaveChanges();

                return _demoAntropE.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("DemograficosAntropometricos", e.Message, e);
            }
        }

        /// <summary>
        /// Atualiza dados do demoAntrop
        /// </summary>
        /// <param name="demoAntrop"></param>
        public void Atualizar(DemograficosAntropometricosModel demoAntrop)
        {
            try
            {
                var repDemoAntrop = new RepositorioGenerico<tb_demograficos_antropometricos>();
                tb_demograficos_antropometricos _demoAntropE = repDemoAntrop.ObterEntidade(da => da.IdConsultaFixo == demoAntrop.IdConsultaFixo);
                Atribuir(demoAntrop, _demoAntropE);

                repDemoAntrop.SaveChanges();
            }
            catch (Exception e)
            {
                throw new DadosException("DemograficosAntropometricos", e.Message, e);
            }
        }

        /// <summary>
        /// Insere ou altera dados do demoAntrop 
        /// </summary>
        /// <param name="demoAntrop"></param>
        /// <returns></returns>
        public long InserirAlterar(DemograficosAntropometricosModel demoAntrop)
        {
            try
            {
                tb_demograficos_antropometricos _demoAntropE = new tb_demograficos_antropometricos();
                var repDemoAntrop = new RepositorioGenerico<tb_demograficos_antropometricos>();

                if (demoAntrop.IdConsultaFixo == 0)//caso seja Inserção de novo registro
                {
                    Atribuir(demoAntrop, _demoAntropE);
                    repDemoAntrop.Inserir(_demoAntropE);
                }
                else //caso atualização
                {
                    _demoAntropE = repDemoAntrop.ObterEntidade(da => da.IdConsultaFixo == demoAntrop.IdConsultaFixo);
                    Atribuir(demoAntrop, _demoAntropE);
                }
                    repDemoAntrop.SaveChanges();

                return _demoAntropE.IdConsultaFixo;
            }
            catch (Exception e)
            {
                throw new DadosException("DemograficosAntropometricos", e.Message, e);
            }
        }

        /// <summary>
        /// Faz a validação para verificar se todos os id estão diferentes de 0
        /// </summary>
        public bool ValidarRespostasSelecionaveis(int parametro1, int parametro2, int parametro3, int parametro4, int parametro5, int parametro6)
        {
            if (parametro1 == 0 || parametro2 == 0 || parametro2 == 3 || parametro2 == 4 || parametro5 == 0 || parametro6 == 0)
            {
                throw new NegocioException("Atenção! Você esqueceu de selecionar uma ou mais campos.");
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Remove dados do demoAntrop
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaFixo)
        {
            try
            {
                var repDemoAntrop = new RepositorioGenerico<tb_demograficos_antropometricos>();
                repDemoAntrop.Remover(da => da.IdConsultaFixo == idConsultaFixo);
                repDemoAntrop.SaveChanges();

                              
            }
            catch (Exception e)
            {
                throw new DadosException("DemograficosAntropometricos", e.Message, e);
            }
        }

        /// <summary>
        /// Realiza a correção de acordo com as respostas do gabarito
        /// </summary>
        /// <param name="demoAntrop"></param>
        /// <param name="demoAntropGabarito"></param>
        /// <param name="modelState"></param>
        public void CorrigirRespostas(DemograficosAntropometricosModel demoAntrop, DemograficosAntropometricosModel demoAntropGabarito, ModelStateDictionary modelState)
        {
            Global.CorrecaoDeStrings("Nome", demoAntrop.Nome, demoAntropGabarito.Nome, modelState);
            Global.CorrecaoDeStrings("MedicosAtendem", demoAntrop.MedicosAtendem, demoAntropGabarito.MedicosAtendem, modelState);

            if (!demoAntrop.Genero.ToLower().Equals(demoAntropGabarito.Genero.ToLower()))
            {
                modelState.AddModelError("Genero", "Gabarito: \"" + demoAntropGabarito.Genero + "\"");
            }
            if (!demoAntrop.DataNascimento.Equals(demoAntropGabarito.DataNascimento))
            {
                modelState.AddModelError("DataNascimento", "Gabarito: \"" + demoAntropGabarito.DataNascimento.ToShortDateString() + "\"");
            }

            Global.CorrecaoDeStrings("MoradiaFamilia", demoAntrop.MoradiaFamilia, demoAntropGabarito.MoradiaFamilia, modelState);
            Global.CorrecaoDeStrings("OndeAdquireMedicamentos", demoAntrop.OndeAdquireMedicamentos, demoAntropGabarito.OndeAdquireMedicamentos, modelState);
            Global.CorrecaoDeStrings("RG", demoAntrop.RG, demoAntropGabarito.RG, modelState);
            Global.CorrecaoDeStrings("Procedencia", demoAntrop.Procedencia, demoAntropGabarito.Procedencia, modelState);
            Global.CorrecaoDeStrings("Endereco", demoAntrop.Endereco, demoAntropGabarito.Endereco, modelState);

            if (!demoAntrop.IdEscolaridade.Equals(demoAntropGabarito.IdEscolaridade))
            {
                modelState.AddModelError("IdEscolaridade", "Gabarito: \"" + demoAntropGabarito.EscolaridadeNivel + "\"");
            }               
            if (!demoAntrop.IdOcupacao.Equals(demoAntropGabarito.IdOcupacao))
            {
                modelState.AddModelError("IdOcupacao", "Gabarito: \"" + demoAntropGabarito.OcupacaoDescricao + "\"");
            }
            if (!demoAntrop.IdPlanoSaude.Equals(demoAntropGabarito.IdPlanoSaude))
            {
                modelState.AddModelError("IdPlanoSaude", "Gabarito: \"" + demoAntropGabarito.PlanoSaudeNome + "\"");
            }
            if (!demoAntrop.IdEstadoCivil.Equals(demoAntropGabarito.IdEstadoCivil))
            {
                modelState.AddModelError("IdEstadoCivil", "Gabarito: \"" + demoAntropGabarito.EstadoCivil + "\"");
            }
            if (!demoAntrop.IdNaturalidade.Equals(demoAntropGabarito.IdNaturalidade))
            {
                modelState.AddModelError("IdNaturalidade", "Gabarito: \"" + demoAntropGabarito.Naturalidade + "\"");
            }
            if (!demoAntrop.IdReligiao.Equals(demoAntropGabarito.IdReligiao))
            {
                modelState.AddModelError("IdReligiao", "Gabarito: \"" + demoAntropGabarito.Religiao + "\"");
            }
        }


        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DemograficosAntropometricosModel> GetQuery()
        {
            var repDemoAntrop = new RepositorioGenerico<tb_demograficos_antropometricos>();
            var pvEntities = (pvEntities)repDemoAntrop.ObterContexto();
            var query = from demoAntrop in pvEntities.tb_demograficos_antropometricos
                        select new DemograficosAntropometricosModel
                        {
                            IdConsultaFixo = demoAntrop.IdConsultaFixo,
                            Nome = demoAntrop.Nome,
                            Genero = demoAntrop.Genero,
                            DataNascimento = (DateTime)demoAntrop.DataNascimento,
                            MedicosAtendem = demoAntrop.MedicosAtendem,
                            MoradiaFamilia = demoAntrop.MoradiaFamilia,
                            OndeAdquireMedicamentos = demoAntrop.OndeAdquireMedicamentos,
                            RG = demoAntrop.RG,
                            Procedencia = demoAntrop.Procedencia,
                            Endereco = demoAntrop.Endereco,

                            IdEscolaridade = demoAntrop.IdEscolaridade,
                            IdOcupacao = demoAntrop.IdOcupacao,
                            IdPlanoSaude = demoAntrop.IdPlanoSaude,
                            IdEstadoCivil = demoAntrop.IdEstadoCivil,
                            IdNaturalidade = demoAntrop.IdNaturalidade,
                            IdReligiao = demoAntrop.IdReligiao,

                            EscolaridadeNivel = demoAntrop.tb_escolaridade.Nivel,
                            OcupacaoDescricao = demoAntrop.tb_ocupacao.Descricao,
                            PlanoSaudeNome = demoAntrop.tb_plano_saude.Nome,
                            EstadoCivil = demoAntrop.tb_estado_civil.Descricao,
                            Naturalidade = demoAntrop.tb_naturalidade.Descricao,
                            Religiao = demoAntrop.tb_religiao.Descricao
                        };
            return query;
        }

        /// <summary>
        /// Obtém todos os demoAntrop cadastrados
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DemograficosAntropometricosModel> ObterTodos()
        {
            return GetQuery().ToList();
        }

        /// <summary>
        /// Obtém demoAntrop com o código da consulta fixa especificado
        /// </summary>
        /// <param name="idConsultaFixo"></param>
        /// <returns></returns>
        public DemograficosAntropometricosModel Obter(long idConsultaFixo)
        {
            return GetQuery().Where(demoAntrop => demoAntrop.IdConsultaFixo == idConsultaFixo).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém dados demograficos antropomedicos que iniciam com o nome
        /// </summary>
        /// <param name="nome"></param>
        /// <returns></returns>
        public IEnumerable<DemograficosAntropometricosModel> ObterPorNome(string Nome)
        {
            return GetQuery().Where(demoAntrop => demoAntrop.Nome.StartsWith(Nome)).ToList();
        }

        /// <summary>
        /// Atribui dados da classe de modelo para classe entity de persistência
        /// </summary>
        /// <param name="demoAntrop"></param>
        /// <param name="_demoAntropE"></param>
        private static void Atribuir(DemograficosAntropometricosModel demoAntrop, tb_demograficos_antropometricos _demoAntropE)
        {
            _demoAntropE.IdConsultaFixo = demoAntrop.IdConsultaFixo;
            _demoAntropE.Nome = demoAntrop.Nome;
            _demoAntropE.Genero = demoAntrop.Genero;
            _demoAntropE.DataNascimento = demoAntrop.DataNascimento;
            _demoAntropE.MedicosAtendem = demoAntrop.MedicosAtendem;
            _demoAntropE.MoradiaFamilia = demoAntrop.MoradiaFamilia;
            _demoAntropE.OndeAdquireMedicamentos = demoAntrop.OndeAdquireMedicamentos;
            _demoAntropE.IdEscolaridade = demoAntrop.IdEscolaridade;
            _demoAntropE.IdOcupacao = demoAntrop.IdOcupacao;
            _demoAntropE.IdPlanoSaude = demoAntrop.IdPlanoSaude;

            _demoAntropE.IdEstadoCivil = demoAntrop.IdEstadoCivil;
            _demoAntropE.IdReligiao = demoAntrop.IdReligiao;
            _demoAntropE.IdNaturalidade = demoAntrop.IdNaturalidade;
            _demoAntropE.RG = demoAntrop.RG;
            _demoAntropE.Procedencia = demoAntrop.Procedencia;
            _demoAntropE.Endereco = demoAntrop.Endereco;
        }

    }
}