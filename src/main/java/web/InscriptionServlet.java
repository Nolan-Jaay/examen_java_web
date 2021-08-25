package web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.ExamenLocal;
import metier.entities.Etablissement;
import metier.entities.Examen;
import metier.entities.Inscription;

/**
 * Servlet implementation class InscriptionServlet
 */
@WebServlet("/inscriptions")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private ExamenLocal metier;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action == null) {
			listeInscriptions(request, response);
		}
		String path = request.getServletPath();
		try {
			switch (action) {
			case "new":
				nouveauInscription(request, response);
				break;
			case "details":
				editInscription(request, response, true);
				break;
			case "edit":
				editInscription(request, response, false);
				break;
			case "delete":
				deleteInscription(request, response);
				break;
			default:
				listeInscriptions(request, response);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private void editInscription(HttpServletRequest request, HttpServletResponse response, boolean b) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("InscriptionForm.jsp");
		Integer id = Integer.parseInt(request.getParameter("id"));
		Inscription inscription = metier.getInscriptionsById(id);
		if (inscription != null) {
			request.setAttribute("inscription", inscription);
		}
		
		if (b) {
			request.setAttribute("details", true);
		}
		request.setAttribute("listEtablissements", metier.getEtablissements());
		request.setAttribute("listExamens", metier.getExamens());
		dispatcher.forward(request, response);
		
	}

	private void deleteInscription(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		metier.deleteInscription(id);
		response.sendRedirect("inscriptions?action=liste");
		
	}

	private void nouveauInscription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("InscriptionForm.jsp");
		
		request.setAttribute("listEtablissements", metier.getEtablissements());
		request.setAttribute("listExamens", metier.getExamens());

		dispatcher.forward(request, response);
		
	}

	private void listeInscriptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
RequestDispatcher dispatcher = request.getRequestDispatcher("InscriptionList.jsp");
		
		request.setAttribute("inscriptions", metier.getInscriptions());
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("save")) {
			String nom = request.getParameter("nom");
			Integer examenId = Integer.parseInt(request.getParameter("examen"));
			Integer etablissementId = Integer.parseInt(request.getParameter("etablissement"));
			String dateString = request.getParameter("dateNaissance");

			 DateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");

			 Date date = new Date();
			try {
				date = dateFormat.parse(dateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			metier.saveInscription(new Inscription(null, nom, date, new Examen(examenId), new Etablissement(etablissementId)));

		} else if (action.equals("update")) {
			System.out.println("##########################"+request.getParameter("id"));
			Integer id = Integer.parseInt(request.getParameter("id"));
			String nom = request.getParameter("nom");
			Integer examenId = Integer.parseInt(request.getParameter("examen"));
			Integer etablissementId = Integer.parseInt(request.getParameter("etablissement"));
			String dateString = request.getParameter("dateNaissance");

			 DateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");

			 Date date = new Date();
			try {
				date = dateFormat.parse(dateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			metier.editInscription(id, new Inscription(id, nom, date, new Examen(examenId), new Etablissement(etablissementId)));
		}
		response.sendRedirect("inscriptions?action=liste");
	}

}
