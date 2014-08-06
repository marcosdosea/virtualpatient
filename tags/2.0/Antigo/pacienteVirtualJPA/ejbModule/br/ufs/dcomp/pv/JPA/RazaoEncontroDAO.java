package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface RazaoEncontroDAO {
	
	public void addRazaoEncontro(RazaoEncontro razaoEncontro);
	public ArrayList<RazaoEncontro> getAllByIdioma(String idioma);
}
