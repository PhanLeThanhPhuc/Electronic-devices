package thanhphuc.asmjava5.service;

import java.util.List;

import thanhphuc.asmjava5.entity.Category;

public interface CategoryService {
	
	List<Category> getAllCategory();
	
	void saveCategory(Category category);
	
	Category findById(int id);
}
