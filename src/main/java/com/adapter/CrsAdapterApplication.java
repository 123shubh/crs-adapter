package com.adapter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication(scanBasePackages = { "com.adapter", "com.common" })
@EnableSwagger2
public class CrsAdapterApplication {

	public static void main(String[] args) {
		SpringApplication.run(CrsAdapterApplication.class, args);
	}

}
