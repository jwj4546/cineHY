package com.hy.myapp.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.product.model.service.ProductService;
import com.hy.myapp.product.model.vo.ProductVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {

	private final ProductService productService;
	
	@GetMapping("productlist")
	public String forwarding(Model model) {
		
		List<ProductVO> productList = productService.findAll();
		model.addAttribute("list", productList);
		return "product/list";
	}
	
	@GetMapping("productForm")
	public String productForwarding() {
		return "product/saveForm";
	}
	
	@PostMapping("save")
	public String save(ProductVO productVO,
							  HttpSession session,
							  Model model,
							  MultipartFile upfile) {
			
		productVO.setProductImage(upfile.getOriginalFilename());
		productVO.setChangeImage(saveFile(upfile, session));
		
		if(productService.save(productVO) > 0) {
			session.setAttribute("alertMsg", "상품 추가 성공~~");
			return "redirect:productlist";
		} else {
			model.addAttribute("alertMsg", "상품 추가 실패...");
			return "product/saveForm";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
			
			String productImage = upfile.getOriginalFilename();
			
			String ext = productImage.substring(productImage.lastIndexOf("."));
			
			int num = (int)(Math.random() * 900) + 100;
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
			
			
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			String changeImage = "HY_" + currentTime + "_" + num + ext;
			
			try {
				upfile.transferTo(new File(savePath + changeImage));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "resources/uploadFiles/" + changeImage;
		}
	
	@GetMapping("product-detail")
	public ModelAndView findById(int productId,
											  ModelAndView mv) {
		
		mv.addObject("product", productService.findById(productId)).setViewName("product/detail");
		return mv;
	}
	
}
