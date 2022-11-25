import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

class ProgramClientCode{
	public static void main(final String[] args){
		try{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/kebapdb",
														 "postgres","1234");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("select * from message");
			while(rs.next()) 
				        System.out.println("| " + rs.getInt(1) + " | " + rs.getString(2) + " | " + rs.getInt(3) + " | " + rs.getInt(4));
			con.close();
		}
		catch(Exception e){System.out.println(e);}
	}
}