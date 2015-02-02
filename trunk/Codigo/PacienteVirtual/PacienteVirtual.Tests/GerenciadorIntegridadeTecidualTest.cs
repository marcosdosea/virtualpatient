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
    /// Summary description for GerenciadorIntegridadeTecidualTest
    /// </summary>
    [TestClass]
    public class GerenciadorIntegridadeTecidualTest
    {
        [TestMethod()]
        public void PV30_AtualizarNecessidadesPsicobiologicasIntegridadeTecidualValida()
        {
            long idConsultaVariavel = 100;
            GerenciadorIntegridadeTecidual gerenciadorIntegridadeTecidual = GerenciadorIntegridadeTecidual.GetInstance();
            IntegridadeTecidualModel integridadeTecidual = gerenciadorIntegridadeTecidual.Obter(idConsultaVariavel);
            Assert.IsNotNull(integridadeTecidual);
            integridadeTecidual.Descamacao = true;
            integridadeTecidual.Descorada = false;
            integridadeTecidual.Equimose = true;
            integridadeTecidual.Eritema = true;
            integridadeTecidual.Escoriacao = false;
            integridadeTecidual.EstadoHidratacao = ListaEstadoHidratacao.Hidratada;
            integridadeTecidual.FeridaCirurgica = true;
            integridadeTecidual.FeridaCirurgicaLocal = "Barriga";
            integridadeTecidual.Hematoma = false;
            integridadeTecidual.Hiperemia = false;
            integridadeTecidual.LesaoAspecto = "Local muito roxo";
            integridadeTecidual.Letericia = true;
            integridadeTecidual.LocalAlteracaoPele = "Perna";
            integridadeTecidual.Nodulo = true;
            integridadeTecidual.Pediabetico = false;
            integridadeTecidual.PerdaSensibilidade = false;
            integridadeTecidual.Purido = false;
            integridadeTecidual.Queimadura = false;
            integridadeTecidual.QueimaduraGrau = "";
            integridadeTecidual.QueimaduraLocal = "";
            integridadeTecidual.Rubor = true;
            integridadeTecidual.Turgor = ListaTurgor.Diminuido;
            integridadeTecidual.UlceraPressao = true;
            integridadeTecidual.UlceraPressaoEstagio = "Avançado";
            integridadeTecidual.UlceraPressaoLocal = "Barriga";

            gerenciadorIntegridadeTecidual.Atualizar(integridadeTecidual);

            IntegridadeTecidualModel intTectAtualizada = gerenciadorIntegridadeTecidual.Obter(idConsultaVariavel);
            Assert.Equals(intTectAtualizada.Descamacao, true);
            Assert.Equals(intTectAtualizada.Descorada, false);
            Assert.Equals(intTectAtualizada.Equimose, true);
            Assert.Equals(intTectAtualizada.Eritema, true);
            Assert.Equals(intTectAtualizada.Escoriacao, false);
            Assert.Equals(intTectAtualizada.EstadoHidratacao, ListaEstadoHidratacao.Hidratada);
            Assert.Equals(intTectAtualizada.FeridaCirurgica, true);
            Assert.Equals(intTectAtualizada.FeridaCirurgicaLocal, "Barriga");
            Assert.Equals(intTectAtualizada.Hematoma, false);
            Assert.Equals(intTectAtualizada.Hiperemia, false);
            Assert.Equals(intTectAtualizada.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(intTectAtualizada.LesaoAspecto, "Local muito roxo");
            Assert.Equals(intTectAtualizada.Letericia, true);
            Assert.Equals(intTectAtualizada.LocalAlteracaoPele, "Perna");
            Assert.Equals(intTectAtualizada.Nodulo, true);
            Assert.Equals(intTectAtualizada.Pediabetico, false);
            Assert.Equals(intTectAtualizada.PerdaSensibilidade, false);
            Assert.Equals(intTectAtualizada.Purido, false);
            Assert.Equals(intTectAtualizada.Queimadura, false);
            Assert.Equals(intTectAtualizada.QueimaduraGrau, "");
            Assert.Equals(intTectAtualizada.QueimaduraLocal, "");
            Assert.Equals(intTectAtualizada.Rubor, true);
            Assert.Equals(intTectAtualizada.Turgor, ListaTurgor.Diminuido);
            Assert.Equals(intTectAtualizada.UlceraPressao, true);
            Assert.Equals(intTectAtualizada.UlceraPressaoEstagio, "Avançado");
            Assert.Equals(intTectAtualizada.UlceraPressaoLocal, "Barriga");
        }

        [TestMethod()]
        public void PV31_AtualizarNecessidadesPsicobiologicasIntegridadeTecidualInvalida()
        {
            long idConsultaVariavel = 100;
            GerenciadorIntegridadeTecidual gerenciadorIntegridadeTecidual = GerenciadorIntegridadeTecidual.GetInstance();
            IntegridadeTecidualModel integridadeTecidual = gerenciadorIntegridadeTecidual.Obter(idConsultaVariavel);
            Assert.IsNotNull(integridadeTecidual);
            integridadeTecidual.IdConsultaVariavel = -1;
            integridadeTecidual.Descamacao = true;
            integridadeTecidual.Equimose = true;
            integridadeTecidual.Eritema = true;
            integridadeTecidual.FeridaCirurgica = true;
            integridadeTecidual.Letericia = true;
            integridadeTecidual.LocalAlteracaoPele = "Perna";
            integridadeTecidual.Nodulo = true;
            integridadeTecidual.Pediabetico = false;
            integridadeTecidual.PerdaSensibilidade = false;
            integridadeTecidual.Purido = false;
            integridadeTecidual.UlceraPressao = true;
            integridadeTecidual.UlceraPressaoEstagio = "Avançado";
            integridadeTecidual.UlceraPressaoLocal = "Barriga";

            try
            {
                gerenciadorIntegridadeTecidual.Atualizar(integridadeTecidual);
            }
            catch (Exception e)
            {
                Assert.IsInstanceOfType(e, typeof(NegocioException));
            }
            
            IntegridadeTecidualModel intTectAtualizada = gerenciadorIntegridadeTecidual.Obter(idConsultaVariavel);
            Assert.Equals(intTectAtualizada.Descamacao, false);
            Assert.Equals(intTectAtualizada.Descorada, false);
            Assert.Equals(intTectAtualizada.Equimose, false);
            Assert.Equals(intTectAtualizada.Eritema, false);
            Assert.Equals(intTectAtualizada.Escoriacao, false);
            Assert.Equals(intTectAtualizada.EstadoHidratacao, ListaEstadoHidratacao.Hidratada);
            Assert.Equals(intTectAtualizada.FeridaCirurgica, false);
            Assert.Equals(intTectAtualizada.FeridaCirurgicaLocal, "");
            Assert.Equals(intTectAtualizada.Hematoma, false);
            Assert.Equals(intTectAtualizada.Hiperemia, false);
            Assert.Equals(intTectAtualizada.IdConsultaVariavel, idConsultaVariavel);
            Assert.Equals(intTectAtualizada.LesaoAspecto, "");
            Assert.Equals(intTectAtualizada.Letericia, false);
            Assert.Equals(intTectAtualizada.LocalAlteracaoPele, "");
            Assert.Equals(intTectAtualizada.Nodulo, false);
            Assert.Equals(intTectAtualizada.Pediabetico, false);
            Assert.Equals(intTectAtualizada.PerdaSensibilidade, false);
            Assert.Equals(intTectAtualizada.Purido, false);
            Assert.Equals(intTectAtualizada.Queimadura, false);
            Assert.Equals(intTectAtualizada.QueimaduraGrau, "");
            Assert.Equals(intTectAtualizada.QueimaduraLocal, "");
            Assert.Equals(intTectAtualizada.Rubor, false);
            Assert.Equals(intTectAtualizada.Turgor, ListaTurgor.Presente);
            Assert.Equals(intTectAtualizada.UlceraPressao, false);
            Assert.Equals(intTectAtualizada.UlceraPressaoEstagio, "");
            Assert.Equals(intTectAtualizada.UlceraPressaoLocal, "");
        }
    }
}
