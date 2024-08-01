package mx.edu.utez.sgaa.model;

public class Estudiante {
    private String nombre;
    private String apellido;
    private String contraseña;
    private String matricula;

    public Estudiante() {
    }

    public Estudiante(String nombre, String apellido, String contraseña, String matricula) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.contraseña = contraseña;
        this.matricula = matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

}
