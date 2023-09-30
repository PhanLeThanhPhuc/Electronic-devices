package thanhphuc.asmjava5.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thanhphuc.asmjava5.entity.Category;
import thanhphuc.asmjava5.repository.CategoryRepository;
import thanhphuc.asmjava5.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository;
	
	@Override
	public List<Category> getAllCategory() {	
		return categoryRepository.findAll() ;
	}

	@Override
	public void saveCategory(Category category) {
		categoryRepository.save(category);
	}

	@Override
	public Category findById(int id) {
		return categoryRepository.findById(id).get();
	}

}
