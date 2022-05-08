package three.aws.wo.user.vo;

import lombok.Data;

@Data
public class BasketVO {
	private int b_seq;
	private String b_code;
	private String u_id;
	private String si_code;
	private String m_code;
	private String b_quantity;
	private String ob_code;
	private int b_total_price;
	
	//�ܷ�Ű�� �������� �κ�(menu ���̺�)
	private String m_img_file; //m_code 
	private int m_price;
	private String m_name;
	
	//�ܷ�Ű�� store_info ���̺�
	private String si_name;
	private String si_loc;
	private String si_addr_road;
	private String si_addr_detail;
	
}
