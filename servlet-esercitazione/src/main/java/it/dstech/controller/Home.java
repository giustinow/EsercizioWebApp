package it.dstech.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.dstech.service.Service;

@WebServlet(urlPatterns = { "/home","/"})
public class Home extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		EntityManager em = emf.createEntityManager();
		Service service = new Service(em);
		req.setAttribute("listaPersone", service.stampaListaPersone());
		req.getRequestDispatcher("homepage.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		EntityManager em = emf.createEntityManager();
		Service service = new Service(em);
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String numeroTelefono = req.getParameter("numero");
		if(!service.checkPersona(numeroTelefono)) {
		service.aggiungiPersona(nome, cognome, numeroTelefono);
		}else {
			req.setAttribute("messaggio", "Utente gia registrato!");
		}
		req.setAttribute("listaPersone", service.stampaListaPersone());
		req.getRequestDispatcher("homepage.jsp").forward(req, resp);
	}
}
