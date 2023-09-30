package thanhphuc.asmjava5.service.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import thanhphuc.asmjava5.been.SessionService;
import thanhphuc.asmjava5.dto.OrderStatistics;
import thanhphuc.asmjava5.dto.TotalDate;
import thanhphuc.asmjava5.dto.TotalYear;
import thanhphuc.asmjava5.entity.Order;
import thanhphuc.asmjava5.repository.OrderRepository;
import thanhphuc.asmjava5.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	SessionService sessionService;

	@Override
	public List<Order> getAllOrder() {
		return orderRepository.findAll();
	}

	@Override
	public List<Order> findByOrderUserId(String userid) {
		return orderRepository.findByOrderUserId(userid);
	}

	@Override
	public Order findOrderById(Long idOrder) {
		return orderRepository.findById(idOrder).get();
	}

	@Override
	public Double findTotalByIdOrder(Long idOrder) {
		return orderRepository.findTotalByIdOrder(idOrder);
	}

	@Override
	public void SaveOrder(Order order) {
		orderRepository.save(order);
	}

	@Override
	public List<Order> findByOrderStatusX() {
		return orderRepository.findByOrderStatusX();
	}

	@Override
	public List<Order> findByOrderStatusN() {
		return orderRepository.findByOrderStatusN();
	}

	@Override
	public List<Order> findByOrderStatusH() {
		return orderRepository.findByOrderStatusH();
	}

	@Override
	public Page<Order> findAllOrder(Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		return orderRepository.findAll(pageable);
	}

	@Override
	public Page<Order> findByOrderDate(Optional<String> minDate, Optional<String> maxDate, Optional<String> status,
			Optional<Integer> p) {
		Date minDateConvert = null;
		Date maxDateConvert = null;
		Pageable pageable = null;
		String statusOrder = null;
		try {
			minDateConvert = minDate.isPresent() && !minDate.get().isEmpty()
					? new SimpleDateFormat("yyyy-MM-dd").parse(minDate.get())
					: new SimpleDateFormat("yyyy-MM-dd").parse("0001-01-01");
			maxDateConvert = maxDate.isPresent() && !maxDate.get().isEmpty()
					? new SimpleDateFormat("yyyy-MM-dd").parse(maxDate.get())
					: new SimpleDateFormat("yyyy-MM-dd").parse("9999-12-31");
			statusOrder = status.orElse("");
			pageable = PageRequest.of(p.orElse(0), 8);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderRepository.findByOrderDate(minDateConvert, maxDateConvert, "%" + statusOrder + "%", pageable);
	}

	@Override
	public List<TotalYear> getTotalYear() {
		return orderRepository.getTotalYear();
	}

	@Override
	public List<OrderStatistics> getStatusOrder() {
		List<OrderStatistics> listOrder = new ArrayList<>();
		orderRepository.getStatusOrder().forEach(list -> {
			OrderStatistics orderStatistics = new OrderStatistics();
			if (list.getStatus().equals("X")) {
				orderStatistics.setStatus("Đang xử lí");
				orderStatistics.setCount(list.getCount());
			} else if (list.getStatus().equals("N")) {
				orderStatistics.setStatus("Đã nhận hàng");
				orderStatistics.setCount(list.getCount());
			} else {
				orderStatistics.setStatus("Đã hủy");
				orderStatistics.setCount(list.getCount());
			}
			listOrder.add(orderStatistics);
		});
		return listOrder;
	}

	@Override
	public Page<Order> findByIdKeyWord(Optional<String> id, Optional<Integer> p) {

		String kwords = id.orElse(sessionService.get("keywords", ""));
		sessionService.get("keywords", kwords);
		long kwordsInt = Long.parseLong(kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		return orderRepository.findByIdKeyWord(kwordsInt, pageable);
	}

	@Override
	public List<TotalDate> findTotalByDate(Optional<String> date1, Optional<String> date2) {
		Date date = new Date();
		Date date1Convert =null;
		Date date2Convert = null;
		
		try {
			date1Convert = date1.isPresent() && !date1.isEmpty() 
					? new SimpleDateFormat("yyyy-MM-dd").parse(date1.get()): date;
			date2Convert = date2.isPresent() && !date1.isEmpty() 
					? new SimpleDateFormat("yyyy-MM-dd").parse(date2.get()): date;
		} catch (Exception e) {
			
		}
		return orderRepository.findTotalByDate(date1Convert, date2Convert);
	}
}
