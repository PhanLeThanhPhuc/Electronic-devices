package thanhphuc.asmjava5.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name ="delivery_address")
public class DeliveryAddress implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "delivery_address_id")
	private long id;
	
	@Column(name = "province")
	private String province;
	
	@Column(name = "district")
	private String district;
	
	@Column(name = "country")
	private String country;
	
	@Column(name = "apartment")
	private String apartment;
	
	@ManyToOne 
	@JoinColumn(name ="user_id")
	User user;
}
