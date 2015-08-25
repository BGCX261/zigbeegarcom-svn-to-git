
public class Botao {

	private int status=0;

	
	public int getStatus(){
		return status;
	}
	
	public void simu_pressionar(){
		status=1;
	}
	public void simu_liberar(){
		status=0;
	}
	
}
