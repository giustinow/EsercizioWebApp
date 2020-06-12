package it.dstech.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Persona {
@Id
private String numero;
private String nome;
private String cognome;


public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public String getCognome() {
	return cognome;
}
public void setCognome(String cognome) {
	this.cognome = cognome;
}
public String getNumero() {
	return numero;
}
public void setNumero(String numero) {
	this.numero = numero;
}

}
