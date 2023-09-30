package thanhphuc.asmjava5.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thanhphuc.asmjava5.dto.OrderDetailDTO;
import thanhphuc.asmjava5.dto.Top10;
import thanhphuc.asmjava5.repository.OrderDetailRepository;
import thanhphuc.asmjava5.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderDetailRepository orderDetailRepository;
	
	@Override
	public List<OrderDetailDTO> findByOrderDetailIdOrder(long idOrder) {
		return orderDetailRepository.findByOrderDetailIdOrder(idOrder);
	}

	@Override
	public List<thanhphuc.asmjava5.dto.RevenueByCategory> RevenueByCategory() {
		return orderDetailRepository.RevenueByCategory();
	}

	@Override
	public List<Top10> findAllProductTop10() {
		List<Top10> listTop10 = new ArrayList<>();
		int count = 0;
		for (Top10 list : orderDetailRepository.getTop10()) {
			if (count > 9) {
				break;
			}			
			listTop10.add(list);
			count++;
		}
		return listTop10;
	}
}
