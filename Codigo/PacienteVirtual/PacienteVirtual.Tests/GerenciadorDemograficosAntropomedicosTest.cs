﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PacienteVirtual.Negocio;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    /// <summary>
    /// Summary description for CasosDeTeste_19_01_2014
    /// </summary>
    [TestClass]
    public class GerenciadorDemograficosAntropomedicosTest
    {
        
        [TestMethod()]
        public void PV12_AtualizarDadosIdentificacaoValido()
        {
            long idConsultaFixo = 48;
            GerenciadorDemograficosAntropometricos demograficosAntropomedicos = GerenciadorDemograficosAntropometricos.GetInstance();
            DemograficosAntropometricosModel dadosIndetificacao = demograficosAntropomedicos.Obter(idConsultaFixo);
            Assert.IsNotNull(dadosIndetificacao);
            dadosIndetificacao.Nome = "Maria M. M.";
            dadosIndetificacao.Genero = "F";
            dadosIndetificacao.MedicosAtendem = "Dra M. e Dr. P";
            dadosIndetificacao.MoradiaFamilia = "Sozinha";
            dadosIndetificacao.OndeAdquireMedicamentos = "Farmácia";
            dadosIndetificacao.IdEscolaridade = 4;
            dadosIndetificacao.IdOcupacao = 19;
            dadosIndetificacao.IdPlanoSaude = 6;
            dadosIndetificacao.IdEstadoCivil = 1;
            dadosIndetificacao.IdReligiao = 4;
            dadosIndetificacao.RG = "-";
            dadosIndetificacao.Procedencia = "-";
            dadosIndetificacao.Endereco = "-";

            demograficosAntropomedicos.Atualizar(dadosIndetificacao);

            DemograficosAntropometricosModel dadosIndetificacaoAtualizado = demograficosAntropomedicos.Obter(idConsultaFixo);
            Assert.IsNotNull(dadosIndetificacaoAtualizado);
            Assert.Equals(dadosIndetificacaoAtualizado.Nome, "Maria M. M.");
            Assert.Equals(dadosIndetificacaoAtualizado.Genero, "F");
            Assert.Equals(dadosIndetificacaoAtualizado.MedicosAtendem, "Dra M. e Dr. P");
            Assert.Equals(dadosIndetificacaoAtualizado.MoradiaFamilia, "Sozinha");
            Assert.Equals(dadosIndetificacaoAtualizado.OndeAdquireMedicamentos, "Farmácia");
            Assert.Equals(dadosIndetificacaoAtualizado.IdEscolaridade, 4);
            Assert.Equals(dadosIndetificacaoAtualizado.IdOcupacao, 19);
            Assert.Equals(dadosIndetificacaoAtualizado.IdPlanoSaude, 6);
            Assert.Equals(dadosIndetificacaoAtualizado.IdEstadoCivil, 1);
            Assert.Equals(dadosIndetificacaoAtualizado.IdReligiao, 4);
            Assert.Equals(dadosIndetificacaoAtualizado.RG, "-");
            Assert.Equals(dadosIndetificacaoAtualizado.Procedencia, "-");
            Assert.Equals(dadosIndetificacaoAtualizado.Endereco, "-");
            Assert.Equals(dadosIndetificacaoAtualizado.IdNaturalidade, 1);
        }

        [TestMethod()]
        public void PV13_AtualizarDadosIdentificacaoInvalido()
        {
            long idConsultaFixo = 48;
            GerenciadorDemograficosAntropometricos demograficosAntropomedicos = GerenciadorDemograficosAntropometricos.GetInstance();
            DemograficosAntropometricosModel dadosIndetificacao = demograficosAntropomedicos.Obter(idConsultaFixo);
            Assert.IsNotNull(dadosIndetificacao);
            dadosIndetificacao.Nome = null;
            dadosIndetificacao.IdOcupacao = -1;

            try
            {
                demograficosAntropomedicos.Atualizar(dadosIndetificacao);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }
            
            DemograficosAntropometricosModel dadosIndetificacaoAtualizado = demograficosAntropomedicos.Obter(idConsultaFixo);
            Assert.IsNotNull(dadosIndetificacaoAtualizado);
            Assert.Equals(dadosIndetificacaoAtualizado.Nome, "G.C.M");
            Assert.Equals(dadosIndetificacaoAtualizado.Genero, "M");
            Assert.IsNull(dadosIndetificacaoAtualizado.MedicosAtendem);
            Assert.IsNull(dadosIndetificacaoAtualizado.MoradiaFamilia);
            Assert.IsNull(dadosIndetificacaoAtualizado.OndeAdquireMedicamentos);
            Assert.Equals(dadosIndetificacaoAtualizado.IdEscolaridade, 8);
            Assert.Equals(dadosIndetificacaoAtualizado.IdOcupacao, 3);
            Assert.Equals(dadosIndetificacaoAtualizado.IdPlanoSaude, 5);
            Assert.Equals(dadosIndetificacaoAtualizado.IdEstadoCivil, 3);
            Assert.Equals(dadosIndetificacaoAtualizado.IdReligiao, 2);
            Assert.IsNull(dadosIndetificacaoAtualizado.RG);
            Assert.IsNull(dadosIndetificacaoAtualizado.Procedencia);
            Assert.IsNull(dadosIndetificacaoAtualizado.Endereco);
            Assert.Equals(dadosIndetificacaoAtualizado.IdNaturalidade, 1);
        }
    }
}
