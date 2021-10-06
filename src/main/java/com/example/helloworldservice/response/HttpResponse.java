package com.example.helloworldservice.response;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HttpResponse<T> {
  protected boolean success;

  T data;
}
