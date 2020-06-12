package it.dstech.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import it.dstech.model.Persona;

public class Service {
	private EntityManager em;

	public Service(EntityManager em) {
		this.em = em;
	}
//Aggiunta
	public void aggiungiPersona(String nome, String cognome, String numero) {
		Persona persona = new Persona();
		persona.setNome(nome);
		persona.setCognome(cognome);
		persona.setNumero(numero);
		em.getTransaction().begin();
		em.persist(persona);
		em.getTransaction().commit();
	}
//Check
	public boolean checkPersona(String numero) {
		Persona persona = em.find(Persona.class, numero);
		if (persona != null) {
			return true;
		}
		return false;
	}
//Stampa
	public List<Persona> stampaListaPersone() {
		TypedQuery<Persona> query = em.createQuery("select u from Persona u", Persona.class);
		return query.getResultList();
	}
	
}
