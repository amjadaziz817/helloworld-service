package com.example.helloworldservice.controller;

import com.example.helloworldservice.response.HttpResponse;
import com.example.helloworldservice.response.HttpResponseSuccess;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloWorldController {
  @GetMapping("")
  public HttpResponse sayHello() {
     HttpResponse<String> response = HttpResponseSuccess.<String>builder()
         .data("Hello World")
         .build();
     return response;
  }
}
