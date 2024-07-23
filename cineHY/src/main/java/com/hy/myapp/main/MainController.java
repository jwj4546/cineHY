package com.hy.myapp.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hy.myapp.product.model.service.ProductService;
import com.hy.myapp.product.model.vo.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("api")
public class MainController {
	
	@Autowired
    private ProductService productService;

    @GetMapping("/products")
    public List<ProductVO> getProducts() {
        return productService.findAll();
    }
}
