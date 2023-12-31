package com.flamierd.booklibraryapi.domain.book.web.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class FavoriteUserBookResponse {
    private Long id;

    private String title;
}
