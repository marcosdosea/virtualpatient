package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface TurmaDAO {
	public void addTurma(Turma turma);
	public ArrayList<Turma> getAllTurmas();
	public Turma getTurma(int id);
	public ArrayList<Turma> getTurmasByTutor(Tutor tutor);
}
