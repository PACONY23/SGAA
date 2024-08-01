package mx.edu.utez.sgaa.dao;

import mx.edu.utez.sgaa.database.DatabaseConnection;
import mx.edu.utez.sgaa.model.Docente;
import mx.edu.utez.sgaa.model.Estudiante;


import java.sql.*;
import java.util.Scanner;

public class DaoDocente {
    public int RegistrarDocente(Docente docente) throws ClassNotFoundException {
        String INSERT_DOCENTES_SQL = "INSERT INTO docentes (matricula, contraseña, nombre, apellido,correoElectronico) VALUES (?, ?, ?, ?,?);";
        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DOCENTES_SQL);
                preparedStatement.setString(1, docente.getMatricula());
                preparedStatement.setString(2, docente.getContrasena());
                preparedStatement.setString(3, docente.getNombres());
                preparedStatement.setString(4, docente.getApellidos());
                preparedStatement.setString(5,docente.getCorreoElectronico());
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
    public int eliminarDocente(String matricula) throws ClassNotFoundException {
        String DELETE_DOCENTE_SQL = "DELETE FROM docentes WHERE matricula = ?;";
        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_DOCENTE_SQL);
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

    public Docente loginDocente(String matricula, String password) throws ClassNotFoundException {
        String LOGIN_SQL = "SELECT * FROM docentes WHERE matricula = ? AND contraseña = ?;";
        Docente docente1 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL);
                preparedStatement.setString(1, matricula);
                preparedStatement.setString(2, password);

                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    docente1 = new Docente();
                    docente1.setMatricula(resultSet.getString("matricula"));
                    docente1.setContrasena(resultSet.getString("contraseña"));
                    // Set other properties of admin if needed
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return docente1;
    }

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/estudiante";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    public boolean actualizarDocente(Docente docente) {
        String UPDATE_SQL = "UPDATE docentes SET nombre = ?, apellido = ? WHERE matricula = ?;";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SQL);
                preparedStatement.setString(1, docente.getNombres());
                preparedStatement.setString(2, docente.getApellidos());
                preparedStatement.setString(3, docente.getMatricula());

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
        DaoDocente daoDocente = new DaoDocente();

        System.out.println("Seleccione una opción:");
        System.out.println("1. Registrar docente");
        System.out.println("2. Eliminar docente");

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
            System.out.println("Ingrese el correo: ");
            String correoElectronico = scanner.nextLine();

            Docente docente = new Docente(nombre, apellido,matricula, contraseña,correoElectronico);

            try {
                int result = daoDocente.RegistrarDocente(docente);
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
                int result = daoDocente.eliminarDocente(matricula);
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