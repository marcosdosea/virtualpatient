package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the queixarespostaprimeira database table.
 * 
 */
@Entity
@Table(name="queixarespostaprimeira")
public class QueixaRespostaPrimeira implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;

	//bi-directional many-to-one association to RespostaPrimeira
    @ManyToOne
	@JoinColumn(name="fkResposta")
	private RespostaPrimeira respostaprimeira;

    public QueixaRespostaPrimeira() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public RespostaPrimeira getRespostaprimeira() {
		return this.respostaprimeira;
	}

	public void setRespostaprimeira(RespostaPrimeira respostaprimeira) {
		this.respostaprimeira = respostaprimeira;
	}
		
}