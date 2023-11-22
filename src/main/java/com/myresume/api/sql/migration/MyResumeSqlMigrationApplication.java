package com.myresume.api.sql.migration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class MyResumeSqlMigrationApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyResumeSqlMigrationApplication.class, args);
	}

}
