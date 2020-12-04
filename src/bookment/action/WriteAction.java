package bookment.action;

import bookment.dto.Remark;
import bookment.repository.RemarkRepository;
import bookment.utils.Script;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class WriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		HttpSession session = request.getSession();
		BufferedReader br = request.getReader();
		StringBuilder sb = new StringBuilder();

		String id = (String) session.getAttribute("id");
		String input;
		while ((input = br.readLine()) != null) {
			sb.append(input);
		}

		Gson gson = new Gson();
		Remark remark = gson.fromJson(sb.toString(), Remark.class);
		RemarkRepository remarkRepository = RemarkRepository.getInstance();

		int result = remarkRepository.insert(remark, id);
		if (result == 1) {
			List<Remark> list = remarkRepository.getList(id);
			String remarkDtosJson = gson.toJson(list);
			Script.outJson(remarkDtosJson, response);
		} else {
			Script.outText("error", response);
		}
	}
}

