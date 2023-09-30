package thanhphuc.asmjava5.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
//@AllArgsConstructor
@Getter
@Setter
@Entity
public class OrderStatistics implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	String status;
	
	long count;

	public OrderStatistics(String status, long count) {
//		super();
		this.status = status;
		this.count = count;
	}
}
