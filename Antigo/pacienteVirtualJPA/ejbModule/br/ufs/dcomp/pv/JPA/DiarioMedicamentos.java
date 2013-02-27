package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the diariomedicamentos database table.
 * 
 */
@Entity
@Table(name="diariomedicamentos")

public class DiarioMedicamentos implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String periodo;
	
	private String horario;

	private String quantidade;

	private String medicamento;	
	
	private String tipoBebida;
	
	//uni-directional many-to-one association to RespostaTerceira
    @ManyToOne
	@JoinColumn(name="fkRespostaTerceira")
	private RespostaTerceira respostaTerceira;
    
    public DiarioMedicamentos(){    	
    }

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public String getHorario() {
		return horario;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setMedicamento(String medicamento) {
		this.medicamento = medicamento;
	}

	public String getMedicamento() {
		return medicamento;
	}

	public void setTipoBebida(String tipoBebida) {
		this.tipoBebida = tipoBebida;
	}

	public String getTipoBebida() {
		return tipoBebida;
	}

	public void setRespostaTerceira(RespostaTerceira respostaTerceira) {
		this.respostaTerceira = respostaTerceira;
	}

	public RespostaTerceira getRespostaTerceira() {
		return respostaTerceira;
	}
    

}
