using System.Collections;
using System.Collections.Generic;
using System.Web;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;
using System;

namespace PacienteVirtual.Controllers
{
    public class SessionController
    {

        public static bool EmCorrecao
        {
            get
            {
                return (bool)HttpContext.Current.Session["_EmCorrecao"];
            }
            set
            {
                HttpContext.Current.Session["_EmCorrecao"] = value;
            }
        }

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
        public static IEnumerable<RelatoClinicoModel> RelatoClinico
        {
            get
            {
                IEnumerable<RelatoClinicoModel> relatoClinico = (IEnumerable<RelatoClinicoModel>)HttpContext.Current.Session["_RelatoClinico"];
                if (relatoClinico == null)
                {
                    relatoClinico = GerenciadorRelatoClinico.GetInstance().ObterRelatosComConsultasAnteriores(ConsultaVariavel.IdRelato);
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
                        historia.HistoriaFamiliar = Global.stringVazia;
                        historia.HistoriaMedicaPregressa = Global.stringVazia;
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
                        demoAntro.Genero = Global.CharVazia;
                        demoAntro.Nome = Global.stringVazia;
                        demoAntro.MedicosAtendem = Global.stringVazia;
                        demoAntro.MoradiaFamilia = Global.stringVazia;
                        demoAntro.OndeAdquireMedicamentos = Global.stringVazia;
                        demoAntro.IdEscolaridade = Global.ValorInicial;
                        demoAntro.IdOcupacao = Global.ValorInicial;
                        demoAntro.IdPlanoSaude = Global.ValorInicial;
                        demoAntro.IdEstadoCivil = Global.ValorInicial;
                        demoAntro.IdNaturalidade = Global.ValorInicial;
                        demoAntro.IdReligiao = Global.ValorInicial;
                        demoAntro.RG = Global.stringVazia;
                        demoAntro.Procedencia = Global.stringVazia;
                        demoAntro.Endereco = Global.stringVazia;
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

        public static ClinicoInternacaoModel ClinicoInternacao
        {
            get
            {
                ClinicoInternacaoModel clinicoInternacao = (ClinicoInternacaoModel)HttpContext.Current.Session["_ClinicoInternacao"];
                if (clinicoInternacao == null)
                {
                    clinicoInternacao = GerenciadorClinicoInternacao.GetInstance().Obter(ConsultaVariavel.IdConsultaFixo);
                    if (clinicoInternacao == null)
                    {
                        clinicoInternacao = new ClinicoInternacaoModel();
                        clinicoInternacao.IdConsultaFixo = ConsultaVariavel.IdConsultaFixo;
                        clinicoInternacao.Clinica = Global.stringVazia;
                        clinicoInternacao.Leito = Global.stringVazia;
                        clinicoInternacao.DiagnosticoMedico = Global.stringVazia;
                        clinicoInternacao.MotivoInternacao = Global.stringVazia;
                        clinicoInternacao.UsoOutrosDescricao = Global.stringVazia;
                        clinicoInternacao.DataAdmissao = DateTime.Today;
                        GerenciadorClinicoInternacao.GetInstance().Inserir(clinicoInternacao);
                    }
                    HttpContext.Current.Session["_ClinicoInternacao"] = clinicoInternacao;
                }
                return clinicoInternacao;
            }
            set
            {
                HttpContext.Current.Session["_ClinicoInternacao"] = value;
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
                        experiencia.IdRespostaComportamento = Global.ValorInicialDadosExpMed;
                        experiencia.IdRespostaCultural = Global.ValorInicialDadosExpMed;
                        experiencia.IdRespostaEsperaTratamento = Global.ValorInicialDadosExpMed;
                        experiencia.IdRespostaGrauEntendimento = Global.ValorInicialDadosExpMed;
                        experiencia.IdRespostaIncorporadoPlano = Global.ValorInicialDadosExpMed;
                        experiencia.IdRespostaPreocupacoes = Global.ValorInicialDadosExpMed;
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

        public static IEnumerable<PatologiaModel> ListaPatologiasAtuais
        {
            get
            {
                IEnumerable<PatologiaModel> listaPatologiaisAtuais = (IEnumerable<PatologiaModel>)HttpContext.Current.Session["_ListaPatologiasAtuais"];
                if (listaPatologiaisAtuais == null)
                {
                    listaPatologiaisAtuais = GerenciadorClinicoInternacao.GetInstance().ObterPatologiasAtuais(SessionController.ConsultaFixo.IdConsultaFixo);
                    HttpContext.Current.Session["_ListaPatologiasAtuais"] = listaPatologiaisAtuais;
                }
                return listaPatologiaisAtuais;
            }
            set
            {
                HttpContext.Current.Session["_ListaPatologiasAtuais"] = value;
            }
        }

        public static IEnumerable<PatologiaModel> ListaAntecedentesPatologicos
        {
            get
            {
                IEnumerable<PatologiaModel> listaAntecedentesPatologicos = (IEnumerable<PatologiaModel>)HttpContext.Current.Session["_ListaAntecedentesPatologicos"];
                if (listaAntecedentesPatologicos == null)
                {
                    listaAntecedentesPatologicos = GerenciadorClinicoInternacao.GetInstance().ObterAntecedentesPatologicos(SessionController.ConsultaFixo.IdConsultaFixo);
                    HttpContext.Current.Session["_ListaAntecedentesPatologicos"] = listaAntecedentesPatologicos;
                }
                return listaAntecedentesPatologicos;
            }
            set
            {
                HttpContext.Current.Session["_ListaAntecedentesPatologicos"] = value;
            }
        }

        public static IEnumerable<PatologiaModel> ListaAntecedentesFamiliares
        {
            get
            {
                IEnumerable<PatologiaModel> listaAntecedentesFamiliares = (IEnumerable<PatologiaModel>)HttpContext.Current.Session["_ListaAntecedentesFamiliares"];
                if (listaAntecedentesFamiliares == null)
                {
                    listaAntecedentesFamiliares = GerenciadorClinicoInternacao.GetInstance().ObterAntecedentesFamiliares(SessionController.ConsultaFixo.IdConsultaFixo);
                    HttpContext.Current.Session["_ListaAntecedentesFamiliares"] = listaAntecedentesFamiliares;
                }
                return listaAntecedentesFamiliares;
            }
            set
            {
                HttpContext.Current.Session["_ListaAntecedentesFamiliares"] = value;
            }
        }

        public static IEnumerable<AlergiaModel> ListaClinicoInternacaoAlergia
        {
            get
            {
                IEnumerable<AlergiaModel> listaClinicoInternacaoAlergia = (IEnumerable<AlergiaModel>)HttpContext.Current.Session["_ListaClinicoInternacaoAlergia"];
                if (listaClinicoInternacaoAlergia == null)
                {
                    listaClinicoInternacaoAlergia = GerenciadorClinicoInternacao.GetInstance().ObterAlergias(SessionController.ConsultaFixo.IdConsultaFixo);
                    HttpContext.Current.Session["_ListaClinicoInternacaoAlergia"] = listaClinicoInternacaoAlergia;
                }
                return listaClinicoInternacaoAlergia;
            }
            set
            {
                HttpContext.Current.Session["_ListaClinicoInternacaoAlergia"] = value;
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

        public static int IdTurmaAtribuirMatriculaTutor
        {
            get
            {
                int idTurmaAtribuirRelatos = (int)HttpContext.Current.Session["_IdTurmaAtribuirRelatos"];
                return idTurmaAtribuirRelatos;
            }
            set
            {
                HttpContext.Current.Session["_IdTurmaAtribuirRelatos"] = value;
            }
        }

        public static int Sistema
        {
            get
            {
                int idSistema = (int)HttpContext.Current.Session["_IdSistema"];
                if (idSistema < Global.ValorInicial)
                {
                    idSistema = Global.ValorInteiroNulo;
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
                        examesFisicos.Peso = Global.ValorInteiroNulo;
                        examesFisicos.Altura = Global.ValorInteiroNulo;
                        examesFisicos.PressaoDiastolica = Global.ValorInteiroNulo;
                        examesFisicos.PressaoSistolica = Global.ValorInteiroNulo;
                        examesFisicos.Glicemia = Global.ValorInteiroNulo;
                        examesFisicos.CircunferenciaAbdominal = Global.ValorInteiroNulo;
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

        public static HigieneModel Higiene
        {
            get
            {
                HigieneModel higiene = (HigieneModel)HttpContext.Current.Session["_Higiene"];
                if (higiene == null)
                {
                    higiene = GerenciadorHigiene.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (higiene == null)
                    {
                        higiene = new HigieneModel();
                        higiene.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        GerenciadorHigiene.GetInstance().Inserir(higiene);
                    }
                    HttpContext.Current.Session["_Higiene"] = higiene;
                }
                return higiene;
            }
            set
            {
                HttpContext.Current.Session["_Higiene"] = value;
            }
        }

        public static PsicoEspiritualModel PsicoEspiritual
        {
            get
            {
                PsicoEspiritualModel psicoEspiritual = (PsicoEspiritualModel)HttpContext.Current.Session["_PsicoEspiritual"];
                if (psicoEspiritual == null)
                {
                    psicoEspiritual = GerenciadorPsicoEspiritual.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (psicoEspiritual == null)
                    {
                        psicoEspiritual = new PsicoEspiritualModel();
                        psicoEspiritual.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        GerenciadorPsicoEspiritual.GetInstance().Inserir(psicoEspiritual);
                    }
                    HttpContext.Current.Session["_PsicoEspiritual"] = psicoEspiritual;
                }
                return psicoEspiritual;
            }
            set
            {
                HttpContext.Current.Session["_PsicoEspiritual"] = value;
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
                        estiloVida.AlcoolParou = Global.stringVazia;
                        estiloVida.AlcoolTipoBebida = Global.stringVazia;
                        estiloVida.AlcoolUso = Global.ValorInteiroNulo;
                        estiloVida.CafeConsumo = false;
                        estiloVida.CafeParou = Global.stringVazia;
                        estiloVida.CafeUso = Global.ValorInteiroNulo;
                        estiloVida.TabacoConsumo = false;
                        estiloVida.TabacoParou = Global.stringVazia;
                        estiloVida.TabacoUso = Global.ValorInteiroNulo;
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
                return respostas;
            }
            return respostas;
        }

        public static int Abas1
        {
            get
            {
                int numeroAba1 = (int)HttpContext.Current.Session["_NumeroAba1"];
                if (numeroAba1 == Global.ValorInteiroNulo)
                {
                    numeroAba1 = Global.ValorInicial;
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
                if (numeroAba2 == Global.NaoSelecionado)
                {
                    numeroAba2 = Global.ValorInicial;
                    HttpContext.Current.Session["_NumeroAba2"] = numeroAba2;
                }
                return numeroAba2;
            }
            set
            {
                HttpContext.Current.Session["_NumeroAba2"] = value;
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
                if (idGrupoIntervencao < Global.ValorInicial)
                {
                    idGrupoIntervencao = Global.ValorInteiroNulo;
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

        public static string Roles
        {
            get 
            { 
                return (string)HttpContext.Current.Session["_Roles"]; 
            }
            set
            {
                HttpContext.Current.Session["_Roles"] = value;
            }
        }

        public static bool TutorVisualizaConsultaPeloCorrigirConsultas
        {
            get
            {
                return (bool)HttpContext.Current.Session["_TutorVisualizaConsultas"];
            }
            set
            {
                HttpContext.Current.Session["_TutorVisualizaConsultas"] = value;
            }
        }

        public static bool PrimeiraTelaConsulta
        {
            get
            {
                return (bool)HttpContext.Current.Session["_PrimeiraTelaConsulta"];
            }
            set
            {
                HttpContext.Current.Session["_PrimeiraTelaConsulta"] = value;
            }
        }

        public static int IdEstadoConsulta
        {
            get
            {
                return (int)HttpContext.Current.Session["_IdEstadoConsulta"];
            }
            set
            {
                HttpContext.Current.Session["_IdEstadoConsulta"] = value;
            }
        }

        //Mostrar mensagens em alert box
        public static string AlertaBox
        {
            get
            {
                return (string)HttpContext.Current.Session["_AlertaBox"];
            }
            set { HttpContext.Current.Session["_AlertaBox"] = value; }
        }

        public static string ErroConsultaVariavelQueixa2
        {
            get
            {
                return (string)HttpContext.Current.Session["_ErroConsultaVariavelQueixa2"];
            }
            set { HttpContext.Current.Session["_ErroConsultaVariavelQueixa2"] = value; }
        }

        public static string ErroQueixaMedicamento
        {
            get
            {
                return (string)HttpContext.Current.Session["_ErroQueixaMedicamento"];
            }
            set { HttpContext.Current.Session["_ErroQueixaMedicamento"] = value; }
        }

        //Enfermagem
        public static OxigenacaoModel Oxigenacao
        {
            get
            {
                OxigenacaoModel oxigenacao = (OxigenacaoModel)HttpContext.Current.Session["_Oxigenacao"];
                if (oxigenacao == null)
                {
                    oxigenacao = GerenciadorOxigenacao.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (oxigenacao == null)
                    {
                        oxigenacao = new OxigenacaoModel();
                        oxigenacao.FequenciaResporatoria = Global.ValorInteiroNulo;
                        oxigenacao.Ritmo = ListaRitmo.Regular;
                        oxigenacao.SimetriaToracica = ListaSimetriaToracica.Simetrico;
                        oxigenacao.PadraoRespiratorio = ListaPadraoRespiratorio.Eupineico;
                        oxigenacao.ObstrucaoNasal = false;
                        oxigenacao.Coriza = false;
                        oxigenacao.DesvioDeSepto = false;
                        oxigenacao.Palidez = false;
                        oxigenacao.LabioCianotico = false;
                        oxigenacao.TiposTorax = ListaTiposTorax.Barril;
                        oxigenacao.TiragemIntercostal = false;
                        oxigenacao.Expansibilidade = ListaExpansibilidade.Preservada;
                        oxigenacao.EnfizemaSubcutaneo = false;
                        oxigenacao.PresencaFremito = false;
                        oxigenacao.Tosse = "N";
                        oxigenacao.FrequenciaTosse = ListaFrequenciaTosse.NaoSeAplica;
                        oxigenacao.TipoTosse = ListaTipoTosse.NaoSeAplica;
                        oxigenacao.AspectoSecrecao = "";
                        oxigenacao.Percursao = ListaPercursao.Ar;
                        oxigenacao.GangliosPalpaveis = false;
                        oxigenacao.GangliosDolorosos = false;
                        oxigenacao.GangliosLocalizar = "";
                        oxigenacao.AuscultaPulmonar = ListaAuscultaPulmonar.VesicularPresente;
                        oxigenacao.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        GerenciadorOxigenacao.GetInstance().Inserir(oxigenacao);
                    }
                    HttpContext.Current.Session["_Oxigenacao"] = oxigenacao;
                }
                return oxigenacao;
            }
            set
            {
                HttpContext.Current.Session["_Oxigenacao"] = value;
            }
        }

        public static TermorregulacaoModel Termorregulacao
        {
            get
            {
                TermorregulacaoModel termorregulacao = (TermorregulacaoModel)HttpContext.Current.Session["_Termorregulacao"];
                if (termorregulacao == null)
                {
                    termorregulacao = GerenciadorTermorregulacao.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (termorregulacao == null)
                    {
                        termorregulacao = new TermorregulacaoModel();
                        termorregulacao.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        termorregulacao.Temperatura = Global.ValorDoubleNulo;
                        termorregulacao.TemperaturaPele = ListaTemperaturaPele.Quente;
                        termorregulacao.Sudorese = false;
                        termorregulacao.Calafrio = false;
                        termorregulacao.Piloerecao = false;
                        GerenciadorTermorregulacao.GetInstance().Inserir(termorregulacao);
                    }
                    HttpContext.Current.Session["_Termorregulacao"] = termorregulacao;
                }
                return termorregulacao;
            }
            set
            {
                HttpContext.Current.Session["_Termorregulacao"] = value;
            }
        }

        public static ConscienciaModel Consciencia
        {
            get
            {
                ConscienciaModel consciencia = (ConscienciaModel)HttpContext.Current.Session["_Consciencia"];
                if (consciencia == null)
                {
                    consciencia = GerenciadorConsciencia.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (consciencia == null)
                    {
                        consciencia = new ConscienciaModel();
                        consciencia.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        consciencia.AberturaOcular = ListaAberturaOcular.NenhumaResposta;
                        consciencia.MelhorRespostaMotora = ListaMelhorRespostaMotora.NenhumaResposta;
                        consciencia.MelhorRespostaVerbal = ListaMelhorRespostaVerbal.NenhumaResposta;
                        consciencia.AvaliacaoSedacao = ListaAvaliacaoSedacao.Grau1;
                        consciencia.AvaliacaoConscienciaGlasgow = Global.ValorInteiroNulo;
                        GerenciadorConsciencia.GetInstance().Inserir(consciencia);
                    }
                    HttpContext.Current.Session["_Consciencia"] = consciencia;
                }
                return consciencia;
            }
            set
            {
                HttpContext.Current.Session["_Consciencia"] = value;
            }
        }

        public static ComunicacaoModel Comunicacao
        {
            get
            {
                ComunicacaoModel comunicacao = (ComunicacaoModel)HttpContext.Current.Session["_Comunicacao"];
                if (comunicacao == null)
                {
                    comunicacao = GerenciadorComunicacao.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (comunicacao == null)
                    {
                        comunicacao = new ComunicacaoModel();
                        comunicacao.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        comunicacao.Celular = false;
                        comunicacao.Deprimido = false;
                        comunicacao.DiscursoIncoerente = false;
                        comunicacao.Especificar = Global.stringVazia;
                        comunicacao.InterageComEquipeSaude = false;
                        comunicacao.Leituras = false;
                        comunicacao.ParticipaAtividades = false;
                        comunicacao.Radio = false;
                        comunicacao.RecebeVisitas = false;
                        comunicacao.TipoComportamento = ListaTipoComportamento.Calmo;
                        comunicacao.TranstornosExpressaoVerbal = ListaTranstornosExpressaoVerbal.NaoSeAplica;
                        comunicacao.Tv = false;
                        comunicacao.Verbaliza = false;
                        GerenciadorComunicacao.GetInstance().Inserir(comunicacao);
                    }
                    HttpContext.Current.Session["_Comunicacao"] = comunicacao;
                }
                return comunicacao;
            }
            set
            {
                HttpContext.Current.Session["_Comunicacao"] = value;
            }
        }

        public static CirculacaoModel Circulacao
        {
            get
            {
                CirculacaoModel circulacao = (CirculacaoModel)HttpContext.Current.Session["_Circulacao"];
                if (circulacao == null)
                {
                    circulacao = GerenciadorCirculacao.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (circulacao == null)
                    {
                        circulacao = new CirculacaoModel();
                        circulacao.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        circulacao.CateterCentral = false;
                        circulacao.CateterCentralLocal = Global.stringVazia;
                        circulacao.CateterLocal = Global.stringVazia;
                        circulacao.CateterPeriferico = false;
                        circulacao.DisseccaoVenosa = false;
                        circulacao.DisseccaoVenosaLocal = Global.stringVazia;
                        circulacao.Edema = false;
                        circulacao.EdemaLocalizar = Global.stringVazia;
                        circulacao.EnchimentoCapilar = ListaEnchimentoCapilar.MenorIgual3;
                        circulacao.Flebite = false;
                        circulacao.FlebiteLocalizar = Global.stringVazia;
                        circulacao.Infiltracao = false;
                        circulacao.InfiltracaoLocalizar = Global.stringVazia;
                        circulacao.P = Global.ValorInteiroNulo;
                        circulacao.PA = Global.ValorInteiroNulo;
                        circulacao.RedeVenosaPulsosPalpaveis = false;
                        circulacao.RedeVenosaSemAcesso = false;
                        circulacao.RedeVenosaVisivel = false;
                        circulacao.SinaisFlogisticos = false;
                        circulacao.SinaisFlogisticosQuaisLocal = Global.stringVazia;
                        circulacao.Varizes = false;
                        GerenciadorCirculacao.GetInstance().Inserir(circulacao);
                    }
                    HttpContext.Current.Session["_Circulacao"] = circulacao;
                }
                return circulacao;
            }
            set
            {
                HttpContext.Current.Session["_Circulacao"] = value;
            }
        }

        public static PercepcaoExpectativasModel PercepcaoExpectativas
        {
            get
            {
                PercepcaoExpectativasModel percepcaoExpectativas = (PercepcaoExpectativasModel)HttpContext.Current.Session["_PercepcaoExpectativas"];
                if (percepcaoExpectativas == null)
                {
                    percepcaoExpectativas = GerenciadorPercepcaoExpectativas.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (percepcaoExpectativas == null)
                    {
                        percepcaoExpectativas = new PercepcaoExpectativasModel();
                        percepcaoExpectativas.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        percepcaoExpectativas.quantoDoenca = Global.stringVazia;
                        percepcaoExpectativas.duvidasQuestionamentos = Global.stringVazia;
                        GerenciadorPercepcaoExpectativas.GetInstance().Inserir(percepcaoExpectativas);
                    }
                    HttpContext.Current.Session["_PercepcaoExpectativas"] = percepcaoExpectativas;
                }
                return percepcaoExpectativas;
            }
            set
            {
                HttpContext.Current.Session["_PercepcaoExpectativas"] = value;
            }
        }

        public static SensorialModel Sensorial
        {
            get
            {
                SensorialModel sensorial = (SensorialModel)HttpContext.Current.Session["_Sensorial"];
                if (sensorial == null)
                {
                    sensorial = GerenciadorSensorial.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (sensorial == null)
                    {
                        sensorial = new SensorialModel();
                        sensorial.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        sensorial.Auditiva = false;
                        sensorial.Defensividade = false;
                        sensorial.DescricaoDor = Global.stringVazia;
                        sensorial.DescricaoTipoDistorcao = Global.stringVazia;
                        sensorial.DorIntensidadeValor = Global.ValorInteiroNulo;
                        sensorial.DuracaoDor = Global.stringVazia;
                        sensorial.EstadoMental = ListaEstadoMental.NaoSeAplica;
                        sensorial.ExpressaoFacial = false;
                        sensorial.FatoresAgravantesDor = Global.stringVazia;
                        sensorial.FatoresAliviantesDor = Global.stringVazia;
                        sensorial.Gustativa = false;
                        sensorial.Inquietacao = false;
                        sensorial.LocalizacaoDor = Global.stringVazia;
                        sensorial.Olfativa = false;
                        sensorial.PA = false;
                        sensorial.Palpebral = false;
                        sensorial.Plantar = false;
                        sensorial.Pulso = false;
                        sensorial.Pupilar = false;
                        sensorial.Respiracao = false;
                        sensorial.SemDor = false;
                        sensorial.SinalBabinski = false;
                        sensorial.Tatil = false;
                        sensorial.Visual = false;
                        GerenciadorSensorial.GetInstance().Inserir(sensorial);
                    }
                    HttpContext.Current.Session["_Sensorial"] = sensorial;
                }
                return sensorial;
            }
            set
            {
                HttpContext.Current.Session["_Sensorial"] = value;
            }
        }

        public static SexualidadeModel Sexualidade
        {
            get
            {
                SexualidadeModel sexualidade = (SexualidadeModel)HttpContext.Current.Session["_Sexualidade"];
                if (sexualidade == null)
                {
                    sexualidade = GerenciadorSexualidade.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (sexualidade == null)
                    {
                        sexualidade = new SexualidadeModel();
                        sexualidade.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        sexualidade.ConflitoPreferenciaSexual = false;
                        sexualidade.DorRelacaoSexual = false;
                        sexualidade.Edema = false;
                        sexualidade.Hiperemia = false;
                        sexualidade.Lesao = false;
                        sexualidade.OdorFetido = false;
                        sexualidade.ParceiroFixo = false;
                        sexualidade.Prurido = false;
                        sexualidade.Sangramento = false;
                        sexualidade.Secrecao = false;
                        sexualidade.SimetriaMamas = ListaSimetriaMamas.Simetricas;
                        sexualidade.TipoSecrecao = ListaTipoSecrecao.SecrecaoSerosa;
                        sexualidade.UsoContraceptivo = false;
                        sexualidade.DataExamePreventivo = DateTime.Today;
                        sexualidade.DataUltimaMenstruacao = DateTime.Today;
                        GerenciadorSexualidade.GetInstance().Inserir(sexualidade);
                    }
                    HttpContext.Current.Session["_Sexualidade"] = sexualidade;
                }
                return sexualidade;
            }
            set
            {
                HttpContext.Current.Session["_Sexualidade"] = value;
            }
        }

        public static OutrasNecessidadesModel OutrasNecessidades
        {
            get
            {
                OutrasNecessidadesModel outrasNecessidades = (OutrasNecessidadesModel)HttpContext.Current.Session["_OutrasNecessidades"];
                if (outrasNecessidades == null)
                {
                    outrasNecessidades = GerenciadorOutrasNecessidades.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (outrasNecessidades == null)
                    {
                        outrasNecessidades = new OutrasNecessidadesModel();
                        outrasNecessidades.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        outrasNecessidades.DescreverTipoTempoQtde = Global.stringVazia;
                        outrasNecessidades.DescricaoEstilista = Global.stringVazia;
                        outrasNecessidades.DescricaoGrauDependencia = Global.stringVazia;
                        outrasNecessidades.DescricaoTabagista = Global.stringVazia;
                        outrasNecessidades.Estilista = false;
                        outrasNecessidades.FrequenciaDrogas = Global.stringVazia;
                        outrasNecessidades.GrauDependencia = ListaGrauDependencia.Independente;
                        outrasNecessidades.QuantidadeDrogas = Global.stringVazia;
                        outrasNecessidades.Tabagista = false;
                        outrasNecessidades.TempoDrogas = Global.stringVazia;
                        outrasNecessidades.TipoDrogas = Global.stringVazia;
                        outrasNecessidades.UsoDrogasIlicitas = false;
                        GerenciadorOutrasNecessidades.GetInstance().Inserir(outrasNecessidades);
                    }
                    HttpContext.Current.Session["_OutrasNecessidades"] = outrasNecessidades;
                }
                return outrasNecessidades;
            }
            set
            {
                HttpContext.Current.Session["_OutrasNecessidades"] = value;
            }
        }

        public static IntegridadeTecidualModel IntegridadeTecidual
        {
            get
            {
                IntegridadeTecidualModel integridadeTecidual = (IntegridadeTecidualModel)HttpContext.Current.Session["_IntegridadeTecidual"];
                if (integridadeTecidual == null)
                {
                    integridadeTecidual = GerenciadorIntegridadeTecidual.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (integridadeTecidual == null)
                    {
                        integridadeTecidual = new IntegridadeTecidualModel();
                        integridadeTecidual.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        integridadeTecidual.Turgor = ListaTurgor.Presente;
                        integridadeTecidual.Equimose = false;
                        integridadeTecidual.Hematoma = false;
                        integridadeTecidual.Letericia = false;
                        integridadeTecidual.Descorada = false;
                        integridadeTecidual.EstadoHidratacao = ListaEstadoHidratacao.Hidratada;
                        integridadeTecidual.Purido = false;
                        integridadeTecidual.Hiperemia = false;
                        integridadeTecidual.Nodulo = false;
                        integridadeTecidual.Descamacao = false;
                        integridadeTecidual.PerdaSensibilidade = false;
                        integridadeTecidual.Eritema = false;
                        integridadeTecidual.Rubor = false;
                        integridadeTecidual.LocalAlteracaoPele = "";
                        integridadeTecidual.Pediabetico = false;
                        integridadeTecidual.Escoriacao = false;
                        integridadeTecidual.UlceraPressao = false;
                        integridadeTecidual.UlceraPressaoEstagio = "";
                        integridadeTecidual.UlceraPressaoLocal = "";
                        integridadeTecidual.Queimadura = false;
                        integridadeTecidual.QueimaduraGrau = "";
                        integridadeTecidual.QueimaduraLocal = "";
                        integridadeTecidual.FeridaCirurgica = false;
                        integridadeTecidual.FeridaCirurgicaLocal = "";
                        integridadeTecidual.LesaoAspecto = "";
                        GerenciadorIntegridadeTecidual.GetInstance().Inserir(integridadeTecidual);
                    }
                    HttpContext.Current.Session["_IntegridadeTecidual"] = integridadeTecidual;
                }
                return integridadeTecidual;
            }
            set
            {
                HttpContext.Current.Session["_IntegridadeTecidual"] = value;
            }
        }

        public static NutricaoModel Nutricao
        {
            get
            {
                NutricaoModel nutricao = (NutricaoModel)HttpContext.Current.Session["_Nutricao"];
                if (nutricao == null)
                {
                    nutricao = GerenciadorNutricao.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (nutricao == null)
                    {
                        nutricao = new NutricaoModel();
                        nutricao.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        nutricao.Peso = 0;
                        nutricao.Altura = 0;
                        nutricao.EstadoNutricional = ListaEstadoNutricional.PesoNormal;
                        nutricao.NutricaoOral = false;
                        nutricao.Disfagia = false;
                        nutricao.DificuldadeMastigar = false;
                        nutricao.SangramentoGengival = false;
                        nutricao.AusenciaDentes = false;
                        nutricao.Nausea = false;
                        nutricao.Emese = false;
                        nutricao.Pirose = false;
                        nutricao.IngestaHidrica = false;
                        nutricao.IngestaHidricaValor = 0;
                        nutricao.RestricaoHidrica = false;
                        nutricao.RestricaoHidricaValor = 0;
                        nutricao.SemRestricao = false;
                        nutricao.RestricaoAlimentar = false;
                        nutricao.RestricaoAlimentarTexto = "";
                        nutricao.HabitosAlimentares = "";
                        nutricao.DispositivosAlimentacao = ListaDispositivosAlimentacao.NaoSeAplica;
                        nutricao.Instalada = DateTime.Today;
                        GerenciadorNutricao.GetInstance().Inserir(nutricao);
                    }
                    HttpContext.Current.Session["_Nutricao"] = nutricao;
                }
                return nutricao;
            }
            set
            {
                HttpContext.Current.Session["_Nutricao"] = value;
            }
        }

        public static EliminacaoModel Eliminacao
        {
            get
            {
                EliminacaoModel eliminacao = (EliminacaoModel)HttpContext.Current.Session["_Eliminacao"];
                if (eliminacao == null)
                {
                    eliminacao = GerenciadorEliminacao.GetInstance().Obter(ConsultaVariavel.IdConsultaVariavel);
                    if (eliminacao == null)
                    {
                        eliminacao = new EliminacaoModel();
                        eliminacao.IdConsultaVariavel = ConsultaVariavel.IdConsultaVariavel;
                        eliminacao.UltimaEvacuacao = DateTime.Today;
                        eliminacao.EvacuacoesDia = Global.ValorInteiroNulo;
                        eliminacao.TiposFezes = ListaTiposFezes.FezesFormadas;
                        eliminacao.EsforcoEvacuar = false;
                        eliminacao.IncontinenciaFecal = false;
                        eliminacao.Flatos = false;
                        eliminacao.SangramentoRetal = false;
                        eliminacao.Hemorroidas = false;
                        eliminacao.PruridoAnal = false;
                        eliminacao.EstomasCirurgicos = ListaEstomasCirurgicos.NaoSeAplica;
                        eliminacao.FormasAbdomem = ListaFormasAbdomem.Plano;
                        eliminacao.SonsIntestinais = ListaSonsIntestinais.Presentes;
                        eliminacao.TipoSonsPercussao = ListaTipoSonsPercussao.SomMacico;
                        eliminacao.LocalizarPercussaoAbdominal = Global.stringVazia;
                        eliminacao.PalpacaoAbodminal = ListaPalpacaoAbodminal.Normotenso;
                        eliminacao.ColoracaoUrinaria = ListaColoracaoUrinaria.LimpidaClara;
                        eliminacao.Disuria = false;
                        eliminacao.DebitoUrinario = ListaDebitoUrinario.NaoSeAplica;
                        eliminacao.Tempo = Global.stringVazia;
                        eliminacao.CondicaoContinenciaUrinaria = ListaCondicaoContinenciaUrinaria.IncontinenciaUrinaria;
                        eliminacao.IrrigacaoVesical = Global.stringVazia;
                        eliminacao.IrrigacaoVesicalDesde = DateTime.Today;
                        eliminacao.SVD = false;
                        eliminacao.SVDInstalada = DateTime.Today;
                        eliminacao.Cistostomia = false;
                        GerenciadorEliminacao.GetInstance().Inserir(eliminacao);
                    }
                    HttpContext.Current.Session["_Eliminacao"] = eliminacao;
                }
                return eliminacao;
            }
            set
            {
                HttpContext.Current.Session["_Eliminacao"] = value;
            }
        }
    }
}