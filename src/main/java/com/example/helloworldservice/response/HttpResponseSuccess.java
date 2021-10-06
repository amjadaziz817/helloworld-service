package com.example.helloworldservice.response;

import lombok.Builder;

public class HttpResponseSuccess<T> extends HttpResponse<T> {
  public HttpResponseSuccess() {
    this.success = true;
  }

  @Builder
  public HttpResponseSuccess(T data) {
    super(true, data);
  }
}