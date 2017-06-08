package com.jb;

public class PersonData {
	private String Name = "";
	private int age = 0;

	public PersonData()
	{}

	public void setUserName(String name)
	{ this.Name = name; }
	public void setAge(int age)
	{ this.age = age; }

	public String getUserName()
	{ return this.Name; }
	public int getAge()
	{ return this.age; }
}
