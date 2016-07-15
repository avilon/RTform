package org.endevel.logic;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Person {

    public Person() {

    }

    public Person(ResultSet rs) throws SQLException {
        id = rs.getInt("ID");
        family = rs.getString("FAMILY");
        firstName = rs.getString("FIRST_NAME");
        lastName = rs.getString("LAST_NAME");
    }

    public int getId() {
        return id;
    }
    public void setId(int value) {
        id = value;
    }

    public String getFamily() {
        return family;
    }
    public void setFamily(String value) {
        family = value;
    }

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String value) {
        firstName = value;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String value) {
        lastName = value;
    }

    private int id;
    private String family;
    private String firstName;
    private String lastName;

}
