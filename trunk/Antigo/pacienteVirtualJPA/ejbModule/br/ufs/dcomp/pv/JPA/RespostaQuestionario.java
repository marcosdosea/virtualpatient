package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;


/**
 * The persistent class for the respostaprimeira database table.
 * 
 */
@Entity
@Table(name="respostaquestionario")
public class RespostaQuestionario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;	
	
	private int numeroQuestao;
	
	private String opcao;
	
	@Lob
	private String justificativa;

	public int getNumeroQuestao() {
		return numeroQuestao;
	}

	public void setNumeroQuestao(int numeroQuestao) {
		this.numeroQuestao = numeroQuestao;
	}

	public String getOpcao() {
		return opcao;
	}

	public void setOpcao(String opcao) {
		this.opcao = opcao;
	}

	public String getJustificativa() {
		return justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	//bi-directional many-to-one association to Consulta
    @ManyToOne
	@JoinColumn(name="fkUsuario")
	private Usuario usuario;

    public RespostaQuestionario() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
}