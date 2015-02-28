using PacienteVirtual.Negocio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using PacienteVirtual.Models;

namespace PacienteVirtual.Tests
{
    
    
    /// <summary>
    ///This is a test class for GerenciadorSexualidadeTest and is intended
    ///to contain all GerenciadorSexualidadeTest Unit Tests
    ///</summary>
    [TestClass()]
    public class GerenciadorSexualidadeTest
    {

        [TestMethod()]
        public void PV36AtualizarNecessidadesPsicobiologicasSexualidadeValida()
        {
            long idConsultaVariavel = 143;
            GerenciadorSexualidade gerenciadorSexualidade = GerenciadorSexualidade.GetInstance();
            SexualidadeModel sexualidade = gerenciadorSexualidade.Obter(idConsultaVariavel);
            Assert.IsNotNull(sexualidade);
            sexualidade.ParceiroFixo = ListaParceiroFixo.NaoRelatou;
            sexualidade.ConflitoPreferenciaSexual = ListaConflitoPreferenciaSexual.NaoRelatou;
            sexualidade.DorRelacaoSexual = ListaDorRelaxaoSexual.NaoRelatou;
            sexualidade.Secrecao = false;
            sexualidade.Prurido = false;
            sexualidade.Edema = false;
            sexualidade.OdorFetido = false;
            sexualidade.Sangramento = false;
            sexualidade.Lesao = false;
            sexualidade.Hiperemia = false;
            sexualidade.SemAlteracao = false;

            gerenciadorSexualidade.Atualizar(sexualidade);

            SexualidadeModel sexualidadeAtualizada = gerenciadorSexualidade.Obter(idConsultaVariavel);
            Assert.Equals(sexualidadeAtualizada.ParceiroFixo, ListaParceiroFixo.NaoRelatou);
            Assert.Equals(sexualidadeAtualizada.ConflitoPreferenciaSexual, ListaConflitoPreferenciaSexual.NaoRelatou);
            Assert.Equals(sexualidadeAtualizada.DorRelacaoSexual, ListaDorRelaxaoSexual.NaoRelatou);
            Assert.Equals(sexualidadeAtualizada.Secrecao, false);
            Assert.Equals(sexualidadeAtualizada.Prurido, false);
            Assert.Equals(sexualidadeAtualizada.Edema, false);
            Assert.Equals(sexualidadeAtualizada.OdorFetido, false);
            Assert.Equals(sexualidadeAtualizada.Sangramento, false);
            Assert.Equals(sexualidadeAtualizada.Lesao, false);
            Assert.Equals(sexualidadeAtualizada.Hiperemia, false);
            Assert.Equals(sexualidadeAtualizada.SemAlteracao, false);
        }


        [TestMethod()]
        public void PV37AtualizarNecessidadesPsicobiologicasSexualidadeInvalida()
        {
            long idConsultaVariavel = 143;
            GerenciadorSexualidade gerenciadorSexualidade = GerenciadorSexualidade.GetInstance();
            SexualidadeModel sexualidade = gerenciadorSexualidade.Obter(idConsultaVariavel);
            Assert.IsNotNull(sexualidade);
            sexualidade.ParceiroFixo = ListaParceiroFixo.NaoRelatou;
            sexualidade.ConflitoPreferenciaSexual = ListaConflitoPreferenciaSexual.NaoRelatou;
            sexualidade.DorRelacaoSexual = ListaDorRelaxaoSexual.NaoRelatou;
            sexualidade.Secrecao = false;
            sexualidade.Prurido = false;
            sexualidade.Edema = false;
            sexualidade.OdorFetido = false;
            sexualidade.Sangramento = false;
            sexualidade.Lesao = false;
            sexualidade.Hiperemia = false;
            sexualidade.SemAlteracao = false;

            gerenciadorSexualidade.Atualizar(sexualidade);

            SexualidadeModel higieneAtualizado = gerenciadorSexualidade.Obter(idConsultaVariavel);
            Assert.IsNotNull(sexualidade);
        }
    }
}
