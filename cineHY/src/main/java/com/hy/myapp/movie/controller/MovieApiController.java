package com.hy.myapp.movie.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.hy.myapp.movie.model.service.MovieService;
import com.hy.myapp.movie.model.vo.Message;
import com.hy.myapp.movie.model.vo.Movie;

import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Slf4j
@RestController
@RequestMapping("movieList/")
public class MovieApiController {
	
	@Autowired
    private MovieService movieService;
	
	@GetMapping(value="nowPlaying", produces="application/json; charset=UTF-8")
	public String getNowPlayingMovie(@RequestParam("pageNo") int pageNo) throws IOException {
		
		//OkHttp 클라이언트 객체생성
		OkHttpClient client = new OkHttpClient();

		//get 요청
		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/now_playing?append_to_response=images&language=ko-KR&page="+pageNo+"&include_image_language=en,null")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcxOTk4Mzc5NS40NDkyODMsInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qMXzz1zFbiC7Mct5mGb96DwMT3Tjtuo1HFjLE_b_kZ0")
		  .build();

		// 요청 실행 및 응답 받기
        try (Response response = client.newCall(request).execute()) {
            // 응답 본문 추출
            okhttp3.ResponseBody responseBody = response.body();
            if (responseBody != null) {
                return responseBody.string();
            } else {
                return "{}"; // 응답 본문이 없는 경우 빈 JSON 객체 반환
            }
        }
    }
	
	@GetMapping(value="upComming", produces="application/json; charset=UTF-8")
	public String getUpcommingMovie(@RequestParam("pageNo") int pageUpNo) throws IOException {
		
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&page="+pageUpNo+"&sort_by=popularity.desc")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcyMDA2Mjc5Ni41OTIxNDksInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WfXqF4gZs0s7v7N9TyGhAUHP_ut6LgIEjSs_Bge8vH0")
		  .build();

		try (Response response = client.newCall(request).execute()) {
	            // 응답 본문 추출
	            okhttp3.ResponseBody responseBody = response.body();
	            if (responseBody != null) {
	                return responseBody.string();
	            } else {
	                return "{}"; // 응답 본문이 없는 경우 빈 JSON 객체 반환
	            }
	        }
	}
	
	@GetMapping(value="details", produces="application/json; charset=UTF-8")
	public String getDetails(@RequestParam("movie_id") int movieId) throws IOException {
		
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/"+ movieId +"?language=ko-KR")
		  .get()
		  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcyMDA2Mjc5Ni41OTIxNDksInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WfXqF4gZs0s7v7N9TyGhAUHP_ut6LgIEjSs_Bge8vH0")
		  .addHeader("accept", "application/json")
		  .build();

		try (Response response = client.newCall(request).execute()) {
	            // 응답 본문 추출
	            okhttp3.ResponseBody responseBody = response.body();
	            if (responseBody != null) {
	                return responseBody.string();
	            } else {
	                return "{}"; // 응답 본문이 없는 경우 빈 JSON 객체 반환
	            }
	        }
	}
	
	
	@GetMapping(value="rating", produces="application/json; charset=UTF-8")
	public String getRatings(@RequestParam("movie_id") int movieId) throws IOException {
		
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/"+ movieId +"/release_dates")
		  .get()
		  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcyMDA2Mjc5Ni41OTIxNDksInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WfXqF4gZs0s7v7N9TyGhAUHP_ut6LgIEjSs_Bge8vH0")
		  .addHeader("accept", "application/json")
		  .build();

		try (Response response = client.newCall(request).execute()) {
	            // 응답 본문 추출
	            okhttp3.ResponseBody responseBody = response.body();
	            if (responseBody != null) {
	                return responseBody.string();
	            } else {
	                return "{}"; // 응답 본문이 없는 경우 빈 JSON 객체 반환
	            }
	        }
	}
	
	@GetMapping(value="credits", produces="application/json; charset=UTF-8")
	public String getCredits(@RequestParam("movie_id") int movieId) throws IOException {
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/"+ movieId +"/credits?language=ko-KR")
		  .get()
		  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcyMDA2Mjc5Ni41OTIxNDksInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WfXqF4gZs0s7v7N9TyGhAUHP_ut6LgIEjSs_Bge8vH0")
		  .addHeader("accept", "application/json")
		  .build();

		try (Response response = client.newCall(request).execute()) {
	            // 응답 본문 추출
	            okhttp3.ResponseBody responseBody = response.body();
	            if (responseBody != null) {
	                return responseBody.string();
	            } else {
	                return "{}"; // 응답 본문이 없는 경우 빈 JSON 객체 반환
	            }
	        }
	}
	
	@GetMapping(value="images", produces="application/json; charset=UTF-8")
	public String getImages(@RequestParam("movie_id") int movieId) throws IOException {
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/"+ movieId +"/images")
		  .get()
		  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcyMDA2Mjc5Ni41OTIxNDksInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WfXqF4gZs0s7v7N9TyGhAUHP_ut6LgIEjSs_Bge8vH0")
		  .addHeader("accept", "application/json")
		  .build();

		try (Response response = client.newCall(request).execute()) {
	            // 응답 본문 추출
	            okhttp3.ResponseBody responseBody = response.body();
	            if (responseBody != null) {
	                return responseBody.string();
	            } else {
	                return "{}"; // 응답 본문이 없는 경우 빈 JSON 객체 반환
	            }
	        }
	}
	
	
	@GetMapping(value = "movieDB", produces = "application/json; charset=UTF-8")
	public String getMovieDB() {
		 
		 List<Integer> movieIdList = movieService.getMovieIdList();
		 
		 return new Gson().toJson(movieIdList);
    }
	
	
	
	
	@PostMapping(value="movieInsert", produces = "application/json; charset=UTF-8")
	public ResponseEntity<Message> save(@RequestBody Movie movie) {
		
		int result = movieService.save(movie);
		if (result == 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Message.builder()
															 .message("추가안됨")
															 .build());
        }

		Message responseMsg = Message.builder().data("영화목록 추가에 성공했습니다")
											   .message("서비스요청성공")
											   .build();

        return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	
	@GetMapping(value = "movieEnrollList", produces = "application/json; charset=UTF-8")
	public ResponseEntity<Message> getMovieList() {
		 
		 List<Movie> movieList = movieService.getMovieList();
		 
		 if(movieList.isEmpty()) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND)
									 .body(Message.builder()
										 .message("조회결과존재없음")
										 .build());
			}
			
			Message responseMsg = Message.builder()
										 .data(movieList)
										 .message("조회성공")
										 .build();
		 
		 return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
    }
	
	@DeleteMapping("{movieCode}")
	public ResponseEntity<Message> deleteById(@PathVariable int movieCode) {
		int result = movieService.delete(movieCode);
		
		if(result == 0) {
			return ResponseEntity.status(HttpStatus.OK).body(Message.builder()
																	.message("게시글 없음")
																	.build());
		}
		Message responseMsg = Message.builder().data("삭제성공!").message("서비스처리성공").build();
		
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
		
}
