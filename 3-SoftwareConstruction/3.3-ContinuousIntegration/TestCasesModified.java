import java.sql.*;
import oracle.jdbc.driver.*;

class TestCasesModified {

    public static void main(final String[] args) {
        int testcaseResult = 0;
        try{
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
                    args[0],
                    args[1]);

            CallableStatement cstmt1 = con.prepareCall("{? = call send_message(?,?)}");
            cstmt1.registerOutParameter(1,Types.NUMERIC);
            cstmt1.setString(2,"текст повідомлення");
            cstmt1.setString(3,"+730625816525");
            cstmt1.executeUpdate();
            System.out.print("TC1: send_message('текст повідомлення','+730625816525') очікуваний результат 1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == 1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"текст повідомлення");
            cstmt1.setString(3,"+3806258165251234567892314123");
            cstmt1.executeUpdate();
            System.out.print("TC2: send_message('текст повідомлення','+3806258165251234567892314123') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"текст повідомлення");
            cstmt1.setString(3,"+730625816525");
            cstmt1.executeUpdate();
            System.out.print("TC3: send_message('текст повідомлення','+730625816525') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"текст повідомлення");
            cstmt1.setString(3,"+38062asdg525");
            cstmt1.executeUpdate();
            System.out.print("TC4: send_message('текст повідомлення','+38062asdg525') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"текст повідомленнuhasbdiasdbaidbasdbasdbsadjasdя");
            cstmt1.setString(3,"+380625816525");
            cstmt1.executeUpdate();
            System.out.print("TC5: send_message('текст повідомленнuhasbdiasdbaidbasdbasdbsadjasdя','+380625816525') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            con.close();
        }
        catch(Exception e){System.out.println(e);}
        System.exit(testcaseResult);
    }
}
