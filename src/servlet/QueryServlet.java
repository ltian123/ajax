package servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import util.JDBCUtil;
import entity.Data;

public class QueryServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//ָ������
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("QueryServlet.service()");
		PrintWriter out = response.getWriter();
		
		String key = request.getParameter("key");
		
//		System.out.println("key:"+key);
		
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Data> datas = new ArrayList<Data>();
		
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = new StringBuffer()
					.append("select spell,message ")
					.append("from t_data ")
					.append("where spell like ? ")
					.append("or message like ? ")
					.toString();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");
			ps.setString(2, "%"+key+"%");
			rs = ps.executeQuery();
			while(rs.next()){
				Data data = new Data();
				data.setSpell(rs.getString("spell"));
				data.setMessage(rs.getString("message"));
				datas.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeAll(conn, ps, rs);
		}
		
		
		JSONArray jsonArray = JSONArray.fromObject(datas);
		String datasJson = jsonArray.toString();
		out.print(datasJson);
		
	}
}
