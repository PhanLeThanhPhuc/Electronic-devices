package thanhphuc.asmjava5.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Users")
public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "user_id")
	private String id;
	
	@Column(name = "user_name")
	private String name;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "role")
	private boolean role ;;
	
	@Column(name = "is_Active")
	private boolean isActive ;;
	
	@Column(name = "code")
	private String code;
	
	@OneToMany(mappedBy = "user")
	List<DeliveryAddress> deliveryAddresses;
	
	@OneToMany(mappedBy = "user")
	List<Order> orders;
}
