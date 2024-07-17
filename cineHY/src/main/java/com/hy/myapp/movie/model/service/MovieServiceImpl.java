package com.hy.myapp.movie.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.movie.model.repository.MovieRepository;
import com.hy.myapp.movie.model.vo.Movie;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieServiceImpl implements MovieService {

	private final MovieRepository movieRepository;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<Integer> getMovieIdList() {
		
		return movieRepository.getMovieIdList(sqlSession);
	}

	@Override
	public int save(Movie movie) {
		return movieRepository.save(sqlSession, movie);
	}

	@Override
	public List<Movie> getMovieList() {
		return movieRepository.getMovieList(sqlSession);
	}

	@Override
	public int delete(int movieCode) {
		return movieRepository.deleteMovie(sqlSession, movieCode);
	}

	
}
