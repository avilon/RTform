package org.endevel.logic;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Address {

    public Address() {

    }
    public Address(ResultSet rs) throws SQLException {
        id = rs.getInt("ID");
        personId = rs.getInt("PERSON_ID");
        city = rs.getString("CITY");
        street = rs.getString("STREET");
        house = rs.getString("HOUSE");
        flat = rs.getString("FLAT");
    }

    public int id() {
        return id;
    }
    public void setId(int value) {
        id = value;
    }
    public int getPersonId() {
        return personId;
    }
    public void setPersonId(int value) {
        personId = value;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String value) {
        city = value;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String value) {
        street = value;
    }
    public String getHouse() {
        return house;
    }
    public void setHouse(String value) {
        house = value;
    }
    public String getFlat() {
        return  flat;
    }
    public void setFlat(String value) {
        flat = value;
    }

    private int id;
    private int personId;
    private String city;
    private String street;
    private String house;
    private String flat;
}
