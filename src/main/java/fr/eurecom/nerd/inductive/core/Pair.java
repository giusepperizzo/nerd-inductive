package fr.eurecom.nerd.inductive.core;

public class Pair {
	Object A;
	Object B;
	
	public Pair (Object a, Object b) {
		A = a;
		B = b;
	}
	
	public Object getA() {
		return A;
	}
	public void setA(Object a) {
		A = a;
	}
	public Object getB() {
		return B;
	}
	public void setB(Object b) {
		B = b;
	}
	
}
