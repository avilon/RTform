package org.endevel.logic;

import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class DBManagement {
    private static Connection con;
    private static DBManagement instance;

    private DBManagement() throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://127.0.0.1:5432/postgres";
            con = DriverManager.getConnection(url, "postgres", "DBPartizan");

            logger.debug("Connection created");
        } catch (ClassNotFoundException e) {
            throw new Exception(e);
        } catch (SQLException e) {
            throw new Exception(e);
        }
    }

    public static synchronized DBManagement getInstance() throws Exception {
        if (instance == null) {
            instance = new DBManagement();
        }
        return instance;
    }

    public Collection<Person> getAllPersons() throws SQLException {
        Collection<Person> persons = new ArrayList<Person>();
        Statement stm = null;
        ResultSet rs = null;
        try {
            stm = con.createStatement();
            rs = stm.executeQuery("select * from \"PERSON\"");
            while (rs.next()) {
                Person p = new Person(rs);
                persons.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return persons;
    }

    public Collection<Address> getAllAddress() throws SQLException {
        Collection<Address> adrs = new ArrayList<Address>();
        Statement stm = null;
        ResultSet rs = null;

        try {
            stm = con.createStatement();
            rs = stm.executeQuery("select * from \"ADDRESS\"");
            while (rs.next()) {
                Address a = new Address(rs);
                adrs.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return adrs;
    }

    public Collection<Auto> getAllAuto() throws SQLException {
        Collection<Auto> autos = new ArrayList<Auto>();
        Statement stm = null;
        ResultSet rs = null;

        try {
            stm = con.createStatement();
            rs = stm.executeQuery("select * from \"AUTO\"");
            while (rs.next()) {
                Auto a = new Auto(rs);
                autos.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return autos;
    }
    
    public Collection<PersonInfo> getSubjects(String family,
            String firstName,
            String lastName,
            String city,
            String brand) throws SQLException {
    	
    	System.out.println(family);
    	System.out.println(firstName);
    	System.out.println(lastName);
    	
    	Collection<PersonInfo> list = new ArrayList<PersonInfo>();
    	Statement stm = null;
    	ResultSet rs = null;
    	try {
    		StringBuilder sql = new StringBuilder(subjSql);
    		if ((family != null) && (family.length() > 0)) {
    			sql.append("  and family like '%" + family + "%'\n");
    		}
    		if ((firstName != null) && (firstName.length() > 0)) {
    			sql.append("  and first_name like '%" + firstName + "%'\n");
    		}
    		if ((lastName != null) && (lastName.length() > 0)) {
    			sql.append("  and last_name like '%" + lastName + "%'\n");
    		}
    		if ((city != null) && (city.length() > 0)) {
    			sql.append("  and city like '%" + city + "%'\n");
    		}
    		if ((brand != null) && (brand.length() > 0)) {
    			sql.append("  and brand like '%" + brand + "%'\n");
    		}

    		stm = con.createStatement();

    		rs = stm.executeQuery(sql.toString());
    		logger.debug(sql.toString());
    		System.out.println(sql.toString());;
    		
    		while (rs.next()) {
    			PersonInfo s = new PersonInfo(rs);
    			list.add(s);
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    		logger.debug(e.getMessage());
    	} finally {
    		if (stm != null) {
    			stm.close();
    		}
    		if (rs != null) {
    			rs.close();
    		}
    	}
    	return list;
    }

    public String getResultSql(String family,
            String firstName,
            String lastName,
            String city,
            String brand) {
    	
		StringBuilder sql = new StringBuilder(subjSql);
		if ((family != null) && (family.length() > 0)) {
			sql.append("  and family like '%" + family + "%'\n");
		}
		if ((firstName != null) && (firstName.length() > 0)) {
			sql.append("  and first_name like '%" + firstName + "%'\n");
		}
		if ((lastName != null) && (lastName.length() > 0)) {
			sql.append("  and last_name like '%" + lastName + "%'\n");
		}
		if ((city != null) && (city.length() > 0)) {
			sql.append("  and city like '%" + city + "%'\n");
		}
		if ((brand != null) && (brand.length() > 0)) {
			sql.append("  and brand like '%" + brand + "%'\n");
		}
		
		return sql.toString();
    }
    
    private final String subjSql = "select *\n" +
    		"  from\n" +
    		"  (\n" +
    		"      select p.\"FAMILY\"     as family\n" +
    		"            ,p.\"FIRST_NAME\" as first_name\n" +
    		"            ,p.\"LAST_NAME\"  as last_name\n" +
    		"            ,adr.\"CITY\"     as city\n" +
    		"            ,adr.\"STREET\"   as street\n" +
    		"            ,adr.\"HOUSE\"    as house\n" +
    		"            ,adr.\"FLAT\"     as flat\n" +
    		"            ,a.\"BRAND\"      as brand\n" +
    		"            ,a.\"MODEL\"      as model\n" +
    		"        from \"PERSON\"  p\n" +
    		"         left join \"ADDRESS\" adr on adr.\"PERSON_ID\" = p.\"ID\"\n" +
    		"         left join \"AUTO\" a on a.\"PERSON_ID\" = p.\"ID\" \n" +
    		"  ) t\n" +
    		"  where 1 = 1\n";
    

    private static final Logger logger = Logger.getLogger(DBManagement.class);
}
