package mx.edu.utez.sgaa.dao;

import mx.edu.utez.sgaa.database.DatabaseConnection;

import mx.edu.utez.sgaa.model.Estudiante;

import java.sql.*;
import java.util.Scanner;

public class DaoEstudiante {
    public int RegistrarEstudiante(Estudiante estudiante) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO estudiantes (matricula, contraseña, nombre, apellido) VALUES (?, ?, ?, ?);";
        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
                preparedStatement.setString(1, estudiante.getMatricula());
                preparedStatement.setString(2, estudiante.getContraseña());
                preparedStatement.setString(3, estudiante.getNombre());
                preparedStatement.setString(4, estudiante.getApellido());
                System.out.println(preparedStatement);

                result = preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return result;
    }

    public int eliminarEstudiante(String matricula) throws ClassNotFoundException {
        String DELETE_USER_SQL = "DELETE FROM estudiantes WHERE matricula = ?;";
        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);
                preparedStatement.setString(1, matricula);
                System.out.println(preparedStatement);

                result = preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return result;
    }
    public Estudiante loginEstudiante(String matricula, String password) throws ClassNotFoundException {
        String LOGIN_SQL = "SELECT * FROM estudiantes WHERE matricula = ? AND contraseña = ?;";
        Estudiante estudiante1 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL);
                preparedStatement.setString(1, matricula);
                preparedStatement.setString(2, password);

                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    estudiante1 = new Estudiante();
                    estudiante1.setMatricula(resultSet.getString("matricula"));
                    estudiante1.setContraseña(resultSet.getString("contraseña"));
                    // Set other properties of admin if needed
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return estudiante1;
    }

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/estudiante";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    public boolean actualizarEstudiante(Estudiante estudiante) {
        String UPDATE_SQL = "UPDATE estudiantes SET nombre = ?, apellido = ? WHERE matricula = ?;";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SQL);
                preparedStatement.setString(1, estudiante.getNombre());
                preparedStatement.setString(2, estudiante.getApellido());
                preparedStatement.setString(3, estudiante.getMatricula());

                int affectedRows = preparedStatement.executeUpdate();
                return affectedRows > 0;
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        DaoEstudiante daoEstudiante = new DaoEstudiante();

        System.out.println("Seleccione una opción:");
        System.out.println("1. Registrar estudiante");
        System.out.println("2. Eliminar estudiante");

        int opcion = scanner.nextInt();
        scanner.nextLine(); // Consumir la nueva línea

        if (opcion == 1) {
            System.out.print("Ingrese la matrícula: ");
            String matricula = scanner.nextLine();

            System.out.print("Ingrese la contraseña: ");
            String contraseña = scanner.nextLine();

            System.out.print("Ingrese el nombre: ");
            String nombre = scanner.nextLine();

            System.out.print("Ingrese el apellido: ");
            String apellido = scanner.nextLine();

            Estudiante estudiante = new Estudiante(nombre, apellido, contraseña, matricula);

            try {
                int result = daoEstudiante.RegistrarEstudiante(estudiante);
                if (result > 0) {
                    System.out.println("Estudiante registrado exitosamente.");
                } else {
                    System.out.println("Error al registrar estudiante.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (opcion == 2) {
            System.out.print("Ingrese la matrícula del estudiante a eliminar: ");
            String matricula = scanner.nextLine();

            try {
                int result = daoEstudiante.eliminarEstudiante(matricula);
                if (result > 0) {
                    System.out.println("Estudiante eliminado exitosamente.");
                } else {
                    System.out.println("Error al eliminar estudiante.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Opción no válida.");
        }

        scanner.close();
    }
}
