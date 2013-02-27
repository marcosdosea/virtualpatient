package br.ufs.dcomp.pv.web;

import java.sql.BatchUpdateException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;

import javax.faces.context.FacesContext;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.hibernate.exception.ConstraintViolationException;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;


public class AlunoBean {

	private String login;
	private String senha;
	private String nome;
	private String email;
	private int idade;
	private String genero;
	private String acessoInternet;
	private String anoInitCurso;
	private String intFarmacia;
	private String assFarmaceutica;
	private String atcFarmaceutica;
	private String topFarmClinica;
	private String farmClinica;
	private String dispFarmaceutica;
	private String semioFarmaceutica;
	private String matricula;
	private String senhaTeste;
	private int ocupado;
	private String idadeString;
	
	private boolean flAcessoCasa;
	private boolean flAcessoUniversidade;
	private boolean flAcessoCasaAmigo;
	private boolean flAcessoOutro;
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade() {
		this.idade = Integer.parseInt(idadeString);
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getAcessoInternet() {
		return acessoInternet;
	}
	public void setAcessoInternet(String acessoInternet) {
		this.acessoInternet = acessoInternet;
	}
	public String getAnoInitCurso() {
		return anoInitCurso;
	}
	public void setAnoInitCurso(String anoInitCurso) {
		this.anoInitCurso = anoInitCurso;
	}
	public String getIntFarmacia() {
		return intFarmacia;
	}
	public void setIntFarmacia(String intFarmacia) {
		this.intFarmacia = intFarmacia;
	}
	public String getAssFarmaceutica() {
		return assFarmaceutica;
	}
	public void setAssFarmaceutica(String assFarmaceutica) {
		this.assFarmaceutica = assFarmaceutica;
	}
	public String getAtcFarmaceutica() {
		return atcFarmaceutica;
	}
	public void setAtcFarmaceutica(String atcFarmaceutica) {
		this.atcFarmaceutica = atcFarmaceutica;
	}
	public String getTopFarmClinica() {
		return topFarmClinica;
	}
	public void setTopFarmClinica(String topFarmClinica) {
		this.topFarmClinica = topFarmClinica;
	}
	public String getFarmClinica() {
		return farmClinica;
	}
	public void setFarmClinica(String farmClinica) {
		this.farmClinica = farmClinica;
	}
	public String getDispFarmaceutica() {
		return dispFarmaceutica;
	}
	public void setDispFarmaceutica(String dispFarmaceutica) {
		this.dispFarmaceutica = dispFarmaceutica;
	}
	public String getSemioFarmaceutica() {
		return semioFarmaceutica;
	}
	public void setSemioFarmaceutica(String semioFarmaceutica) {
		this.semioFarmaceutica = semioFarmaceutica;
	}
	
	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	
	public String getSenhaTeste() {
		return senhaTeste;
	}
	public void setSenhaTeste(String senhaTeste) {
		this.senhaTeste = senhaTeste;
	}

	boolean permiteGabaritoPrimeira;
	public boolean getPermiteGabaritoPrimeira()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();
		
		Aluno alu = (Aluno) session.getAttribute("AlunoLogado");
		
		if (alu.getNrConsulta() > 1){			
			permiteGabaritoPrimeira = true;
		}
		else
		{
			permiteGabaritoPrimeira = false;
		}
		return permiteGabaritoPrimeira;		
	}
	
	boolean permiteGabaritoSegunda;
	public boolean getPermiteGabaritoSegunda()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();
		
		Aluno alu = (Aluno) session.getAttribute("AlunoLogado");
		
		if (alu.getNrConsulta() > 2){
			
			permiteGabaritoSegunda = true;
		}
		else
		{
			permiteGabaritoSegunda = false;
		}
		
		return permiteGabaritoSegunda;		
	}
	
	boolean permiteGabaritoTerceira;
	public boolean getPermiteGabaritoTerceira()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();
		
		Aluno alu = (Aluno) session.getAttribute("AlunoLogado");
		
		if (alu.getNrConsulta() > 3){
			
			permiteGabaritoTerceira = true;
		}
		else
		{
			permiteGabaritoTerceira = false;
		}
		
		return permiteGabaritoTerceira;		
	}
	
	boolean permiteGabaritoQuarta;
	public boolean getPermiteGabaritoQuarta()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();
		
		Aluno alu = (Aluno) session.getAttribute("AlunoLogado");
		
		if (alu.getNrConsulta() > 4){
			
			permiteGabaritoQuarta = true;
		}
		else
		{
			permiteGabaritoQuarta = false;
		}
		
		return permiteGabaritoQuarta;		
	}
	
	public String add() {
		
		if(getSenha().equals(getSenhaTeste())){
			
			AlunoDAO daoA = getAlunoDAO();
			Aluno newAluno = new Aluno();
			UsuarioDAO daoU = getUsuarioDAO();
			
			String listaTemp= daoU.getUsuarioTesteCadastroByEmail(email);
			String listaTemp2 = daoU.getUsuarioTesteCadastroByLogin(login); 
			
			if (listaTemp == "" && listaTemp2 == ""){
				try{				
					Usuario newUsuario = new Usuario();
					newAluno.setLogin(login);
					newUsuario.setLogin(login);
					newUsuario.setSenha(senha);
					newAluno.setNome(nome);
					newUsuario.setNome(nome);
					newAluno.setMatricula(matricula);
					newUsuario.setEmail(email);
					newUsuario.setTpUsuario("Aluno");
					newAluno.setIdade(Integer.parseInt(idadeString.trim()));
					newAluno.setGenero(genero);
					newAluno.setAnoInicioCurso(anoInitCurso);
					newAluno.setFlCursouIntroducaoFarmacia(intFarmacia);
					newAluno.setFlCursouAssistenciaFarmaceutica(assFarmaceutica);
					newAluno.setFlCursouAtencaoFarmaceutica(atcFarmaceutica);
					newAluno.setFlCursouTopicosFarmaciaClinica(topFarmClinica);
					newAluno.setFlCursouFarmaciaClinica(farmClinica);
					newAluno.setFlCursouDispencaoFarmaceutica(dispFarmaceutica);
					newAluno.setFlCursouSemiologiaFarmaceutica(semioFarmaceutica);
					newAluno.setNrConsulta(1);
					newAluno.setNrTentativa(1);
					newAluno.setLiberado('S');
					if(flAcessoCasa){
						newAluno.setFlAcessoCasa("V");
					}else{
						newAluno.setFlAcessoCasa("F");
					}
					if(flAcessoCasaAmigo){
						newAluno.setFlAcessoCasaAmigo("V");
					}else{
						newAluno.setFlAcessoCasaAmigo("F");
					}
					if(flAcessoOutro){
						newAluno.setFlAcessoOutro("V");
					}else{
						newAluno.setFlAcessoOutro("F");
					}
					if(flAcessoUniversidade){
						newAluno.setFlAcessoUniversidade("V");
					}else{
						newAluno.setFlAcessoUniversidade("F");
					}
		
					daoA.addAluno(newAluno);
					daoU.addUsuario(newUsuario);
					
					
					return "success";
					
				}catch(javax.ejb.EJBTransactionRolledbackException e){
					return "erroCadastro";
				}
			}else{
				return "emailExistente";
			}
		}else{
			JOptionPane.showMessageDialog(null, "A senha não confere!");
			return "falhou";
		}
		
	}
	
	public Collection<Aluno> getAll(){
		return getAlunoDAO().getAllAlunos();
	}
	
	public UsuarioDAO getUsuarioDAO(){
		
		UsuarioDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (UsuarioDAO) ctx.lookup("pacienteVirtualEAR/UsuarioDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public AlunoDAO getAlunoDAO() {
		
		AlunoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (AlunoDAO) ctx.lookup("pacienteVirtualEAR/AlunoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	@SuppressWarnings("unchecked")
	private static InitialContext getInitialContext() throws Exception {
		
		Hashtable properties = new Hashtable();
		
		properties.put("java.naming.factory.initial", 
				"org.jnp.interfaces.NamingContextFactory");
		properties.put("java.naming.factory.url.pkgs", 
				"org.jboss.naming:org.jnp.interfaces");
		properties.put("java.naming.provider.url", 
				"localhost");
		
		return new InitialContext(properties);
	}
	public int getOcupado() {
		return ocupado;
	}
	public void setOcupado(int ocupado) {
		this.ocupado = ocupado;
	}
	
	public String getOcupadoString(){
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();
		
		Aluno alu = (Aluno) session.getAttribute("AlunoLogado");
		
		if(alu.getLiberado()=='S'){
			if (alu.getNrConsulta() == 1){
				String retorno = String.valueOf(alu.getNrConsulta()) + " "+String.valueOf(alu.getNrTentativa());
				return retorno;

			} else if(alu.getNrConsulta() > 4){
				return "consultas finalizadas";
			}			
			else{
				return String.valueOf(alu.getNrConsulta());

			}
		}else{
			return "esperando tutor";
		}
	}
	public String getIdadeString() {
		return idadeString;
	}
	public void setIdadeString(String idadeString) {
		this.idadeString = idadeString;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public boolean isFlAcessoCasa() {
		return flAcessoCasa;
	}
	public void setFlAcessoCasa(boolean flAcessoCasa) {
		this.flAcessoCasa = flAcessoCasa;
	}
	public boolean isFlAcessoUniversidade() {
		return flAcessoUniversidade;
	}
	public void setFlAcessoUniversidade(boolean flAcessoUniversidade) {
		this.flAcessoUniversidade = flAcessoUniversidade;
	}
	public boolean isFlAcessoCasaAmigo() {
		return flAcessoCasaAmigo;
	}
	public void setFlAcessoCasaAmigo(boolean flAcessoCasaAmigo) {
		this.flAcessoCasaAmigo = flAcessoCasaAmigo;
	}
	public boolean isFlAcessoOutro() {
		return flAcessoOutro;
	}
	public void setFlAcessoOutro(boolean flAcessoOutro) {
		this.flAcessoOutro = flAcessoOutro;
	}
	
	
}
