using System.Collections.Generic;
using System.Web;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers 
{
    public class SessionController
    {
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

        public static PessoaModel Pessoa {
            get
            {
                PessoaModel pessoa = (PessoaModel)HttpContext.Current.Session["_Pessoa"];
                if (pessoa == null)
                {
                    // TODO : obter pessoa que está autenticada
                    pessoa = GerenciadorPessoa.GetInstance().Obter(2);
                    HttpContext.Current.Session["_Pessoa"] = pessoa;
                }
                return pessoa;
            }
        }

        public static PacienteModel Paciente 
        {
            get
            {
                PacienteModel paciente = (PacienteModel)HttpContext.Current.Session["_Paciente"];
                if (paciente == null)
                {
                    paciente = GerenciadorPaciente.GetInstance().Obter(RelatoClinico.IdPaciente);
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
                        experiencia.IdRespostaComportamento = 1;
                        experiencia.IdRespostaCultural = 1;
                        experiencia.IdRespostaEsperaTratamento = 1;
                        experiencia.IdRespostaGrauEntendimento = 1;
                        experiencia.IdRespostaIncorporadoPlano = 1;
                        experiencia.IdRespostaPreocupacoes = 1;
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

    }
}