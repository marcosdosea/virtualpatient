﻿using System.Collections.Generic;
using System.Web;
using PacienteVirtual.Models;
using PacienteVirtual.Negocio;

namespace PacienteVirtual.Controllers 
{
    public class SessionController
    {
        // Dados do paciente
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

        public static int IdConsultaFixo
        {
            get
            {
                return (int)HttpContext.Current.Session["_IdConsultaFixo"];
            }
            set
            {
                HttpContext.Current.Session["_IdConsultaFixo"] = value;
            }
        }
        public PacienteModel Paciente 
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
        public RelatoClinicoModel RelatoClinico
        {
            get
            {
                RelatoClinicoModel relatoClinico = (RelatoClinicoModel)HttpContext.Current.Session["_RelatoClinico"];
                if (relatoClinico == null)
                {
                    relatoClinico = GerenciadorRelatoClinico.GetInstance().Obter(IdRelato);
                    HttpContext.Current.Session["_RelatoClinico"] = relatoClinico;
                }
                return relatoClinico;
            }
            set
            {
                HttpContext.Current.Session["_RelatoClinico"] = value;
            }
        }
        

        // Dados fixos e compartilhados entre consultas
        
        public HistoriaModel Historia
        {
            get
            {
                HistoriaModel historia = (HistoriaModel)HttpContext.Current.Session["_Historia"];
                if (historia == null)
                {
                    historia = GerenciadorHistoria.GetInstance().Obter(IdConsultaFixo);
                    HttpContext.Current.Session["_Historia"] = historia;
                }
                return historia;
            }
            set
            {
                HttpContext.Current.Session["_Historia"] = value;
            }
        }
        
        public DemograficosAntropometricosModel DemograficosAntropometricos
        {
            get
            {
                DemograficosAntropometricosModel demoAntro = (DemograficosAntropometricosModel)HttpContext.Current.Session["_DemograficosAntropometricos"];
                if (demoAntro == null)
                {
                    demoAntro = GerenciadorDemograficosAntropometricos.GetInstance().Obter(IdConsultaFixo);
                    HttpContext.Current.Session["_DemograficosAntropometricos"] = demoAntro;
                }
                return demoAntro;
            }
            set
            {
                HttpContext.Current.Session["_DemograficosAntropometricos"] = value;
            }
        }

        public ExperienciaMedicamentosModel ExperienciaMedicamentos
        {
            get
            {
                ExperienciaMedicamentosModel experiencia = (ExperienciaMedicamentosModel)HttpContext.Current.Session["_ExperienciaMedicamentos"];
                if (experiencia == null)
                {
                    experiencia = GerenciadorExperienciaMedicamentos.GetInstance().Obter(IdConsultaFixo);
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
                    listaDiarioPessoal = GerenciadorDiarioPessoal.GetInstance().Obter(IdConsultaFixo);
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
        

    }
}