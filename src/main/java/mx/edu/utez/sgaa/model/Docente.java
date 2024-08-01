package mx.edu.utez.sgaa.model;

public class Docente {
    private String nombres;
    private String apellidos;
    private String matricula;
    private String contrasena;
    private String correoElectronico;

    public Docente() {
    }

    public Docente(String nombres, String apellidos, String matricula, String contrasena, String correoElectronico) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.matricula = matricula;
        this.contrasena = contrasena;
        this.correoElectronico = correoElectronico;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String correoElectronico) {
        this.matricula = correoElectronico;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }
}