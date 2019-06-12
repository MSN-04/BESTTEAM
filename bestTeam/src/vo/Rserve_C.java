package vo;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class Rserve_C {

	private RConnection rCon;
	private REXP rexp;
	
	private Rserve_C() {}
	
	private static Rserve_C instance;
	
	public static Rserve_C getInstance() {
		if(instance == null) {
			instance = new Rserve_C();
		}
		return instance;
	}
	
	public void setRConnection(RConnection rCon) {
		this.rCon = rCon;
	}

	public String returnRClass() throws RserveException, REXPMismatchException{
		String retStr = "";

	    rCon = new RConnection();
	    rexp = rCon.eval("1+2");
	    retStr = rexp.asString();
	         
	    rCon.close();

	    return retStr;
   }
}
