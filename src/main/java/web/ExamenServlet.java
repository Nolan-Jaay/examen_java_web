package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.ExamenLocal;
import metier.entities.Examen;

/**
 * Servlet implementation class ExamenServlet
 */

@WebServlet(name = "examenController", urlPatterns = {"/examens/*"})
public class ExamenServlet extends HttpServlet {

	@EJB
	private ExamenLocal metier;

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamenServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			listeExamens(request, response);
		}
		String path = request.getServletPath();
		try {
			switch (action) {
			case "new":
				nouveauExamen(request, response);
				break;
			case "save":
				saveExamen(request, response);
				break;
			case "details":
				editExamen(request, response, true);
				break;
			case "edit":
				editExamen(request, response, false);
				break;
			case "delete":
				deleteExamen(request, response);
				break;
			default:
				listeExamens(request, response);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	private void listeExamens(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ExamenList.jsp");
		
		request.setAttribute("examens", metier.getExamens());
		dispatcher.forward(request, response);
	}
	
	private void nouveauExamen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ExamenForm.jsp");
		dispatcher.forward(request, response);
	}
	
	private void saveExamen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String libelle = request.getParameter("libelle");
		// String dateString = request.getParameter("date");

		metier.saveExamen(new Examen(null, code, libelle, new Date()));
		response.sendRedirect("liste");
	}
	
	private void editExamen(HttpServletRequest request, HttpServletResponse response, Boolean details) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ExamenForm.jsp");
		Integer id = Integer.parseInt(request.getParameter("id"));
		Examen examen = metier.getExamensById(id);
		if (examen != null) {
			request.setAttribute("examen", examen);
		}
		
		if (details) {
			request.setAttribute("details", true);
		}

		dispatcher.forward(request, response);
	}
	
	private void deleteExamen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		metier.deleteExamen(id);
		response.sendRedirect("examens?action=liste");
	}
	
	/*
	 * 	private void listeExamens(HttpServletRequest request, HttpServletResponse response) {
		
	}
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if (action.equals("save")) {
			String code = request.getParameter("code");
			String libelle = request.getParameter("libelle");
			String dateString = request.getParameter("date");
			 DateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");

			 Date date = new Date();
			try {
				date = dateFormat.parse(dateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			metier.saveExamen(new Examen(null, code, libelle, date));

		} else if (action.equals("update")) {
			System.out.println("##########################"+request.getParameter("id"));
			Integer id = Integer.parseInt(request.getParameter("id"));
			String code = request.getParameter("code");
			String libelle = request.getParameter("libelle");
			String dateString = request.getParameter("date");
			 DateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");

			 Date date = new Date();
			try {
				date = dateFormat.parse(dateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			metier.editExamen(id, new Examen(null, code, libelle, date));
		}
		response.sendRedirect("examens?action=liste");
		
	}

}
