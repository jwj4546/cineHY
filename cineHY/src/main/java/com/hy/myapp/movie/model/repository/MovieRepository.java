package com.hy.myapp.movie.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MovieRepository {

	public List<Integer> getMovieIdList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("movieMapper.getMovieIdList");
	}

}
