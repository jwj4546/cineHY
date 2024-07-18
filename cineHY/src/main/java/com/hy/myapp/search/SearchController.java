package com.hy.myapp.search;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	@GetMapping("multiSearch")
    public String getSearchResult(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("keyword", keyword);
        return "search/searchResult";
    }

}
