package bookment.controller;

import bookment.action.Action;
import bookment.action.DeleteAction;
import bookment.action.ModifyAction;
import bookment.action.WriteAction;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/book")
public class BookmentController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		Action action = router(cmd);
		action.execute(request, response);
	}

	public Action router(String cmd) {
		if (cmd.equals("write")) {
			return new WriteAction();
		} else if (cmd.equals("modify")) {
			return new ModifyAction();
		} else if (cmd.equals("delete")) {
			return new DeleteAction();
		}
		return null;
	}
}
