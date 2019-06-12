package vo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class Rserve_S {

	private Rserve_S() {
	}

	private static Rserve_S instance;

	public static Rserve_S getInstance() {
		// BoardDAO 객체를 저장하는 변수 instance 가 null 일 때만 인스턴스 생성
		if (instance == null) {
			instance = new Rserve_S();
		}

		return instance;
	}

	// -------------------------------------------------------------------

	public REXP x = null;
	public RConnection c = null;
	public String retStr = "";

	public void getDataFrame1() throws REngineException, REXPMismatchException {

		c = new RConnection();

		double[] dataX = { 10, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		double[] dataY = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 };

		c.assign("x", dataX);
		c.assign("y", dataY);

		RList l = c.eval("lowess(x,y)").asList();
		double[] lx = l.at("x").asDoubles();
		String[] ly = l.at("y").asStrings();

		for (int i = 0; i < lx.length; i++) {
			System.out.println(lx[i]);
		}

		System.out.println("==============================");

		for (int i = 0; i < ly.length; i++) {
			System.out.println(ly[i]);
		}

	}

	public String returnRClass() throws RserveException, REXPMismatchException {

		c = new RConnection();
		x = c.eval("1+2");
		retStr = x.asString();

		return retStr;
	}

	public byte[] returnRImg() throws REngineException, REXPMismatchException {

		RConnection r = new RConnection();

		String device = "jpeg";
		x = r.parseAndEval("try(" + device + "('test.jpg',quality=90))");
		System.out.println("1");

		// ok, so the device should be fine - let's plot - replace this by any plotting
		// code you desire ...

//		r.parseAndEval("x <- mtcars$mpg ");
//		System.out.println("2");
//
//		r.parseAndEval(
//				"h<-hist(x, breaks=10, col=\"yellow\", xlab=\"Miles Per Gallon\", main=\"Histogram with Normal Curve\")");
//		System.out.println("3");
//
//		r.parseAndEval("xfit<-seq(min(x),max(x),length=40)");
//		System.out.println("4");
//
//		r.parseAndEval("yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))");
//		System.out.println("5");
//
//		r.parseAndEval("yfit <- yfit*diff(h$mids[1:2])*length(x)");
//		System.out.println("6");
//
//		r.parseAndEval("lines(xfit, yfit, col=\"blue\", lwd=2)");
//		System.out.println("7");
		r.parseAndEval("exam <- read.csv(\"D:/RTest/csv_exam.csv\")");
//		r.parseAndEval("");
		r.parseAndEval("exam$sum <- exam$math + exam$english + exam$science");
		r.parseAndEval("exam$mean <- exam$sum / 3");
		r.parseAndEval("hist(exam$mean)");


		// graphics off
		r.parseAndEval("graphics.off()");
		System.out.println("8");

		// There is no I/O API in REngine because it's actually more efficient to use R
		// for this
		// we limit the file size to 1MB which should be sufficient and we delete the
		// file as well
		x = r.parseAndEval("r=readBin('test.jpg','raw',1024*1024); unlink('test.jpg'); r");
		System.out.println("9");

		return x.asBytes();// img;
	}
	
	
	
	
}
