package three.aws.wo.admin.vo;

import lombok.Data;

@Data
public class PointVO {
	private int pt_seq;
	private String u_id;
	private String pt_regdate;
	private String pt_type;
	private String pt_description;
	private String pt_handler;
	private int pt_amount;
	//user�� ���ο�
	private int u_point;
	private String u_name;
	//�ý��� ����
	private String point_use;
	private String point_percentage;
}
