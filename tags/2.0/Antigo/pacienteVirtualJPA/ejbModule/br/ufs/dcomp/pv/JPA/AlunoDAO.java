package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.Remote;

@Remote
public interface AlunoDAO {
	public void addAluno(Aluno aluno);
	public Collection<Aluno> getAllAlunos();
	public Aluno getAluno(String login);
	public void progredirConsulta(Aluno aluno);
	public ArrayList<Aluno> getAll();
	public void alocarEmTurma(Aluno aluno);
	public ArrayList<Aluno> getAllSemTurma();
	public ArrayList<Aluno> getOcupados(Turma turma);
	public ArrayList<Aluno> getAlunosFinalizados();
	public void setarOcupado(Aluno aluno, int nConsulta, int nTentativa, char lib);
}
