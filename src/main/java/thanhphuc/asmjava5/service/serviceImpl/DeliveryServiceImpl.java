package thanhphuc.asmjava5.service.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thanhphuc.asmjava5.entity.DeliveryAddress;
import thanhphuc.asmjava5.repository.DeliveryAddressRepository;
import thanhphuc.asmjava5.service.DeliveryAddressService;


@Service
public class DeliveryServiceImpl implements DeliveryAddressService{

	@Autowired
	DeliveryAddressRepository deliveryAddressRepository;

	@Override
	public DeliveryAddress findByIdDeliveryAddress(String idUser) {
		return deliveryAddressRepository.findByIdDeliveryAddress(idUser);
	}
	
}
