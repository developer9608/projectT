package com.korea.k1.product;

import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class ProductVO {
	
	 private int productId;
	 private String productName;
	 private int productPrice;
	 private String productDesc;
	 private MultipartFile productImg;
	 private String productImgStr;
	 private Date productDate;
}
