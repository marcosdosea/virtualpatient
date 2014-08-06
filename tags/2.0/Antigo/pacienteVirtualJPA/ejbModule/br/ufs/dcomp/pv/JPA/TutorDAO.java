package br.ufs.dcomp.pv.JPA;

import java.util.Collection;

import javax.ejb.Remote;

@Remote
public interface TutorDAO {
	public void addTutor(Tutor tutor);
	public Collection<Tutor> getAllTutors();
	public Tutor getTutor(String login);
}
