package thanhphuc.asmjava5.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import thanhphuc.asmjava5.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	
	User findByIdAndPassword(String id, String password);
	
	@Query("select u from User u where u.id =:id")
	User findIdUserById(@Param("id") String idUser);
	
	@Query("select u from User u where u.id =:id")
	User findByUserForgotPass(@Param("id") String idUser);
	
	@Query("select u from User u where u.code =:token")
	User findUserByToken(@Param("token") String token);
	
	@Query("select u from User u JOIN u.orders o where o.id =:idOrder")
	User findUserByOrderId(@Param("idOrder") long id);
	
	@Query("select u from User u where u.name like ?1 or u.phone like ?1 or u.email like ?1")
	Page<User> findUserByKeyWord(String keyword, Pageable pageable);
}

