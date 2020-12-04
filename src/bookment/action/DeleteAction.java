package bookment.action;

import bookment.repository.RemarkRepository;
import bookment.utils.Script;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		if (
			request.getParameter("id") == null ||
				request.getParameter("id").equals("")
		) {
			Script.back("잘못된 접근입니다.", response);
			return;
		}
		String id = request.getParameter("id");
		RemarkRepository remarkRepository = RemarkRepository.getInstance();

		int result = remarkRepository.delete(id);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}

