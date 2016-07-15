package org.endevel.logic;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonInfo {

    public PersonInfo(ResultSet rs) throws SQLException {
        family = rs.getString("FAMILY");
        firstName = rs.getString("FIRST_NAME");
        lastName = rs.getString("LAST_NAME");
        city = rs.getString("CITY");
        street = rs.getString("STREET");
        house = rs.getString("HOUSE");
        flat = rs.getString("FLAT");
        brand = rs.getString("BRAND");
        model = rs.getString("MODEL");
    }

    public int getId() {
        return id;
    }
    public String getFamily() {
        return family;
    }
    public String getFirstName() {
        return firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public String getCity() {
        return city;
    }
    public String getStreet() {
        return street;
    }
    public String getHouse() {
        return house;
    }
    public String getFlat() {
        return flat;
    }
    public String getBrand() {
    	return brand;
    }
    public String getModel() {
    	return model;
    }

    private int id;
    private String family;
    private String firstName;
    private String lastName;
    private String city;
    private String street;
    private String house;
    private String flat;
    private String brand;
    private String model;
}
