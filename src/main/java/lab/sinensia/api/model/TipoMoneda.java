package lab.sinensia.api.model;

public class TipoMoneda {

	private int id;
	private String nombre;
	
	public TipoMoneda() {

	}
	
	public TipoMoneda(String nombre) {
		this.nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
}
