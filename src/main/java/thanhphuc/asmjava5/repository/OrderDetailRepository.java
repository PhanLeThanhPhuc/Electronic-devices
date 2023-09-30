package thanhphuc.asmjava5.repository;

import java.util.List;

//import org.hibernate.transform.ResultTransformer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import thanhphuc.asmjava5.dto.OrderDetailDTO;
import thanhphuc.asmjava5.entity.OrderDetail;
import thanhphuc.asmjava5.dto.RevenueByCategory;
import thanhphuc.asmjava5.dto.Top10;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

//	@Query("select o from OrderDetail o where o.order.id=:idorder ")
//	List<OrderDetail> findByOrderDetailIdOrder(@Param("idorder") long idOrder);	
	
	@Query("select new OrderDetailDTO(o.id,o.product.name, o.product.img, o.product.price, o.quantity, o.total, o.order.province,  o.order.district,  o.order.ward  ) from OrderDetail o where o.order.id=:idorder")
	List<OrderDetailDTO> findByOrderDetailIdOrder(@Param("idorder") long idOrder); 
	
	@Query("select new RevenueByCategory(d.product.category.name, sum(d.price*d.quantity), sum(d.quantity)) from OrderDetail d group by d.product.category.name")
	List<RevenueByCategory> RevenueByCategory();
	
	@Query("SELECT new Top10(o.product, sum(o.quantity)) FROM OrderDetail o GROUP BY o.product ORDER BY sum(o.quantity) DESC ")
	List<Top10> getTop10();
}
