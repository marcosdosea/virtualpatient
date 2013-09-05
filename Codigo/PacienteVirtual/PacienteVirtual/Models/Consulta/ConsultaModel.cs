﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class ConsultaModel
    {
        // Dados do paciente
        public PacienteModel Paciente { get; set; }
        public RelatoClinicoModel RelatoClinico { get; set; }
        
        // Dados fixos e compartilhados entre consultas
        public ConsultaFixoModel ConsultaFixo { get; set; }
        public HistoriaModel Historia { get; set; }
        public DemograficosAntropometricosModel DemograficoAntropometrico { get; set; }
        public ExperienciaMedicamentosModel ExperienciaMedicamentos { get; set; }
        public DiarioPessoalModel DiarioPessoal { get; set; }
        public IEnumerable<DiarioPessoalModel> ListaDiarioPessoal { get; set; }

        // Dados Variáveis nas consultas
        public ConsultaVariavelModel ConsultaVariavel { get; set; }
        public EstiloVidaModel EstiloVida { get; set; }

        public MedicamentoNaoPrescritoModel MedicamentoNaoPrescrito { get; set; }
        public IEnumerable<MedicamentoNaoPrescritoModel> ListaMedicamentoNaoPrescrito { get; set; }

        public MedicamentosAnterioresModel MedicamentosAnteriores { get; set; }
        public IEnumerable<MedicamentosAnterioresModel> ListaMedicamentosAnteriores { get; set; }

        public MedicamentoPrescritoModel MedicamentoPrescrito { get; set; }
        public IEnumerable<MedicamentoPrescritoModel> ListaMedicamentoPrescrito { get; set; }
        //public QueixaModel Queixas

    }
}