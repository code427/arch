package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import object.Context;
import object.Form;
import object.Type;
import object.User;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("site")){
			ArrayList<Context> allContext= new ArrayList<Context>();

			allContext=Context.getall((User)request.getSession().getAttribute("user"));
			request.setAttribute("tmpContext", allContext);

			request.getRequestDispatcher("/Context.jsp").forward(request, response);

		}
		else if(action.equals("type")){
			ArrayList<Type> allType= new ArrayList<Type>();

			allType=Type.getall((User)request.getSession().getAttribute("user"));
			request.setAttribute("tmpType", allType);
			request.getRequestDispatcher("/Type.jsp").forward(request, response);
			
		}
		else if(action.equals("form")){
			ArrayList<Form> allType= new ArrayList<Form>();

			allType=Form.getall((User)request.getSession().getAttribute("user"));
			request.setAttribute("tmpForm", allType);
			request.getRequestDispatcher("/Form.jsp").forward(request, response);
			
		}		else if(action.equals("user")){
			
			request.getRequestDispatcher("/user.jsp").forward(request, response);
			
		}	else if(action.equals("detail")){
			if(request.getParameter("contextid")!=null){
		
				request.getRequestDispatcher("/contextDetail.jsp").forward(request, response);
			}
			
		
			
		}
		else if(action.equals("formPic")){
			if(request.getParameter("formid")!=null){		
				request.getRequestDispatcher("/formPic.jsp?formid="+request.getParameter("formid")).forward(request, response);
			}
			
		}

		else if(action.equals("formSpread")){
			if(request.getParameter("formid")!=null){		
				request.getRequestDispatcher("/formSpread.jsp?formid="+request.getParameter("formid")).forward(request, response);
			}
			
		}	
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String action = request.getParameter("action");
		String page = null;
		System.out.println("arch post");
		if(action.equals("dologin")){
			System.out.println("arch doing login" + request.getParameter("username") + request.getParameter("password"));

			// connect to mysql

			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println("Can't load database driver" + e.toString());
			}

			User ruser = new User();
			Integer connresult = 5;
			try {
				connresult = ruser.login(request.getParameter("username"), request.getParameter("password"));
			} catch (SQLException e) {
				e.printStackTrace();
			}

			if (connresult == 0) {
				ArrayList<Context> allContext= new ArrayList<Context>();
				request.getSession().setAttribute("user", ruser);
				

				allContext=Context.getall((User)request.getSession().getAttribute("user"));
				request.setAttribute("tmpContext", allContext);
				page="/Context.jsp";
			
				
			} else if (connresult == 1) {
				request.setAttribute("dbmessage", "Incorrect username or password");
				page="/LoginMVCForm.jsp";
			} else if (connresult == 3) {
				request.setAttribute("dbmessage", "conn is null");
				page="/LoginMVCForm.jsp";
			}
			
		}
		else if (action.equals("newsite")){
			request.setAttribute("oneMap", Context.getOne((User)request.getSession().getAttribute("user")));
			page="/NewSite.jsp";
		}
		else if (action.equals("newtype")){
			page="/NewType.jsp";
		}

		else if (action.equals("docreateuser")){
			
			User createu=new User();
			createu.setName(request.getParameter("username"));
			createu.setPassword(request.getParameter("password"));
			createu.setLevel(request.getParameter("level"));
			createu.setConnection(((User) request.getSession().getAttribute("user")).getConnection());
			try {
				createu.createuser(createu);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			page="/user.jsp";
		}
		else if (action.equals("logout")) {
			

			((User) request.getSession().getAttribute("user")).logout();
			request.getSession().removeAttribute("user");
			request.getSession().invalidate();
			System.out.println("donig logout");
		page="/LoginMVCForm.jsp";

		}

		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

}
