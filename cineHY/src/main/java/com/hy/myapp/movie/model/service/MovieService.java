package com.hy.myapp.movie.model.service;

import java.util.List;

import com.hy.myapp.movie.model.vo.Movie;

public interface MovieService {


	int save(Movie movie);

	List<Movie> getMovieList();

	int delete(Movie movie);

}
