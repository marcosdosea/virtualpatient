package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the medicamentos database table.
 * 
 */
@Entity
@Table(name="experienciamedicamentos3")

public class ExperienciaMedicamentos3 implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String descricao;

	private String idioma;
    
    public ExperienciaMedicamentos3(){    	
    }

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public String getIdioma() {
		return idioma;
	}

    

}
