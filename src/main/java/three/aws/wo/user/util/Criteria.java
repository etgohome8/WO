package three.aws.wo.user.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	   
	   private int pageNum; // ������ ��ȣ
	   private int amount; // �������� �Խù� ��
	   
	   public Criteria() {
	      // �⺻ �����ڸ� ���ؼ� �⺻�� 1������, 10�������� �����ؼ� ó��
	      this(1, 3);
	   }

	   public Criteria(int pageNum, int amount) {
	      super();
	      this.pageNum = pageNum;
	      this.amount = amount;
	   }
}
