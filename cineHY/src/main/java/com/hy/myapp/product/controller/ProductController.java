package com.hy.myapp.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.member.model.vo.Member;
import com.hy.myapp.product.model.service.ProductService;
import com.hy.myapp.product.model.vo.ProductVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
public class ProductController {

	private final ProductService productService;
	
	@GetMapping("productlist")
	public ModelAndView forwarding(HttpServletRequest request,
									  			ModelAndView mv) {
		
		// 상품 리스트 조회 시 session의 id 값을 받아 장바구니 품목 값 가져오는 process
		HttpSession session = request.getSession();
		Member userId = (Member)(session.getAttribute("loginUser"));
		
		// login id가 있을 시 장바구니 품목 개수도 함께 조회
		if(userId != null) {
			String id = (String)userId.getUserId();
			
			List<ProductVO> productList = productService.findAll();
			int cartCount = productService.findCount(id);
			
			mv.addObject("count", cartCount);
			mv.addObject("list", productList).setViewName("product/list");
		} else {
			List<ProductVO> productList = productService.findAll();
			mv.addObject("list", productList).setViewName("product/list");
		}
		return mv;
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
											  ModelAndView mv,
											  HttpServletRequest request) {
		
		// 상품 조회 시 session의 id 값을 받아 장바구니 품목 값 가져오는 process
				HttpSession session = request.getSession();
				Member userId = (Member)(session.getAttribute("loginUser"));
				
				// login id가 있을 시 장바구니 품목 개수도 함께 조회
				if(userId != null) {
					String id = (String)userId.getUserId();
					
					int cartCount = productService.findCount(id);
					
					mv.addObject("count", cartCount);
					mv.addObject("product", productService.findById(productId)).setViewName("product/detail");
				} else {
					mv.addObject("product", productService.findById(productId)).setViewName("product/detail");
				}
		
		return mv;
	}
	
	@PostMapping("updateForm")
	public ModelAndView updateForm(ModelAndView mv,
													int productId) {
		mv.addObject("product", productService.findById(productId)).setViewName("product/updateForm");
		return mv;
	}
	
	@PostMapping("update")
	public String update(ProductVO productVO,
								 MultipartFile reUpFile,
								 HttpSession session) {
		if(!reUpFile.getOriginalFilename().equals("")) {
			
			productVO.setProductImage(reUpFile.getOriginalFilename());
			productVO.setChangeImage(saveFile(reUpFile, session));
		}
		
		if(productService.update(productVO) > 0) {
			session.setAttribute("alertMsg", "상품 수정 성공~");
			return "redirect:product-detail?productId="+productVO.getProductId();
		} else {
			session.setAttribute("errorMsg", "상품 수정 실패~");
			return "product/updateForm";
		}
	}
	
	@PostMapping("delete")
	public String deleteById(int productId,
									  String filePath,
									  HttpSession session,
									  Model model) {
		if(productService.delete(productId) > 0) {
			if(!"".equals(filePath)) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "상품 삭제 성공");
			return "redirect:productlist";
		} else {
			model.addAttribute("errorMsg", "상품 삭제 실패");
			return "redirect:productlist";
		}
	}
}
