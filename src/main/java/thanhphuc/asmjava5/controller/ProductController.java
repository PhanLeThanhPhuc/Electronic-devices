package thanhphuc.asmjava5.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import thanhphuc.asmjava5.been.ParamService;
import thanhphuc.asmjava5.been.SessionService;
import thanhphuc.asmjava5.service.BrandService;
import thanhphuc.asmjava5.service.CartService;
import thanhphuc.asmjava5.service.CategoryService;
import thanhphuc.asmjava5.service.ProductService;
import thanhphuc.asmjava5.service.serviceImpl.ProductServiceImpl;

@Controller
public class ProductController {

	
//	@Autowired
//	ProductService productService;

	private final ProductService productService;

//	@Autowired
	public ProductController(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	CartService cartService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	BrandService brandService;

	@Autowired
	ParamService paramService;

	@Autowired
	SessionService sessionService;

	@GetMapping("/productdetail")
	public String productDetail(@RequestParam("productId") String productId, @RequestParam("categoryId") int categoryId,
			Model model) {
		model.addAttribute("productCategoryId", productService.findProductDetailType(categoryId));
		model.addAttribute("productDetail", productService.findById(productId));
		model.addAttribute("countCart", cartService.countCart());
		return "product_detail";
	}

	@GetMapping("/product-all-shareandpage")
	public String productAll1(Model model, @RequestParam("keyword") Optional<String> keyword,
			@RequestParam("p") Optional<Integer> p) {
		model.addAttribute("productAll", productService.findByProductKeyWordAndPage(keyword, p));
		model.addAttribute("categoryAll", categoryService.getAllCategory());
		model.addAttribute("countCart", cartService.countCart());
		return "productall";
	}

	@GetMapping("/productcategory")
	public String viewProductCategory(@RequestParam("id") int idCategory, Model model,
			@RequestParam("price-min") Optional<Double> min, @RequestParam("price-max") Optional<Double> max,
			@RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> s) {
		model.addAttribute("s", s.isPresent() ? s.get() : "asc");
		model.addAttribute("minPriceRange", (int) (productService.findMinPriceProduct(idCategory) / 1000));
		model.addAttribute("maxPriceRange", (int) (productService.findMaxPriceProduct(idCategory) / 1000));
		model.addAttribute("brandByIdCategory", brandService.findBrandByCategory(idCategory));
		model.addAttribute("productByCategory", productService.findProductByIdCategory(idCategory, min, max, p, s));
		model.addAttribute("idCategory", idCategory);
		model.addAttribute("countCart", cartService.countCart());
		return "productcategory";
	}

	@PostMapping("/productcategory")
	public String postProductCategory(@RequestParam("id") int idCategory, Model model,
			@RequestParam("price-min") Optional<Double> min, @RequestParam("price-max") Optional<Double> max,
			@RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> s) {
		model.addAttribute("minPriceRange", (int) (productService.findMinPriceProduct(idCategory) / 1000));
		model.addAttribute("maxPriceRange", (int) (productService.findMaxPriceProduct(idCategory) / 1000));
		model.addAttribute("brandByIdCategory", brandService.findBrandByCategory(idCategory));
		model.addAttribute("productByCategory", productService.findProductByIdCategory(idCategory, min, max, p, s));
		model.addAttribute("idCategory", idCategory);
		model.addAttribute("min", min.isPresent() ? min.get() : "");
		model.addAttribute("max", max.isPresent() ? max.get() : "");
		model.addAttribute("s", s.isPresent() ? s.get() : "asc");
		model.addAttribute("countCart", cartService.countCart());
		return "productcategory";
	}

	@GetMapping("/productbrand")
	public String getProductBrand(@RequestParam("idBrand") int idBrand, @RequestParam("idCategory") int idCategory,
			@RequestParam("price-min") Optional<Double> min, @RequestParam("price-max") Optional<Double> max,
			Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("sort") Optional<String> s) {
		model.addAttribute("minPriceRange",
				(int) (productService.findMinPriceProductByBrand(idCategory, idBrand) / 1000));
		model.addAttribute("maxPriceRange",
				(int) (productService.findMaxPriceProductByBrand(idCategory, idBrand) / 1000));
		model.addAttribute("productByBrand", productService.findProductByIdBrand(idBrand, idCategory, min, max, p, s));
		model.addAttribute("idCategory", idCategory);
		model.addAttribute("idBrand", idBrand);
		model.addAttribute("s", s.isPresent() ? s.get() : "asc");
		model.addAttribute("countCart", cartService.countCart());
		return "productBrand";
	}

	@PostMapping("/productbrand")
	public String postProductBrand(@RequestParam("idBrand") int idBrand, @RequestParam("idCategory") int idCategory,
			Model model, @RequestParam("price-min") Optional<Double> min,
			@RequestParam("price-max") Optional<Double> max, @RequestParam("p") Optional<Integer> p,
			@RequestParam("sort") Optional<String> s) {
		model.addAttribute("minPriceRange",
				(int) (productService.findMinPriceProductByBrand(idCategory, idBrand) / 1000));
		model.addAttribute("maxPriceRange",
				(int) (productService.findMaxPriceProductByBrand(idCategory, idBrand) / 1000));
		model.addAttribute("productByBrand", productService.findProductByIdBrand(idBrand, idCategory, min, max, p, s));
		model.addAttribute("idCategory", idCategory);
		model.addAttribute("idBrand", idBrand);
		model.addAttribute("min", min.isPresent() ? min.get() : "");
		model.addAttribute("max", max.isPresent() ? max.get() : "");
		model.addAttribute("s", s.isPresent() ? s.get() : "asc");
		model.addAttribute("countCart", cartService.countCart());
		return "productBrand";
	}

}
