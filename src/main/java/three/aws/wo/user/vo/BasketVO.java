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
	
	//�ܷ�Ű�� �������� �κ�
	private String m_img_file; //m_code menu ���̺�
	private int m_price;
	private String m_name;
	
}
