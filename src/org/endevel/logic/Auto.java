package org.endevel.logic;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Auto {

    public Auto() {

    }

    public Auto(ResultSet rs) throws SQLException {
        id = rs.getInt("ID");
        personId = rs.getInt("PERSON_ID");
        brand = rs.getString("BRAND");
        model = rs.getString("MODEL");
    }

    public int getId() {
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

    public String getBrand() {
        return brand;
    }
    public void setBrand(String value) {
        brand = value;
    }
    public String getModel() {
        return model;
    }
    public void setModel(String value) {
        model = value;
    }

    private int id;
    private int personId;
    private String brand;
    private String model;
}
