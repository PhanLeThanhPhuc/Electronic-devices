package thanhphuc.asmjava5.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import thanhphuc.asmjava5.entity.Product;

public interface ProductService {

	List<Product> getAllProduct();

	Product findById(String idProduct);

	List<Product> findAllProductRandom();

//	List<Product> findProductByIdCategory(int idCategory);
	
	Page<Product> findProductByIdCategory(int idCategory,Optional<Double> min, Optional<Double> max,Optional<Integer> p,Optional<String> s);

	Page<Product> findProductByIdBrand(int idBrand, int idCategory,Optional<Double> min, Optional<Double> max, Optional<Integer> p, Optional<String> s);

	void saveProduct(Product product);

	Page<Product> findAllPageProduct(Optional<Integer> p);
	
	Page<Product> findByProductKeyWordAndPage(Optional<String> keyWord, Optional<Integer> p);
	
	Double findMinPriceProduct(int idCategory);
	
	Double findMaxPriceProduct(int idCategory);
	
	Double findMaxPriceProductByBrand(int idCategory, int idBrand);
	
	Double findMinPriceProductByBrand(int idCategory, int idBrand);
	
	List<Product> findProductDetailType( int idCategory);
	
//	List<Product> findAllProductTop10();
	
	Page<Product> getAllProductPage(Optional<Integer> p);
	
	Page<Product> getAllProductShare(Optional<String> key,Optional<Integer> p);
}
