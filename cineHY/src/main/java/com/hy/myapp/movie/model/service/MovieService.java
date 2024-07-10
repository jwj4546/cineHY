package com.hy.myapp.movie.model.service;

import java.util.List;

import com.hy.myapp.movie.model.vo.Movie;

public interface MovieService {

	List<Integer> getMovieIdList();

	int save(Movie movie);

	List<Movie> getMovieList();

}
