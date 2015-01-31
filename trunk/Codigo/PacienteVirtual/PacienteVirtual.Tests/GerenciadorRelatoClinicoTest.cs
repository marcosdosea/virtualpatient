using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Tests
{
    /// <summary>
    /// Summary description for GerenciadorRelatoClinicoTest
    /// </summary>
    [TestClass]
    public class GerenciadorRelatoClinicoTest
    {

        [TestMethod()]
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
    }
}
