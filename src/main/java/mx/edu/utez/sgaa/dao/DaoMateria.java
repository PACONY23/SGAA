package mx.edu.utez.sgaa.dao;


import mx.edu.utez.sgaa.database.DatabaseConnection;
import mx.edu.utez.sgaa.model.Docente;
import mx.edu.utez.sgaa.model.Materia;


import java.sql.*;
import java.util.Scanner;
public class DaoMateria {
    public int agregarMateria(Materia materia) throws ClassNotFoundException {
        String INSERT_MATERIA_SQL = "INSERT INTO materias (Nombre_materia) VALUES (?);";
        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MATERIA_SQL);
                preparedStatement.setString(1, materia.getNombre());

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
    public int eliminarMateria(String nombre) throws ClassNotFoundException {
        String DELETE_MATERIA_SQL = "DELETE FROM MATERIAS WHERE Nombre_materia = ?;";
        int result = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/estudiante", "root", "root")) {
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MATERIA_SQL);
                preparedStatement.setString(1, nombre);
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



    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        DaoMateria daoMateria = new DaoMateria();

        System.out.println("Seleccione una opción:");
        System.out.println("1. Agregar materia");
        System.out.println("2. Eliminar materia");

        int opcion = scanner.nextInt();
        scanner.nextLine(); // Consumir la nueva línea

        if (opcion == 1) {


            System.out.print("Ingrese el nombre: ");
            String nombre = scanner.nextLine();

            Materia materia = new Materia(nombre);

            try {
                int result = daoMateria.agregarMateria(materia);
                if (result > 0) {
                    System.out.println("Materia registrada exitosamente.");
                } else {
                    System.out.println("Error al registrar materia.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (opcion == 2) {
            System.out.print("Ingrese el nombre de la materia a eliminar: ");
            String nombre = scanner.nextLine();

            try {
                int result = daoMateria.eliminarMateria(nombre);
                if (result > 0) {
                    System.out.println("Materia eliminada exitosamente.");
                } else {
                    System.out.println("Error al eliminar materia.");
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
