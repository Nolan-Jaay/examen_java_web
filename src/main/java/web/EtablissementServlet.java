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

/**
 * Servlet implementation class EtablissementServlet
 */
@WebServlet("/etablissements")
public class EtablissementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private ExamenLocal metier;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EtablissementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action == null) {
			listeEtablissements(request, response);
		}
		String path = request.getServletPath();
		try {
			switch (action) {
			case "new":
				nouveauEtablissement(request, response);
				break;
			case "save":
				nouveauEtablissement(request, response);
				break;
			case "details":
				editEtablissement(request, response, true);
				break;
			case "edit":
				editEtablissement(request, response, false);
				break;
			case "delete":
				deleteEtablissement(request, response);
				break;
			default:
				listeEtablissements(request, response);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private void deleteEtablissement(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		metier.deleteEtablissement(id);
		response.sendRedirect("etablissements?action=liste");

	}

	private void editEtablissement(HttpServletRequest request, HttpServletResponse response, boolean b)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("EtablissementForm.jsp");
		Integer id = Integer.parseInt(request.getParameter("id"));
		Etablissement etablissement = metier.getEtablissementsById(id);
		if (etablissement != null) {
			request.setAttribute("etablissement", etablissement);
		}

		if (b) {
			request.setAttribute("details", true);
		}

		dispatcher.forward(request, response);

	}

	private void nouveauEtablissement(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("EtablissementForm.jsp");
		dispatcher.forward(request, response);

	}

	private void listeEtablissements(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("EtablissementList.jsp");

		request.setAttribute("etablissements", metier.getEtablissements());
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("##################### " + action);
		if (action.equals("save")) {
			String code = request.getParameter("code");
			String nom = request.getParameter("nom");
			String adresse = request.getParameter("adresse");
			String ville = request.getParameter("ville");
			metier.saveEtablissement(new Etablissement(null, code, nom, adresse, ville));

		} else if (action.equals("update")) {
			System.out.println("##########################" + request.getParameter("id"));
			Integer id = Integer.parseInt(request.getParameter("id"));
			String code = request.getParameter("code");
			String nom = request.getParameter("nom");
			String adresse = request.getParameter("adresse");
			String ville = request.getParameter("ville");
			metier.editEtablissement(id, new Etablissement(id, code, nom, adresse, ville));
		}
		response.sendRedirect("etablissements?action=liste");
	}

}
