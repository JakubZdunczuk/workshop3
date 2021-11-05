package pl.coderslab.entity;

import pl.coderslab.utils.DbUtil;

import java.sql.*;
import java.util.Arrays;

public class UserDao {
    private static final String CREATE_USER_QUERY = "INSERT INTO users(username, email, password) VALUES(?, ?, ?)";
    private static final String READ_USER_QUERY = "SELECT * FROM users WHERE email=?";
    private static final String UPDATE_USER_QUERY = "UPDATE users SET username=?, email=?, password=? WHERE id=?";
    private static final String DELETE_USER_QUERY = "DELETE FROM users WHERE id=?";
    private static final String FIND_USERS_QUERY = "SELECT * FROM users";

    public static User create(User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement =
                    conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                user.setId(rs.getInt(1));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static pl.coderslab.entity.User read(String email) {
        pl.coderslab.entity.User userToRead = new pl.coderslab.entity.User();
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(READ_USER_QUERY);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                userToRead.setId(rs.getInt("id"));
                userToRead.setUsername(rs.getString("username"));
                userToRead.setEmail(rs.getString("email"));
                userToRead.setPassword(rs.getString("password"));
                return userToRead;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void update(pl.coderslab.entity.User user) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(UPDATE_USER_QUERY);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setInt(4, user.getId());
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void delete(int id) {
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(DELETE_USER_QUERY);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static pl.coderslab.entity.User[] findAll() {
        pl.coderslab.entity.User[] usersToFind = new pl.coderslab.entity.User[0];
        try (Connection conn = DbUtil.getConnection()) {
            PreparedStatement statement = conn.prepareStatement(FIND_USERS_QUERY);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                pl.coderslab.entity.User dbUser=new pl.coderslab.entity.User();
                dbUser.setId(rs.getInt("id"));
                dbUser.setEmail(rs.getString("email"));
                dbUser.setUsername(rs.getString("username"));
                dbUser.setPassword(rs.getString("password"));

                usersToFind=Arrays.copyOf(usersToFind, usersToFind.length+1);
                usersToFind[usersToFind.length-1]=dbUser;
            }
            return usersToFind;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }


    }
}