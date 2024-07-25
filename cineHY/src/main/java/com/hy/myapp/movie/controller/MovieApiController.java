package com.hy.myapp.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	private static final String API_URL = "https://api.themoviedb.org/3/movie/";
    private static final String BEARER_TOKEN = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjU2OTQwNzBmNWI4MzJmMjVkYjRjNjZmY2JmZWExNSIsIm5iZiI6MTcyMDA2Mjc5Ni41OTIxNDksInN1YiI6IjY2N2NhYmNlMzQ3ZWM1MzNhYWViNGI3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WfXqF4gZs0s7v7N9TyGhAUHP_ut6LgIEjSs_Bge8vH0"; // 여기에 실제 Bearer Token을 입력하세요
    private static final int TOTAL_PAGES = 10; // 가져올 페이지 수
	
    @GetMapping(value = "nowPlaying", produces = "application/json; charset=UTF-8")
    public String getNowPlayingMovie() throws IOException {
        OkHttpClient client = new OkHttpClient();
        List<String> allMoviesResponses = new ArrayList<>();

        for (int pageNumber = 1; pageNumber <= TOTAL_PAGES; pageNumber++) {
            Request request = new Request.Builder()
                    .url(API_URL + "now_playing?language=ko-KR&region=KR&page=" + pageNumber + "&include_image_language=en,null&sort_by=popularity.desc")
                    .get()
                    .addHeader("accept", "application/json")
                    .addHeader("Authorization", BEARER_TOKEN)
                    .build();

            try (Response response = client.newCall(request).execute()) {
                okhttp3.ResponseBody responseBody = response.body();
                if (responseBody != null) {
                    allMoviesResponses.add(responseBody.string());
                }
            }
        }

        // 각 응답을 하나의 JSON 배열로 결합
        String combinedResponse = "[" + String.join(",", allMoviesResponses) + "]";
        return combinedResponse;
    }
	
	@GetMapping(value="upComming", produces="application/json; charset=UTF-8")
	public String getUpcommingMovie() throws IOException {
		
		OkHttpClient client = new OkHttpClient();
        List<String> allMoviesResponses = new ArrayList<>();

        for (int pageNumber = 1; pageNumber <= TOTAL_PAGES; pageNumber++) {
            Request request = new Request.Builder()
                    .url(API_URL + "upcoming?language=ko-KR&region=KR&page=" + pageNumber+"")
                    .get()
                    .addHeader("accept", "application/json")
                    .addHeader("Authorization", BEARER_TOKEN)
                    .build();

            try (Response response = client.newCall(request).execute()) {
                okhttp3.ResponseBody responseBody = response.body();
                if (responseBody != null) {
                    allMoviesResponses.add(responseBody.string());
                }
            }
        }

        // 각 응답을 하나의 JSON 배열로 결합
        String combinedResponse = "[" + String.join(",", allMoviesResponses) + "]";
        return combinedResponse;
    }
	
	
	@GetMapping(value="nowPlaying/Admin", produces="application/json; charset=UTF-8")
	public String getNowPlayingMovieAdmin(@RequestParam("pageNo") int pageNo) throws IOException {
		
		//OkHttp 클라이언트 객체생성
		OkHttpClient client = new OkHttpClient();

		//get 요청
		Request request = new Request.Builder()
		  .url( API_URL + "now_playing?append_to_response=images"
		  				+ "&language=ko-KR"
		  				+ "&region=KR"
		  				+ "&page="+pageNo+""
		  				+ "&sort_by=popularity.desc"
		  				+ "&include_image_language=en,null")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("Authorization", BEARER_TOKEN)
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
	
	@GetMapping(value="upComming/Admin", produces="application/json; charset=UTF-8")
	public String getUpcommingMovieAdmin(@RequestParam("pageNo") int pageUpNo) throws IOException {
		
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&region=KR&page="+pageUpNo+"&sort_by=popularity.desc")
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
		  .url(API_URL + movieId +"?language=ko-KR")
		  .get()
		  .addHeader("Authorization", BEARER_TOKEN)
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
		  .url(API_URL + movieId +"/release_dates")
		  .get()
		  .addHeader("Authorization", BEARER_TOKEN)
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
		  .url(API_URL + movieId +"/credits?language=ko-KR")
		  .get()
		  .addHeader("Authorization", BEARER_TOKEN)
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
		  .url(API_URL + movieId +"/images")
		  .get()
		  .addHeader("Authorization", BEARER_TOKEN)
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
	
	@PutMapping(value = "delete", produces = "application/json; charset=UTF-8")
	public ResponseEntity<Message> delete(@RequestBody Movie movie) {
			
		int result = movieService.delete(movie);
		if (result == 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Message.builder()
															 .message("삭제안됨")
															 .build());
        }

		Message responseMsg = Message.builder().data("영화목록 삭제에 성공했습니다")
											   .message("서비스요청성공")
											   .build();

        return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	@GetMapping(value="searchMovie", produces="application/json; charset=UTF-8")
	public String searchMovie(@RequestParam("keyword") String query) throws IOException {
		
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://api.themoviedb.org/3/search/movie?query="+ query +"&include_adult=false&language=ko-KR&primary_release_year=2024&page=1&region=KR")
		  .get()
		  .addHeader("Authorization", BEARER_TOKEN)
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
	
	@GetMapping(value="search", produces="application/json; charset=UTF-8")
	public String search(@RequestParam("keyword") String query) throws IOException {
		
		OkHttpClient client = new OkHttpClient();
		List<String> allMoviesResponses = new ArrayList<>();

		for (int pageNumber = 1; pageNumber <= 3; pageNumber++) {
			Request request = new Request.Builder()
			  .url("https://api.themoviedb.org/3/search/multi?query="+ query +"&include_adult=false&language=ko-KR&page=" + pageNumber + "&region=KR")
			  .get()
			  .addHeader("Authorization", BEARER_TOKEN)
			  .addHeader("accept", "application/json")
			  .build();

			try (Response response = client.newCall(request).execute()) {
                okhttp3.ResponseBody responseBody = response.body();
                if (responseBody != null) {
                    allMoviesResponses.add(responseBody.string());
                }
            }
        }

        // 각 응답을 하나의 JSON 배열로 결합
        String combinedResponse = "[" + String.join(",", allMoviesResponses) + "]";
        return combinedResponse;
    }
	
}
