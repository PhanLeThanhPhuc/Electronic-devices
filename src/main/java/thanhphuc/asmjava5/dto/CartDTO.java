package thanhphuc.asmjava5.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
	
	private String id;
	
	private String img;
	
	private String name;
	
	private int qty =1;
	
	private Double price;
	
}
