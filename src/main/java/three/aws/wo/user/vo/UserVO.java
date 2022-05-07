package three.aws.wo.user.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private int u_seq;
	private String u_id;
	private String u_password;
	private String u_type;
	private String u_name;
	private String u_nickname;
	private String u_tel;
	private String u_email;
	private String u_birthday;
	private boolean u_sms_usable;		//���� ���� ����
	private boolean u_email_usable;		//�̸��� ���� ����
	private int u_point;				//���� ����Ʈ
	private boolean u_status;			//Ȱ�� ����
	private Date u_regdate;
	private int u_grade;			//���ϴ� ģ������ ���� ��
	
	 //��й�ȣ Ȯ�� ��� ���̴���? �̷��� VO ���� �ϴ°� �ƴ�!!
    public boolean matchPassword(String u_password) {
        return this.u_password.equals(u_password);
    }

}
