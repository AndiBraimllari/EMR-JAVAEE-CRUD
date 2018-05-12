package connect_sql;
import java.sql.*;

public class Connect_SQL {
	public String getOurDb(int colIndex){
		String query = "SELECT * FROM patient;";
		String str = null;
		Statement statement = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital"
					, "root", "admin");
			statement = conn.createStatement();;//"INSERT INTO patient(name, age) VALUES (\"beni\", 9) ";
		}catch(Exception e){
			System.out.println("Ndodhi nje problem");
		}
		try{
			ResultSet rs = statement.executeQuery(query);
			rs.next();
			str = rs.getString(colIndex);
		}catch(Exception e){
			System.out.println(e);
		}
		return str;
	}
	public String[][] selectAll(){
		String[][] str = null;
		String query = "SELECT * FROM patient;";
		Statement statement = null;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital"
					, "root", "admin");
			statement = conn.createStatement();//"INSERT INTO patient(name, age) VALUES (\"beni\", 9) ";
			ResultSet rs = statement.executeQuery(query);
			str = new String[3][4];
			int i = 1;
			while(rs.next()){
				for(int j = 1;j<=4;j++){
					System.out.println(rs.getString(j));
					str[i-1][j-1] = rs.getString(j);
				}
				++i;
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return str;
	}
	
	
	public String[] searchPatient(String name){
		String str[] = null;
		name = "\""+name+"\"";
		String query = "SELECT * FROM patient WHERE name="+name+";";
		Statement statement = null;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital"
					, "root", "admin");
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(query);

			str = new String[4];
			while(rs.next()){
				for(int i = 0; i<4; i++){
					str[i] = rs.getString(i+1);
				}
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return str; 
	}
	public boolean insertPatient(String name, int age, String gender){
		//if(name == null || age == -1)
			//return false;
		name = "\""+name+"\"";
		gender = "\""+gender+"\"";
		String query = "INSERT INTO patient(name, age, gender) VALUES("+name+","+age+","+gender+")";
		Statement statement = null;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital"
					, "root", "admin");
			statement = conn.createStatement();
			statement.executeUpdate(query);
			return true;
	}catch(Exception e){
		System.out.println(e);
		return false;
		}
	}
	public boolean updatePatient(String ID, String name, int age, String gender){
		//if (age == -1)
			//return false;
		name = "\""+name+"\"";
		gender = "\""+gender+"\"";
		String query = "UPDATE patient SET name="+name+","
				+ "age="+age+", gender="+gender+" WHERE ID_patient="+ID+";";
		Statement statement = null;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital"
					, "root", "admin");
			statement = conn.createStatement();
			statement.executeUpdate(query);
			return true;
	}catch(Exception e){
		System.out.println(e);
		return false;
		}
	}
	public boolean deletePatient(String ID){
		String query0 = "SET SQL_SAFE_UPDATES = 0;";
		String query = "DELETE FROM patient WHERE ID_patient="+ID+";";
		String query1 = "SET SQL_SAFE_UPDATES = 1;";
		Statement statement = null;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital"
					, "root", "admin");
			statement = conn.createStatement();
			statement.executeUpdate(query0);
			statement.executeUpdate(query);
			statement.executeUpdate(query1);
			return true;
	}catch(Exception e){
		System.out.println(e);
		return false;
		}
	}
	public static void main(String[] args) {
		Connect_SQL c = new Connect_SQL();
		System.out.println(c.deletePatient("1"));
		
	}

}
