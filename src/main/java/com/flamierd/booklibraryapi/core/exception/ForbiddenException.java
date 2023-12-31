package com.flamierd.booklibraryapi.core.exception;

import org.springframework.http.HttpStatus;

public class ForbiddenException extends BookLibraryException {
    public ForbiddenException(String message) {
        super(message, HttpStatus.FORBIDDEN);
    }
}
