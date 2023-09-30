package thanhphuc.asmjava5.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class BrandDTO {
	
	@Id	
	private int id;
	
	private String name;
	
	private String img;
}
