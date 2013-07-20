﻿using Dados;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models.Data;

namespace PacienteVirtual.Models.Negocio
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
            var repDemoAntrop = new RepositorioGenerico<DemograficosAntropometricosE>();
            DemograficosAntropometricosE _demoAntropE = new DemograficosAntropometricosE();
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
                var repDemoAntrop = new RepositorioGenerico<DemograficosAntropometricosE>();
                DemograficosAntropometricosE _demoAntropE = repDemoAntrop.ObterEntidade(da => da.IdConsultaFixo == demoAntrop.IdConsultaFixo);
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
                DemograficosAntropometricosE _demoAntropE = new DemograficosAntropometricosE();
                var repDemoAntrop = new RepositorioGenerico<DemograficosAntropometricosE>();

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
        /// Remove dados do demoAntrop
        /// </summary>
        /// <param name="codDisciplina"></param>
        public void Remover(long idConsultaFixo)
        {
            try
            {
                var repDemoAntrop = new RepositorioGenerico<DemograficosAntropometricosE>();
                repDemoAntrop.Remover(da => da.IdConsultaFixo == idConsultaFixo);
                repDemoAntrop.SaveChanges();

                              
            }
            catch (Exception e)
            {
                throw new DadosException("DemograficosAntropometricos", e.Message, e);
            }
        }

        /// <summary>
        /// Consulta para retornar dados da entidade
        /// </summary>
        /// <returns></returns>
        private IQueryable<DemograficosAntropometricosModel> GetQuery()
        {
            var repDemoAntrop = new RepositorioGenerico<DemograficosAntropometricosE>();
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

                            IdEscolaridade = demoAntrop.IdEscolaridade,
                            IdOcupacao = demoAntrop.IdOcupacao,
                            IdPlanoSaude = demoAntrop.IdPlanoSaude
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
        /// Obtém demoAntrop com o código especificiado
        /// </summary>
        /// <returns></returns>
        public DemograficosAntropometricosModel Obter(long idConsultaFixo)
        {
            return GetQuery().Where(demoAntrop => demoAntrop.IdConsultaFixo == idConsultaFixo).ToList().ElementAtOrDefault(0);
        }

        /// <summary>
        /// Obtém disciplinas que iniciam com o nome
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
        private static void Atribuir(DemograficosAntropometricosModel demoAntrop, DemograficosAntropometricosE _demoAntropE)
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

        }

    }
}