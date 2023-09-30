package thanhphuc.asmjava5.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import thanhphuc.asmjava5.dto.OrderStatistics;
import thanhphuc.asmjava5.dto.TotalDate;
import thanhphuc.asmjava5.dto.TotalYear;
import thanhphuc.asmjava5.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
	
	@Query("select MAX(o.id) +1 from Order o")
	Long selectMaxIdOrder();
	
	@Query("select MAX(o.id) from Order o")
	Long selectIdOrder();
	
	@Query("select o from Order o where o.user.id=:userid order by o.id desc")
	List<Order> findByOrderUserId(@Param("userid") String userid);
	
	@Query("select o.total from Order o where o.id=:orderid ")
	double findTotalByIdOrder(@Param("orderid") Long id);
	
	@Query("select o from Order o where o.status = 'X' ")
	List<Order> findByOrderStatusX();
	
	@Query("select o from Order o where o.status = 'N' ")
	List<Order> findByOrderStatusN();
	
	@Query("select o from Order o where o.status = 'H' ")
	List<Order> findByOrderStatusH();
	
	@Query("select o from Order o where o.date between :min and :max and o.status like :status order by o.id desc")
	Page<Order> findByOrderDate(@Param("min") Date minDate, @Param("max") Date maxDate, @Param("status") String status, Pageable pageable);
	
	@Query("select new TotalYear(YEAR(o.date), sum(o.total)) from Order o where o.status ='N' group by YEAR(o.date) ")
	List<TotalYear> getTotalYear();
	
	@Query("select new OrderStatistics(o.status, count(o.status)) from Order o group by o.status ")
	List<OrderStatistics> getStatusOrder();
	
	@Query("select o from Order o where o.id =:idOrder")
	Page<Order> findByIdKeyWord(@Param("idOrder") Long id,Pageable pageable);
	
	@Query("select new TotalDate(o.date, sum(o.total)) from Order o where o.date between :date1 and :date2 and o.status = 'N' group by o.date")
	List<TotalDate> findTotalByDate(@Param("date1") Date date1, @Param("date2") Date date2);
}
