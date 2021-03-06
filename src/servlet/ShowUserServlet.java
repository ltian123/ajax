package servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import entity.User;

import util.JDBCUtil;

public class ShowUserServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = new User();
		try {
			conn = JDBCUtil.getConnection();
			String sql = new StringBuffer()
					.append("select * ")
					.append("from t_user ")
					.append("where id = ? ")
					.toString();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
			}
//			out.print("{'id':'1','username':'admin','password':'admin','phone':'123','address':'11','email':'111'}");
//			String userJson = "{'id':"+user.getId()+",'username':'"+user.getUsername()+"','password':'"+user.getPassword()+"','phone':'"+user.getPhone()+"','address':'"+user.getAddress()+"','email':'"+user.getEmail()+"'}";
			
			JSONObject userObject = JSONObject.fromObject(user);
			String userJson = userObject.toString();
			out.print(userJson);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeAll(conn, ps, rs);
		}
		
		
		
		
		
		
	}
}
