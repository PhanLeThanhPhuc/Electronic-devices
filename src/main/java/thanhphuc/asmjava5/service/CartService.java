package thanhphuc.asmjava5.service;

import java.util.Collection;

import thanhphuc.asmjava5.dto.CartDTO;

public interface CartService {

	void addCart(String idProduct);

	Collection<CartDTO> getProduct();

	Double getAmount();

	void deleteProduct(String idProduct);

	void deleteAllProduct();

	void sumQty(String idProduct, int qty);
	
	Long saveOrder(String province, String district, String country);
	
	int countCart();
}
