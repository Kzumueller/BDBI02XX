/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller;

import com.zumueller.container.Container;
import com.zumueller.container.NoSuchEntryException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;

/**
 * class for data base interactions
 *
 * @author Kevin
 */
public class DBConnection {

    public final static String URL = "db.url";
    public final static String USER = "db.user";
    public final static String PASSWORD = "db.password";

    private Connection dbConnection = null;
    private PreparedStatement selectAllStatement = null;

    /**
     * returns the held dbConnection, after connecting if necessary
     *
     * as a PHP guy, I find it quite lovely to store references between requests
     *
     * @return
     */
    public Connection getConnection() {
        if (null == dbConnection) {
            dbConnection = connect();
        }

        return dbConnection;
    }

    /**
     * method for setting up a DB connection
     *
     * @return java.sql.Connection
     */
    private Connection connect() {
        Connection connection = null;
        try {
            String url = (String) Container.getContainer().get(URL);
            String user = (String) Container.getContainer().get(USER);
            String password = (String) Container.getContainer().get(PASSWORD);
            connection = DriverManager.getConnection(url, user, password);

        } catch (NoSuchEntryException exception) {
            System.err.println("DB driver could not be loaded");
        } catch (SQLException exception) {
            System.err.println("Connection could not be established with message: " + exception.getMessage());
        }

        return connection;
    }

    /**
     * returns the stored prepared statement to select all posts, after
     * preparing it if necessary
     *
     * @return
     * @throws SQLException
     */
    public PreparedStatement getSelectAllStatement() throws SQLException {
        if (null == selectAllStatement) {
            Connection connection = getConnection();
            if (null != connection) {
                selectAllStatement = connection.prepareStatement(String.format("SELECT * FROM %s WHERE %s = 0", Post.TABLE_NAME, Post.IS_RESPONSE));
            }
        }

        return selectAllStatement;
    }

    /**
     * retrieves all posts and returns them hydrated as a list of Post
     *
     * @return
     */
    public List<Post> getAllPosts() {
        try {
            PreparedStatement statement = getSelectAllStatement();
            if (null != statement) {
                ResultSet result = statement.executeQuery();

                return hydrate(result);
            }
        } catch (SQLException exception) {
            System.err.println("DB operation failed with message: " + exception.getMessage());
        }

        return new ArrayList();
    }

    /**
     * returns a list of Posts where attribute = value for attribute names, see
     * class constants of Post
     * @see Post
     *
     * once again parameterized SQL because value will likely come via GET
     * request
     *
     * @param attribute
     * @param value
     * @return
     */
    public List<Post> getPostsByCondition(String attribute, Object value) {
        Connection connection = getConnection();

        if (null == connection) {
            return new ArrayList();
        }
        try {
            PreparedStatement statement = connection.prepareStatement(String.format("SELECT * FROM %s WHERE %s = ?", Post.TABLE_NAME, attribute));
            statement.setString(1, String.valueOf(value));
            ResultSet result = statement.executeQuery();

            return hydrate(result);
        } catch (SQLException exception) {
            System.err.println("DB operation failed with message: " + exception.getMessage());
            return new ArrayList();
        }
    }

    /**
     * extracts data from the provided Map and inserts it into the database uses
     * parameterized SQL because SQL injections are bad
     * sets the generated key into the request as an attribute so it can be retrieved in the template - just a tiny bit hacky
     *
     * @param request
     * @return boolean
     */
    public boolean insert(ServletRequest request) {
        boolean success;
        String generatedId;
        ResultSet result;
        Connection connection = getConnection();
        Map<String, String[]> parameters = request.getParameterMap();

        if (null == connection) {
            return false;
        }

        try {
            String sql = String.format("INSERT INTO %s(%s, %s, %s, %s, %s, %s, %s) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)",
                    Post.TABLE_NAME, Post.RESPONSE_ID, Post.IS_RESPONSE, Post.NAME, Post.EMAIL, Post.TITLE, Post.CONTENT, Post.TIMESTAMP);

            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            statement.setString(1, parameters.get(Post.RESPONSE_ID)[0]);
            statement.setString(2, parameters.get(Post.IS_RESPONSE)[0]);
            statement.setString(3, parameters.get(Post.NAME)[0]);
            statement.setString(4, parameters.get(Post.EMAIL)[0]);
            statement.setString(5, parameters.get(Post.TITLE)[0]);
            statement.setString(6, parameters.get(Post.CONTENT)[0]);

            success = 0 < statement.executeUpdate(); //returns affected rows
            
            (result = statement.getGeneratedKeys()).next(); //fun times
            generatedId = result.getString(1);
            request.setAttribute(Post.ID, generatedId);
        } catch (SQLException exception) {
            System.err.println("Could not insert post with message: " + exception.getMessage());
            success = false;
        }

        return success;
    }

    /**
     * hydrator function turning a ResultSet into a list of Post
     *
     * @param result
     * @return
     */
    private List<Post> hydrate(ResultSet result) {
        List<Post> posts = new ArrayList();
        Post post;

        try {
            while (result.next()) {
                post = new Post(
                        result.getInt(Post.ID),
                        result.getInt(Post.RESPONSE_ID),
                        result.getBoolean(Post.IS_RESPONSE),
                        result.getString(Post.NAME),
                        result.getString(Post.EMAIL),
                        result.getString(Post.TITLE),
                        result.getString(Post.CONTENT),
                        result.getString(Post.TIMESTAMP)
                );

                posts.add(post);
            }
        } catch (SQLException exception) {
            System.err.println(exception.getMessage());
        }

        return posts;
    }
}
