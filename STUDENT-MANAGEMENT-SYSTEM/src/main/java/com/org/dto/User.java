package com.org.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

	private int id; // auto increment and primary key
	private String name; //not null
	private int age; // not null
	private String email; // unique and not null
	private String password; //not null
	private long mobile; //unique and not null
}











