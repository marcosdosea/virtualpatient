package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the intervencaorespostasegunda database table.
 * 
 */
@Entity
@Table(name="intervencaorespostasegunda")
public class IntervencaoRespostaSegunda implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;

	private String justificativa;
	
	private String indicacao;

	//bi-directional many-to-one association to RespostaSegunda
    @ManyToOne
	@JoinColumn(name="fkResposta2")
	private RespostaSegunda respostasegunda;

    public IntervencaoRespostaSegunda() {
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

	public String getJustificativa() {
		return this.justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}
	
	public RespostaSegunda getRespostasegunda() {
		return this.respostasegunda;
	}

	public void setRespostasegunda(RespostaSegunda respostasegunda) {
		this.respostasegunda = respostasegunda;
	}

	public void setIndicacao(String indicacao) {
		this.indicacao = indicacao;
	}

	public String getIndicacao() {
		return indicacao;
	}
	
}