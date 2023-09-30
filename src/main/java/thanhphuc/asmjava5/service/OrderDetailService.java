package thanhphuc.asmjava5.service;

import java.util.List;

import thanhphuc.asmjava5.dto.OrderDetailDTO;
import thanhphuc.asmjava5.dto.RevenueByCategory;
import thanhphuc.asmjava5.dto.Top10;


public interface OrderDetailService {
	
	List<OrderDetailDTO> findByOrderDetailIdOrder(long idOrder);
	
	List<RevenueByCategory> RevenueByCategory();
	
	List<Top10> findAllProductTop10();
	
}
