package thanhphuc.asmjava5.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thanhphuc.asmjava5.dto.BrandDTO;
import thanhphuc.asmjava5.entity.Brand;
import thanhphuc.asmjava5.repository.BrandRepository;
import thanhphuc.asmjava5.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	BrandRepository brandRepository;
	
	@Override
	public List<BrandDTO> findBrandByCategory(int idCategory) {
		return brandRepository.findBrandByCategory(idCategory);
	}

	@Override
	public List<Brand> findAllBrand() {
		return brandRepository.findAll();
	}

	@Override
	public Brand saveBrand(Brand brand) {
		return brandRepository.save(brand);
	}

	@Override
	public Brand findById(int idBrand) {
		return brandRepository.findById(idBrand).get();
	}

}
