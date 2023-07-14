package day3.com.dao;

public class Human {
	//변수 5개 생성
	//접근지시자 private
	// id(hong), name(홍길동), age(20), java(90), oracle(100)
	
	//jsp 파일에서 아이디 : hong 이런 식으로 출력
	
	private String id = "hong";
	private String name = "홍길동";
	private int age = 20;
	private int java = 90;
	private int oracle = 100;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getJava() {
		return java;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public int getOracle() {
		return oracle;
	}
	public void setOracle(int oracle) {
		this.oracle = oracle;
	}
			
}
