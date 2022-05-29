package three.aws.wo.user.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CriteriaStore {
	   
	   private int pageNum; // ������ ��ȣ
	   private int amount; // �������� �Խù� ��
	   
	   public CriteriaStore() {
	      // �⺻ �����ڸ� ���ؼ� �⺻�� 1������, 10�������� �����ؼ� ó��
	      this(1, 10);
	   }

	   public CriteriaStore(int pageNum, int amount) {
	      super();
	      this.pageNum = pageNum;
	      this.amount = amount;
	   }
}