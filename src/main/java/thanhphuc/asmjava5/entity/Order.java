package thanhphuc.asmjava5.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name ="Orders")
public class Order implements Serializable {
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Order_id")
	private long id;
	
	@Column(name="Order_date")
	@Temporal(TemporalType.DATE)
	private Date date = new Date();
	
	@Column(name="total")
	private double total;
	
//	X: Dang xu li, N: Da nhan hang, H:Huy
	@Column(name="status")
	private String status;
	
	@Column(name="province")
	private String province;
	
	@Column(name="district")
	private String district;
	
	@Column(name="ward")
	private String ward;
	
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	User user;
}
