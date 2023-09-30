package thanhphuc.asmjava5.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import thanhphuc.asmjava5.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	
}
