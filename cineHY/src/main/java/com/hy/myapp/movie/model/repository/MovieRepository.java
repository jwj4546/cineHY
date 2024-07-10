package com.hy.myapp.movie.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.movie.model.vo.Movie;

@Repository
public class MovieRepository {

	public List<Integer> getMovieIdList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("movieMapper.getMovieIdList");
	}

	public int save(SqlSessionTemplate sqlSession, Movie movie) {
		return sqlSession.insert("movieMapper.insertMovie", movie);
	}

	public List<Movie> getMovieList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("movieMapper.getMovieList");
	}

}
