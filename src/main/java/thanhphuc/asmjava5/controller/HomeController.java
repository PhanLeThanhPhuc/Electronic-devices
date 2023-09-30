package thanhphuc.asmjava5.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

import thanhphuc.asmjava5.service.CartService;
import thanhphuc.asmjava5.service.CategoryService;
import thanhphuc.asmjava5.service.OrderDetailService;
import thanhphuc.asmjava5.service.ProductService;


//@RequestMapping("/index")
@Controller
public class HomeController {

	@Autowired
	HttpServletRequest httpServletRequest;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@GetMapping("/home")
	public String Home(Model model) {
		model.addAttribute("listProductTop10", orderDetailService.findAllProductTop10());
		model.addAttribute("listProduct", productService.getAllProduct());
		model.addAttribute("listCategory", categoryService.getAllCategory());
		model.addAttribute("countCart",cartService.countCart());
		return "homePage";
	}
	
	@GetMapping("/listcategory")
	public String listCategory() {
		return "listCategory";
	}
	
	@GetMapping("/testuser")
	public String test() {
		return "user_order";
	}
}
