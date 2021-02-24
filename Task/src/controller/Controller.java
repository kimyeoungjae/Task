package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import org.json.simple.JSONObject;
import com.google.gson.Gson;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DTO;
import model.taskDAO;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String camera = request.getParameter("camera");
		String object = request.getParameter("object");
		
		System.out.println(camera);
		System.out.println(object);
		
		taskDAO dao = new taskDAO();
		DTO dto2 = new DTO(camera, object);
		ArrayList<DTO> array = dao.graph(dto2);

		Gson gson = new Gson();
		String jsonarray = gson.toJson(array);
		
		System.out.println(jsonarray);
		
		HttpSession session = request.getSession();
		if (array != null) {
			System.out.println("로그인 성공");
			session.setAttribute("dto", array);
		} else {
			System.out.println("로그인 실패");
			session.removeAttribute("dto");
		}
		response.sendRedirect("http://127.0.0.1:5000/tospring?js="+URLEncoder.encode(jsonarray,"utf-8"));
		
		
	}

}
