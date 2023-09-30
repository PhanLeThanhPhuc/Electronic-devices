package thanhphuc.asmjava5.service;

import java.util.List;

import thanhphuc.asmjava5.dto.BrandDTO;
import thanhphuc.asmjava5.entity.Brand;


public interface BrandService {
	
	List<BrandDTO> findBrandByCategory(int idCategory);
	
	List<Brand> findAllBrand();
	
	Brand saveBrand(Brand brand);
	
	Brand findById(int idBrand);
}
