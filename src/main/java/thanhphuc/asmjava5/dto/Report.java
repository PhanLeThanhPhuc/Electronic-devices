package thanhphuc.asmjava5.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;



@Entity
public class Report implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	Serializable group;
	Double sum;
	Long count;
	
	
	
	public Report() {
//		super();
	}



	public Report(Serializable group, Double sum, Long count) {
//		super();
		this.group = group;
		this.sum = sum;
		this.count = count;
	}
	
	
}
