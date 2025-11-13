//Main Spring Boot entry point

package com.prt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class VaccinationTrackerApp {
    public static void main(String[] args) {
        SpringApplication.run(VaccinationTrackerApp.class, args);
    }
}
