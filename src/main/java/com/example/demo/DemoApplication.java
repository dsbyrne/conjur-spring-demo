package com.example.demo;

import javax.annotation.PostConstruct;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.beans.factory.annotation.Value;

@SpringBootApplication
public class DemoApplication {
  public static void main(String[] args) {
    SpringApplication.run(DemoApplication.class, args);
  }

  @Value("${demo-app/api-key}")
  String password;

  @PostConstruct
  private void postConstruct() {
    System.out.println("My password is: " + password);
  }
}
