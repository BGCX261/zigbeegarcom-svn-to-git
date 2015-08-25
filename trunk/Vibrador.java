
public class Vibrador {
	
	private int status=0;
	
	public void setOn(){
		status=1;
	}
	
	public void setOff(){
		status=0;
	}
	
	public int getStatus(){
		return status;
	}
}
