package three.aws.wo.user.util;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
 
@Entity
@Getter
@Setter
@ToString
public class LoginCommand {
    @Id
    @NotEmpty(message="���̵� �Է����ּ���.")
    private String u_id;
 
    @NotEmpty(message="��й�ȣ�� �Է����ּ���.")
    private String u_password;
    private boolean rememberId;
    

}