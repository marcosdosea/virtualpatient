﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Resources;

namespace PacienteVirtual.Models
{
    public enum ListaTiposFezes { FezesFormadas = 0, FezesPastosas = 1, Melena = 2, Diarreia = 3, Constipacao = 4 }

    public enum ListaEstomasCirurgicos { NaoSeAplica = 0, Colostomia = 1, Ileostomia = 2 }

    public enum ListaFormasAbdomem { Plano = 0, Retraido = 1, Globoso = 2 }

    public enum ListaSonsIntestinais { Presentes = 0, Ausentes = 1, Diminuidos = 2, Hiperativos = 3 }

    public enum ListaTipoSonsPercussao { SomMacico = 0, SomTimpanico = 1 }

    public enum ListaPalpacaoAbodminal { Normotenso = 0, Tenso = 1, Flacido = 2, SinalMurphy = 3, SinalBlumberg = 4 }

    public enum ListaColoracaoUrinaria { LimpidaClara = 0, Concentrada = 1, PresencaSendimentos = 2, Hematurica = 3, Piurica = 4, Colurica = 5 }

    public enum ListaDebitoUrinario { NaoSeAplica = 0, Oliguria = 1, Poliuria = 2, Anuria = 3, Polaciuria = 4 }

    public enum ListaCondicaoContinenciaUrinaria { IncontinenciaUrinaria = 0, RetencaoUrinaria = 1, IrrigacaoVesical = 2 }

    public class EliminacaoModel
    {
        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "codigo", ResourceType = typeof(Mensagem))]
        public long IdConsultaVariavel { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "ultima_evacuacao", ResourceType = typeof(Mensagem))]
        public DateTime UltimaEvacuacao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "evacuacoes_dia", ResourceType = typeof(Mensagem))]
        public int EvacuacoesDia { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "esforco_evacuar", ResourceType = typeof(Mensagem))]
        public bool EsforcoEvacuar { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipos_fezes", ResourceType = typeof(Mensagem))]
        public ListaTiposFezes TiposFezes { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "incontinencia_fecal", ResourceType = typeof(Mensagem))]
        public bool IncontinenciaFecal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "flatos", ResourceType = typeof(Mensagem))]
        public bool Flatos { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sangramento_retal", ResourceType = typeof(Mensagem))]
        public bool SangramentoRetal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "hemorroidas", ResourceType = typeof(Mensagem))]
        public bool Hemorroidas { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "prurido_anal", ResourceType = typeof(Mensagem))]
        public bool PruridoAnal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "estomas_cirurgicos", ResourceType = typeof(Mensagem))]
        public ListaEstomasCirurgicos EstomasCirurgicos { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "forma_abdomen", ResourceType = typeof(Mensagem))]
        public ListaFormasAbdomem FormasAbdomem { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "sons_intestinais", ResourceType = typeof(Mensagem))]
        public ListaSonsIntestinais SonsIntestinais { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tipos_sons_percussao", ResourceType = typeof(Mensagem))]
        public ListaTipoSonsPercussao TipoSonsPercussao { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "localizar", ResourceType = typeof(Mensagem))]
        public string LocalizarPercussaoAbdominal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "palpacao_abodminal", ResourceType = typeof(Mensagem))]
        public ListaPalpacaoAbodminal PalpacaoAbodminal { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "coloracao_urinaria", ResourceType = typeof(Mensagem))]
        public ListaColoracaoUrinaria ColoracaoUrinaria { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "disuria", ResourceType = typeof(Mensagem))]
        public bool Disuria { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "debito_urinario", ResourceType = typeof(Mensagem))]
        public ListaDebitoUrinario DebitoUrinario { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "tempo", ResourceType = typeof(Mensagem))]
        public string Tempo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "condicao_continencia_urinaria", ResourceType = typeof(Mensagem))]
        public ListaCondicaoContinenciaUrinaria CondicaoContinenciaUrinaria { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "irrigacao_vesical", ResourceType = typeof(Mensagem))]
        public string IrrigacaoVesical { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "irrigacao_vesical_desde", ResourceType = typeof(Mensagem))]
        public DateTime IrrigacaoVesicalDesde { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "svd", ResourceType = typeof(Mensagem))]
        public bool SVD { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "svd_instalada", ResourceType = typeof(Mensagem))]
        public DateTime SVDInstalada { get; set; }

        [Required(ErrorMessageResourceType = typeof(Mensagem), ErrorMessageResourceName = "campo_requerido")]
        [Display(Name = "cistostomia", ResourceType = typeof(Mensagem))]
        public bool Cistostomia { get; set; }
    }
}