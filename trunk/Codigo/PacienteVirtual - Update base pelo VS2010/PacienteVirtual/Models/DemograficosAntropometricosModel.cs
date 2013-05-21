using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PacienteVirtual.Models
{
    public class DemograficosAntropometricosModel
    {

        public long IdConsultaFixo { get; set; }

        public string Nome { get; set; }

        public String Genero { get; set; }

        public DateTime DataNascimento { get; set; }

        public string MedicosAtendem { get; set; }

        public string MoradiaFamilia { get; set; }

        public string OndeAdquireMedicamentos { get; set; }

        public int IdEscolaridade { get; set; }

        public int IdOcupacao { get; set; }

        public int IdPlanoSaude { get; set; }

        //falta String escolaridade, ocupação e plano de saude
    }



}