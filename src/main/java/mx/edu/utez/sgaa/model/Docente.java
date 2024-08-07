package mx.edu.utez.sgaa.model;

public class Docente {
    private int id;
    private String nombres;
    private String apellidos;
    private String matricula;
    private String contrasena;
    private String correoElectronico;
    private int estatus; // Asegúrate de agregar este campo
    private boolean admission;

    public Docente() {
    }

    public Docente(int id, String nombres, String apellidos, String matricula, String contrasena, String correoElectronico, int estatus, boolean admission) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.matricula = matricula;
        this.contrasena = contrasena;
        this.correoElectronico = correoElectronico;
        this.estatus = estatus;
        this.admission = admission;
    }

    // Agrega getters y setters para 'estatus'


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
    }

    // Otros getters y setters...

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

    public void setMatricula(String matricula) {
        this.matricula = matricula;
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

    public boolean isAdmission() {
        return admission;
    }

    public void setAdmission(boolean admission) {
        this.admission = admission;
    }
}
