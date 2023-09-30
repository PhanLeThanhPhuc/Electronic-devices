package thanhphuc.asmjava5.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import thanhphuc.asmjava5.entity.DeliveryAddress;

@Repository
public interface DeliveryAddressRepository extends JpaRepository<DeliveryAddress, Long>{
	
	@Query("SELECT d FROM DeliveryAddress d WHERE d.user.id=:iduser")
	DeliveryAddress findByIdDeliveryAddress(@Param("iduser") String idUser);
	
}
