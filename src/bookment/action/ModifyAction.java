package bookment.action;

import bookment.dto.Remark;
import bookment.repository.RemarkRepository;
import bookment.utils.Script;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		if(
			request.getParameter("id")==null||
				request.getParameter("id").equals("")
		) {
			Script.back("잘못된 접근입니다.", response);
			return;
		}

		BufferedReader br = request.getReader();
		StringBuilder sb = new StringBuilder();
		String id = request.getParameter("id");
		String input;

		while ((input = br.readLine()) != null) {
			sb.append(input);
		}

		Gson gson = new Gson();
		Remark remark = gson.fromJson(sb.toString(), Remark.class);
		RemarkRepository remarkRepository = RemarkRepository.getInstance();

		int result = remarkRepository.modify(remark, id);
		if (result == 1) {
			List<Remark> list = remarkRepository.getList(id);
			String remarkDtosJson = gson.toJson(list);
			Script.outJson(remarkDtosJson, response);
		} else {
			Script.outText("error", response);
		}
	}
}

