package thanhphuc.asmjava5.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name ="product")
public class Product implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name ="product_id")
	private String id;
	
	@Column(name ="product_name")
	private String name;
	
	@Column(name ="product_img")
	private String img;
	
	@Column(name ="description")
	private String description;
	
	@Column(name ="qty")
	private int qty ;
	
	@Column(name ="price")
	private double price ;
	
	@Column(name ="discount")
	private double discount ;
	
	@Column(name ="sold_quantity")
	private int soidQuantity ;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	Category category;
	
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails ;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	Brand brand;

}

