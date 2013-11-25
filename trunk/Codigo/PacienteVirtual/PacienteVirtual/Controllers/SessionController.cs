using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers
{
    public class SessionController
    {

        public static int IdRelato
        {
            get
            {
                return (int)HttpContext.Current.Session["_IdRelato"];
            }
            set
            {
                HttpContext.Current.Session["_IdRelato"] = value;
            }
        }

        public static TurmaPessoaModel DadosTurmaPessoa
        {
            get
            {
                return (TurmaPessoaModel)HttpContext.Current.Session["_DadosTurmaPessoa"];
            }
            set
            {
                HttpContext.Current.Session["_DadosTurmaPessoa"] = value;
            }
        }


        public static ConsultaVariavelModel ConsultaVariavel
        {
            get
            {
                return (ConsultaVariavelModel)HttpContext.Current.Session["_ConsultaVariavel"];
            }
            set
            {
                HttpContext.Current.Session["_ConsultaVariavel"] = value;
            }
        }

        public static PessoaModel Pessoa
        {
            get
            {
                return (PessoaModel)HttpContext.Current.Session["_Pessoa"];
            }
            set
            {
                HttpContext.Current.Session["_Pessoa"] = value;
            }
        }

        public static PacienteModel Paciente
        {
            get
            {
                PacienteModel paciente = (PacienteModel)HttpContext.Current.Session["_Paciente"];
                if (paciente == null)
                {
                    paciente  = GerenciadorPaciente.GetInstance().Obter(ConsultaVariavel.IdPaciente);
                    HttpContext.Current.Session["_Paciente"] = paciente;
                }
                return paciente;
            }
            set
            {
                HttpContext.Current.Session["_Paciente"] = value;
            }
        }
        public static RelatoClinicoModel RelatoClinico
        {
            get
            {
                RelatoClinicoModel relatoClinico = (RelatoClinicoModel)HttpContext.Current.Session["_RelatoClinico"];
                if (relatoClinico == null)
                {
                    relatoClinico = GerenciadorRelatoClinico.GetInstance().Obter(ConsultaVariavel.IdRelato);
                    HttpContext.Current.Session["_RelatoClinico"] = relatoClinico;
                }
                return relatoClinico;
            }
            set
            {
                HttpContext.Current.Session["_RelatoClinico"] = value;
            }
        }

        public static ConsultaFixoModel ConsultaFixo
        {
            get
            {
                ConsultaFixoModel consultaFixo = (ConsultaFixoModel)HttpContext.Current.Session["_ConsultaFixo"];
                if (consultaFixo == null)
                {
                    consultaFixo = GerenciadorConsultaFixo.GetInstance().Obter(ConsultaVariavel.IdConsultaFixo);
                    HttpContext.Current.Session["_ConsultaFixo"] = consultaFixo;
                }
                return consultaFixo;
            }
            set
            {
                HttpContext.Current.Session["_RelatoClinico"] = value;
            }
        }


        // Dados fixos e compartilhados entre consultas

        public static HistoriaModel Historia
        {
            get
            {
                HistoriaModel historia = (HistoriaModel)HttpContext.Current.Session["_Historia"];
                if (historia == null)
                {
                    historia = GerenciadorHistoria.GetInstance().Obter(ConsultaVariavel.IdConsultaFixo);
                    if (historia == null)
                    {
                        historia = new HistoriaModel();
                        historia.HistoriaFamiliar = "";
                        historia.HistoriaMedicaPregressa = "";
                        historia.IdConsultaFixo = ConsultaVariavel.IdConsultaFixo;
                        GerenciadorHistoria.GetInstance().Inserir(historia);
                    }
                    HttpContext.Current.Session["_Historia"] = historia;
                }
                return historia;
            }
            set
            {
                HttpContext.Current.Session["_Historia"] = value;
            }
        }

        public static DemograficosAntropometricosModel DemograficosAntropometricos
        {
            get
            {
                DemograficosAntropometricosModel demoAntro = (DemograficosAntropometricosModel)HttpContext.Current.Session["_DemograficosAntropometricos"];
                if (demoAntro == null)
                {
                    demoAntro = GerenciadorDemograficosAntropometricos.GetInstance().Obter(ConsultaVariavel.IdConsultaFixo);
                    if (demoAntro == null)
                    {
                        demoAntro = new DemograficosAntropometricosModel();
                        demoAntro.IdConsultaFixo = ConsultaVariavel.IdConsultaFixo;
                        demoAntro.Genero = "A";
                        demoAntro.Nome = "";
                        demoAntro.MedicosAtendem = "";
                        demoAntro.MoradiaFamilia = "";
                        demoAntro.OndeAdquireMedicamentos = "";
                        demoAntro.IdEscolaridade = 1;
                        demoAntro.IdOcupacao = 1;
                        demoAntro.IdPlanoSaude = 1;
                        GerenciadorDemograficosAntropometricos.GetInstance().Inserir(demoAntro);
                    }
                    HttpContext.Current.Session["_DemograficosAntropometricos"] = demoAntro;
                }
                return demoAntro;
            }
            set
            {
                HttpContext.Current.Session["_DemograficosAntropometricos"] = value;
            }
        }

        public static ExperienciaMedicamentosModel ExperienciaMedicamentos
        {
            get
            {
                ExperienciaMedicamentosModel experiencia = (ExperienciaMedicamentosModel)HttpContext.Current.Session["_ExperienciaMedicamentos"];
                if (experiencia == null)
                {
                    experiencia = GerenciadorExperienciaMedicamentos.GetInstance().Obter(ConsultaVariavel.IdConsultaFixo);
                    if (experiencia == null)
                    {
                        experiencia = new ExperienciaMedicamentosModel();
                        experiencia.IdConsultaFixo = ConsultaVariavel.IdConsultaFixo;
                        experiencia.IdRespostaComportamento = 3;
                        experiencia.IdRespostaCultural = 3;
                        experiencia.IdRespostaEsperaTratamento = 3;
                        experiencia.IdRespostaGrauEntendimento = 3;
                        experiencia.IdRespostaIncorporadoPlano = 3;
                        experiencia.IdRespostaPreocupacoes = 3;
                        GerenciadorExperienciaMedicamentos.GetInstance().Inserir(experiencia);
                    }
                    HttpContext.Current.Session["_ExperienciaMedicamentos"] = experiencia;
                }
                return experiencia;
            }
            set
            {
                HttpContext.Current.Session["_ExperienciaMedicamentos"] = value;
            }
        }

        public static IEnumerable<DiarioPessoalModel> ListaDiarioPessoal
        {
            get
            {
                IEnumerable<DiarioPessoalModel> listaDiarioPessoal = (IEnumerable<DiarioPessoalModel>)HttpContext.Current.Session["_listaDiarioPessoal"];
                if (listaDiarioPessoal == null)
                {
                    listaDiarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(ConsultaVariavel.IdConsultaFixo);
                    HttpContext.Current.Session["_listaDiarioPessoal"] = listaDiarioPessoal;
                }
                return listaDiarioPessoal;
            }
            set
            {
                HttpContext.Current.Session["_listaDiarioPessoal"] = value;
            }
        }

        public static IEnumerable<AlergiaModel> ListaAlergia
        {
            get
            {
                IEnumerable<AlergiaModel> listaAlergia = (IEnumerable<AlergiaModel>)HttpContext.Current.Session["_ListaAlergia"];
                if (listaAlergia == null)
                {
                    listaAlergia = GerenciadorExamesFisicos.GetInstance().ObterAlergias(SessionController.ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_ListaAlergia"] = listaAlergia;
                }
                return listaAlergia;
            }
            set
            {
                HttpContext.Current.Session["_ListaAlergia"] = value;
            }
        }

        public static IEnumerable<BebidaModel> ListaBebidas
        {
            get
            {
                IEnumerable<BebidaModel> listaBebidas = (IEnumerable<BebidaModel>)HttpContext.Current.Session["_listaBebidas"];
                if (listaBebidas == null)
                {
                    listaBebidas = GerenciadorBebida.GetInstance().ObterTodos();
                    HttpContext.Current.Session["_listaBebidas"] = listaBebidas;
                }
                return listaBebidas;
            }
            set
            {
                HttpContext.Current.Session["_listaBebidas"] = value;
            }
        }

        public static IEnumerable<MedicamentosModel> ListaMedicamentos
        {
            get
            {
                IEnumerable<MedicamentosModel> listaMedicamentos = (IEnumerable<MedicamentosModel>)HttpContext.Current.Session["_listaMedicamentos"];
                if (listaMedicamentos == null)
                {
                    listaMedicamentos = GerenciadorMedicamentos.GetInstance().ObterTodos();
                    HttpContext.Current.Session["_listaMedicamentos"] = listaMedicamentos;
                }
                return listaMedicamentos;
            }
            set
            {
                HttpContext.Current.Session["_listaMedicamentos"] = value;
            }
        }

        public static IEnumerable<MedicamentoPrescritoModel> ListaMedicamentosPrescritos
        {
            get
            {
                IEnumerable<MedicamentoPrescritoModel> listaMedicamentos = (IEnumerable<MedicamentoPrescritoModel>)HttpContext.Current.Session["_listaMedicamentosPrescritos"];
                if (listaMedicamentos == null)
                {
                    listaMedicamentos = GerenciadorMedicamentoPrescrito.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_listaMedicamentosPrescritos"] = listaMedicamentos;
                }
                return listaMedicamentos;
            }
            set
            {
                HttpContext.Current.Session["_listaMedicamentosPrescritos"] = value;
            }
        }

        public static IEnumerable<QueixaMedicamentoModel> ListaQueixaMedicamento
        {
            get
            {
                IEnumerable<QueixaMedicamentoModel> listaQueixaMedicamentos = (IEnumerable<QueixaMedicamentoModel>)HttpContext.Current.Session["_listaQueixaMedicamento"];
                if (listaQueixaMedicamentos == null)
                {
                    listaQueixaMedicamentos = GerenciadorQueixaMedicamento.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_listaQueixaMedicamento"] = listaQueixaMedicamentos;
                }
                return listaQueixaMedicamentos;
            }
            set
            {
                HttpContext.Current.Session["_listaQueixaMedicamento"] = value;
            }
        }

        public static IEnumerable<ConsultaVariavelQueixaModel> ListaConsultaVariavelQueixa
        {
            get
            {
                IEnumerable<ConsultaVariavelQueixaModel> listaConsultaVariavelQueixa = (IEnumerable<ConsultaVariavelQueixaModel>)HttpContext.Current.Session["_ListaConsultaVariavelQueixa"];
                if (listaConsultaVariavelQueixa == null)
                {
                    listaConsultaVariavelQueixa = GerenciadorConsultaVariavelQueixa.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_ListaConsultaVariavelQueixa"] = listaConsultaVariavelQueixa;
                }
                return listaConsultaVariavelQueixa;
            }
            set
            {
                HttpContext.Current.Session["_ListaConsultaVariavelQueixa"] = value;
            }
        }

        public static int Sistema
        {
            get
            {
                int idSistema = (int)HttpContext.Current.Session["_IdSistema"];
                if (idSistema < 1)
                {
                    idSistema = 0;
                    HttpContext.Current.Session["_IdSistema"] = idSistema;
                }
                return idSistema;
            }
            set
            {
                HttpContext.Current.Session["_IdSistema"] = value;
            }
        }

        public static IEnumerable<MedicamentosAnterioresModel> ListaMedicamentosAnteriores
        {
            get
            {
                IEnumerable<MedicamentosAnterioresModel> listaMedicamentosAnteriores = (IEnumerable<MedicamentosAnterioresModel>)HttpContext.Current.Session["_listaMedicamentosAnteriores"];
                if (listaMedicamentosAnteriores == null)
                {
                    listaMedicamentosAnteriores = GerenciadorMedicamentosAnteriores.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_listaMedicamentosAnteriores"] = listaMedicamentosAnteriores;
                }
                return listaMedicamentosAnteriores;
            }
            set
            {
                HttpContext.Current.Session["_listaMedicamentosAnteriores"] = value;
            }
        }

        public static IEnumerable<MedicamentoNaoPrescritoModel> ListaMedicamentoNaoPrescrito
        {
            get
            {
                IEnumerable<MedicamentoNaoPrescritoModel> listaMedicamentoNaoPrescrito = (IEnumerable<MedicamentoNaoPrescritoModel>)HttpContext.Current.Session["_listaMedicamentoNaoPrescrito"];
                if (listaMedicamentoNaoPrescrito == null)
                {
                    listaMedicamentoNaoPrescrito = GerenciadorMedicamentoNaoPrescrito.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_listaMedicamentoNaoPrescrito"] = listaMedicamentoNaoPrescrito;
                }
                return listaMedicamentoNaoPrescrito;
            }
            set
            {
                HttpContext.Current.Session["_listaMedicamentoNaoPrescrito"] = value;
            }
        }


        public static IEnumerable<ConsultaParametroModel> ListaConsultaParametro
        {
            get
            {
                IEnumerable<ConsultaParametroModel> listaConsultaParametro = (IEnumerable<ConsultaParametroModel>)HttpContext.Current.Session["_ListaConsultaParametro"];
                if (listaConsultaParametro == null)
                {
                    listaConsultaParametro = GerenciadorConsultaParametro.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_ListaConsultaParametro"] = listaConsultaParametro;
                }
                return listaConsultaParametro;
            }
            set
            {
                HttpContext.Current.Session["_ListaConsultaParametro"] = value;
            }
        }

        public static ExamesFisicosModel ExamesFisicos
        {
            get
            {
                ExamesFisicosModel examesFisicos = (ExamesFisicosModel)HttpContext.Current.Session["_ExamesFisicos"];
                if (examesFisicos == null)
                {
                    examesFisicos = GerenciadorExamesFisicos.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (examesFisicos == null)
                    {
                        examesFisicos = new ExamesFisicosModel();
                        examesFisicos.Peso = 0;
                        examesFisicos.Altura = 0;
                        examesFisicos.PressaoDiastolica = 0;
                        examesFisicos.PressaoSistolica = 0;
                        examesFisicos.Glicemia = 0;
                        examesFisicos.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        GerenciadorExamesFisicos.GetInstance().Inserir(examesFisicos);
                    }
                    HttpContext.Current.Session["_ExamesFisicos"] = examesFisicos;
                }
                return examesFisicos;
            }
            set
            {
                HttpContext.Current.Session["_ExamesFisicos"] = value;
            }
        }

        public static EstiloVidaModel EstiloVida
        {
            get
            {
                EstiloVidaModel estiloVida = (EstiloVidaModel)HttpContext.Current.Session["_EstiloVida"];
                if (estiloVida == null)
                {
                    estiloVida = GerenciadorEstiloVida.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (estiloVida == null)
                    {
                        estiloVida = new EstiloVidaModel();
                        estiloVida.AlcoolConsumo = false;
                        estiloVida.AlcoolParou = "";
                        estiloVida.AlcoolTipoBebida = "";
                        estiloVida.AlcoolUso = 0;
                        estiloVida.CafeConsumo = false;
                        estiloVida.CafeParou = "";
                        estiloVida.CafeUso = 0;
                        estiloVida.TabacoConsumo = false;
                        estiloVida.TabacoParou = "";
                        estiloVida.TabacoUso = 0;
                        estiloVida.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        GerenciadorEstiloVida.GetInstance().Inserir(estiloVida);
                    }
                    HttpContext.Current.Session["_EstiloVida"] = estiloVida;
                }
                return estiloVida;
            }
            set
            {
                HttpContext.Current.Session["_EstiloVida"] = value;
            }
        }

        public static PerguntaModel ObterPergunta(int codPergunta)
        {
            string perguntaSession = "_Pergunta" + codPergunta;
            PerguntaModel pergunta = (PerguntaModel)HttpContext.Current.Session[perguntaSession];
            if (pergunta == null)
            {
                pergunta = GerenciadorPergunta.GetInstance().Obter(codPergunta);
                HttpContext.Current.Session[perguntaSession] = pergunta;
            }
            return pergunta;
        }

        public static IEnumerable<RespostaModel> ObterRespostas(int codPergunta)
        {
            string respostasSession = "_Respostas" + codPergunta;
            IEnumerable<RespostaModel> respostas = (IEnumerable<RespostaModel>)HttpContext.Current.Session[respostasSession];
            if (respostas == null)
            {
                respostas = GerenciadorResposta.GetInstance().ObterPorPergunta(codPergunta);
                HttpContext.Current.Session[respostasSession] = respostas;
            }

            //Metodos para vir da sessão
            List<RespostaModel> listaResp = respostas.ToList();
            int respCod = -1;
            switch (codPergunta)
            {
                case 2:
                    respCod = SessionController.ExperienciaMedicamentos.IdRespostaEsperaTratamento;
                    for (int i = 0; i < listaResp.Count; i++)
                    {
                        if (listaResp[i].IdResposta == respCod)
                        {
                            RespostaModel respostaExibida = listaResp[i];
                            listaResp.RemoveAt(i);
                            List<RespostaModel> listaFinal = new List<RespostaModel>();
                            listaFinal.Add(respostaExibida);
                            foreach (RespostaModel resposta in listaResp)
                            {
                                listaFinal.Add(resposta);
                            }

                            respostas = (IEnumerable<RespostaModel>)listaFinal;
                            break;
                        }
                    }
                    break;
                case 3:
                    respCod = SessionController.ExperienciaMedicamentos.IdRespostaPreocupacoes;
                    for (int i = 0; i < listaResp.Count; i++)
                    {
                        if (listaResp[i].IdResposta == respCod)
                        {
                            RespostaModel respostaExibida = listaResp[i];
                            listaResp.RemoveAt(i);
                            List<RespostaModel> listaFinal = new List<RespostaModel>();
                            listaFinal.Add(respostaExibida);
                            foreach (RespostaModel resposta in listaResp)
                            {
                                listaFinal.Add(resposta);
                            }

                            respostas = (IEnumerable<RespostaModel>)listaFinal;
                            break;
                        }
                    }
                    break;
                case 4:
                    respCod = SessionController.ExperienciaMedicamentos.IdRespostaGrauEntendimento;
                    for (int i = 0; i < listaResp.Count; i++)
                    {
                        if (listaResp[i].IdResposta == respCod)
                        {
                            RespostaModel respostaExibida = listaResp[i];
                            listaResp.RemoveAt(i);
                            List<RespostaModel> listaFinal = new List<RespostaModel>();
                            listaFinal.Add(respostaExibida);
                            foreach (RespostaModel resposta in listaResp)
                            {
                                listaFinal.Add(resposta);
                            }

                            respostas = (IEnumerable<RespostaModel>)listaFinal;
                            break;
                        }
                    }
                    break;
                case 5:
                    respCod = SessionController.ExperienciaMedicamentos.IdRespostaCultural;
                    for (int i = 0; i < listaResp.Count; i++)
                    {
                        if (listaResp[i].IdResposta == respCod)
                        {
                            RespostaModel respostaExibida = listaResp[i];
                            listaResp.RemoveAt(i);
                            List<RespostaModel> listaFinal = new List<RespostaModel>();
                            listaFinal.Add(respostaExibida);
                            foreach (RespostaModel resposta in listaResp)
                            {
                                listaFinal.Add(resposta);
                            }

                            respostas = (IEnumerable<RespostaModel>)listaFinal;
                            break;
                        }
                    }
                    break;
                case 6:
                    respCod = SessionController.ExperienciaMedicamentos.IdRespostaComportamento;
                    for (int i = 0; i < listaResp.Count; i++)
                    {
                        if (listaResp[i].IdResposta == respCod)
                        {
                            RespostaModel respostaExibida = listaResp[i];
                            listaResp.RemoveAt(i);
                            List<RespostaModel> listaFinal = new List<RespostaModel>();
                            listaFinal.Add(respostaExibida);
                            foreach (RespostaModel resposta in listaResp)
                            {
                                listaFinal.Add(resposta);
                            }

                            respostas = (IEnumerable<RespostaModel>)listaFinal;
                            break;
                        }
                    }
                    break;
                case 7:
                    respCod = SessionController.ExperienciaMedicamentos.IdRespostaIncorporadoPlano;
                    for (int i = 0; i < listaResp.Count; i++)
                    {
                        if (listaResp[i].IdResposta == respCod)
                        {
                            RespostaModel respostaExibida = listaResp[i];
                            listaResp.RemoveAt(i);
                            List<RespostaModel> listaFinal = new List<RespostaModel>();
                            listaFinal.Add(respostaExibida);
                            foreach (RespostaModel resposta in listaResp)
                            {
                                listaFinal.Add(resposta);
                            }

                            respostas = (IEnumerable<RespostaModel>)listaFinal;
                            break;
                        }
                    }
                    break;
            }
            return respostas;
        }

        public static int Abas1
        {
            get
            {
                int numeroAba1 = (int)HttpContext.Current.Session["_NumeroAba1"];
                if (numeroAba1 == 0)
                {
                    numeroAba1 = 1;
                    HttpContext.Current.Session["_NumeroAba1"] = numeroAba1;
                }
                return numeroAba1;
            }
            set
            {
                HttpContext.Current.Session["_NumeroAba1"] = value;
            }
        }

        public static int Abas2
        {
            get
            {
                int numeroAba2 = (int)HttpContext.Current.Session["_NumeroAba2"];
                if (numeroAba2 == -1)
                {
                    numeroAba2 = 0;
                    HttpContext.Current.Session["_NumeroAba2"] = numeroAba2;
                }
                return numeroAba2;
            }
            set
            {
                HttpContext.Current.Session["_NumeroAba2"] = value;
            }
        }

        public static int AncoraEdit2
        {
            get
            {
                int numeroAncora = (int)HttpContext.Current.Session["_NumeroAncora"];
                if (numeroAncora == -1)
                {
                    numeroAncora = 0;
                    HttpContext.Current.Session["_NumeroAncora"] = numeroAncora;
                }
                return numeroAncora;
            }
            set
            {
                HttpContext.Current.Session["_NumeroAncora"] = value;
            }
        }

        public static IEnumerable<IntervencaoConsultaModel> ListaIntervencaoConsulta
        {
            get
            {
                IEnumerable<IntervencaoConsultaModel> listaIntervencaoConsulta = (IEnumerable<IntervencaoConsultaModel>)HttpContext.Current.Session["_listaIntervencaoConsulta"];
                if (listaIntervencaoConsulta == null)
                {
                    listaIntervencaoConsulta = GerenciadorIntervencaoConsulta.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_listaIntervencaoConsulta"] = listaIntervencaoConsulta;
                }
                return listaIntervencaoConsulta;
            }
            set
            {
                HttpContext.Current.Session["_listaIntervencaoConsulta"] = value;
            }
        }

        public static int IdGrupoIntervencao
        {
            get
            {
                int idGrupoIntervencao = (int)HttpContext.Current.Session["_IdGrupoIntervencao"];
                if (idGrupoIntervencao < 1)
                {
                    idGrupoIntervencao = 0;
                    HttpContext.Current.Session["_IdGrupoIntervencao"] = idGrupoIntervencao;
                }
                return idGrupoIntervencao;
            }
            set
            {
                HttpContext.Current.Session["_IdGrupoIntervencao"] = value;
            }
        }

        public static IEnumerable<CartaModel> ListaCarta
        {
            get
            {
                IEnumerable<CartaModel> ListaCarta = (IEnumerable<CartaModel>)HttpContext.Current.Session["_listaCarta"];
                if (ListaCarta == null)
                {
                    ListaCarta = GerenciadorCarta.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    HttpContext.Current.Session["_listaCarta"] = ListaCarta;
                }
                return ListaCarta;
            }
            set
            {
                HttpContext.Current.Session["_listaCarta"] = value;
            }
        }
    }
}