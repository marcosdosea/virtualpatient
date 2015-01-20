using System;
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
    public class CasosDeTeste_19_01_2014
    {
        
        [TestMethod]
        public void PV9_AtivarMatriculaComSolicitacaoNaTurma()
        {
            int pessoa = 17;
            int turma = 1;
            int perfil = Global.Usuario;
            
            GerenciadorTurmaPessoa turmaPessoa = GerenciadorTurmaPessoa.GetInstance();
            TurmaPessoaModel solicitacao = turmaPessoa.ObterPorTurmaPessoa(turma, pessoa);
            Assert.IsNotNull(solicitacao);
            Assert.IsFalse(solicitacao.Ativa);
            Assert.Equals(solicitacao.IdRole, perfil);
            Assert.Equals(solicitacao.IdPessoa, pessoa);
            Assert.Equals(solicitacao.IdTurma, turma);

            solicitacao.Ativa = true;
            turmaPessoa.Atualizar(solicitacao);
            
            TurmaPessoaModel solicitacaoAtualizada = turmaPessoa.ObterPorTurmaPessoa(pessoa, turma);
            Assert.IsNotNull(solicitacaoAtualizada);
            Assert.IsTrue(solicitacaoAtualizada.Ativa);
        }

        public void PV10_AtivarTutorComSolicitacaoNaTurma()
        {
            int pessoa = 13;
            int turma = 1;
            int perfil = Global.Usuario;
            int perfilAtualizado = Global.Tutor;

            GerenciadorTurmaPessoa turmaPessoa = GerenciadorTurmaPessoa.GetInstance();
            TurmaPessoaModel solicitacao = turmaPessoa.ObterPorTurmaPessoa(turma, pessoa);
            Assert.IsNotNull(solicitacao);
            Assert.Equals(solicitacao.IdRole, perfil);
            Assert.Equals(solicitacao.IdPessoa, pessoa);
            Assert.Equals(solicitacao.IdTurma, turma);

            solicitacao.Ativa = true;
            solicitacao.IdRole = perfilAtualizado;
            turmaPessoa.Atualizar(solicitacao);

            TurmaPessoaModel solicitacaoAtualizada = turmaPessoa.ObterPorTurmaPessoa(turma, pessoa);
            Assert.IsNotNull(solicitacaoAtualizada);
            Assert.IsTrue(solicitacaoAtualizada.Ativa);
            Assert.Equals(solicitacaoAtualizada.IdRole, perfilAtualizado);
        }

        public void PV11_AtribuirRelatoClinicoParaAlunoDaTurma()
        {
            int pessoa = 10;
            int turma = 6;
            long consultaFixa = 0;
            int relato = 66;
            ConsultaFixoModel cfm = new ConsultaFixoModel();
            consultaFixa = GerenciadorConsultaFixo.GetInstance().Inserir(cfm);
            Assert.IsTrue(consultaFixa >= 0);

            TurmaPessoaRelatoModel tprm = new TurmaPessoaRelatoModel();
            tprm.IdConsultaFixo = consultaFixa;
            tprm.IdPessoa = pessoa;
            tprm.IdTurma = turma;
            tprm.IdRelato = relato;
            GerenciadorTurmaPessoaRelato.GetInstance().Inserir(tprm);
            TurmaPessoaRelatoModel tprmArmazenada = GerenciadorTurmaPessoaRelato.GetInstance().Obter(pessoa, turma, relato, consultaFixa);
            Assert.IsNotNull(tprmArmazenada);

            ConsultaVariavelModel cvm = new ConsultaVariavelModel();
            cvm.IdConsultaFixo = consultaFixa;
            cvm.IdEstadoConsulta = Global.AguardandoPreenchimento;
            cvm.IdPessoa = pessoa;
            cvm.IdTurma = turma;
            cvm.IdRelato = relato;
            cvm.IdRazaoEncontro = Global.IdRazaoEncontro;
            long idConsultaVariavel = GerenciadorConsultaVariavel.GetInstance().Inserir(cvm);
            Assert.IsTrue(idConsultaVariavel >= 0);

        }

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
