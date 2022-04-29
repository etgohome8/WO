 package three.aws.wo.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.aws.wo.admin.service.AUserService;
import three.aws.wo.user.vo.UserVO;

@Controller
public class AdminUserController {
   @Resource
   private AUserService aUserService;

   @RequestMapping("/user_mng.admin")
   public String userList(UserVO vo, Model model) {
      List<UserVO> userList =aUserService.userList();
      System.out.println(userList);
      model.addAttribute("userList" ,userList);
      return "/user/user_mng";
   }
   
   //ȸ������_���� �ٿ�ε�
   @GetMapping(value="/UserExcelDownload.admin")
   public void userExcelDownload(Model model, HttpServletResponse response, HttpServletRequest request) throws Exception{
      
      System.out.println("ȸ������ �����ٿ�����ш�!");
      
      Workbook wb = new HSSFWorkbook(); // �������� ��ü ����
      Sheet sheet = wb.createSheet("ȸ������"); //��Ʈ ���� 
      sheet.setDefaultColumnWidth(10); //�� ��ü�ʺ�����
      sheet.setColumnWidth(1, 3800); // 2�� �ʺ�����
      sheet.setColumnWidth(3, 4500); // 4�� �ʺ�����
      sheet.setColumnWidth(4, 4000); // 4�� �ʺ�����
      sheet.setColumnWidth(5, 7000); // 4�� �ʺ�����
      
        //================����(1��)==================
        Row titleRow = sheet.createRow(0); //1�� 
        int titleColNum = 0; //1�� 
      Cell titleCell = titleRow.createCell(titleColNum); 
      titleCell.setCellValue("<ȸ������>"); 
      titleRow.setHeight((short)600); // ���������
      sheet.addMergedRegion(new CellRangeAddress(0,0,0,4)); // �� ���� (1��~5��) 

       //t_style
      CellStyle t_style = wb.createCellStyle(); 
      Font t_font = wb.createFont(); 
      
      t_font.setFontHeight((short)(20*22)); 
      t_font.setFontName("���� ���");
      t_font.setBold(true);
      t_style.setAlignment(HorizontalAlignment.CENTER);
      t_style.setFont(t_font); 
      
      titleCell.setCellStyle(t_style); // ������ ��Ÿ�ϵ��� titleCell�� ����
      
      //================���� ��ȸ ��¥(2��)==================
      Row dayRow = sheet.createRow(1); 
      int dayCol = 0;
      Cell dayCell = dayRow.createCell(dayCol);
      Date now = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� mm�� dd�� HH:mm:ss");
      String nowTime = sdf.format(now);
      dayCell.setCellValue("��ȸ��¥ : " + nowTime ); 
      sheet.addMergedRegion(new CellRangeAddress(1,1,0,4)); // �� ���� (1��~5��) 
      

      //================���(4��)==========================
      Row headerRow = sheet.createRow(3); //4��
      String[] header = {"��ȣ", "���̵�","����", "�̸�", "��ȣ", "�̸���", "sns����", "email����", "����" };
      Cell headerCell=null;
      
      //h_style
      CellStyle h_style = wb.createCellStyle();
      Font h_font = wb.createFont();
      h_font.setFontHeight((short)(14*16));
      h_style.setFont(h_font);
      h_style.setAlignment(HorizontalAlignment.CENTER);
      h_style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
      h_style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
      headerRow.setHeight((short)350);
      
      //1�� 
      for(int i=0; i<header.length; i++) {
      headerCell = headerRow.createCell(i);   
      headerCell.setCellValue(header[i]);
      headerCell.setCellStyle(h_style);
      }
      

      //================������(5��)==========================
      int rowNum = 4; // 5����� ������ ����
      int cellNum = 0;
      Row dataRow = null; // for���� �����ֱ�����.
      Cell dataCell = null;
      
      //d_style1(�������) d_style2(��������)
      CellStyle d_style1 = wb.createCellStyle();
      CellStyle d_style2 = wb.createCellStyle();
      Font d_font = wb.createFont();
      d_font.setFontHeight((short)(14*16));
      d_style1.setFont(d_font);
      d_style2.setFont(d_font);
      d_style1.setAlignment(HorizontalAlignment.CENTER);
      d_style2.setAlignment(HorizontalAlignment.LEFT);
      

      List<UserVO> userList =aUserService.userList();
      System.out.println(userList.get(1).getU_type());
      

      for(int i = 0; i<userList.size(); i++) {
         cellNum = 0;
         dataRow = sheet.createRow(rowNum++); // for�� ���鼭 �� 1�پ� �߰�

         dataCell = dataRow.createCell(cellNum); //��ȣ
         dataCell.setCellValue(userList.get(i).getU_seq()); 
         dataCell.setCellStyle(d_style1);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //���̵� 
         dataCell.setCellValue(userList.get(i).getU_id());
         dataCell.setCellStyle(d_style2);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //����
         if(userList.get(i).getU_type().equals("normal")) {userList.get(i).setU_type("�Ϲ�");}
         else if(userList.get(i).getU_type().equals("Google")) {userList.get(i).setU_type("����");}
         else if(userList.get(i).getU_type().equals("KaKao")) {userList.get(i).setU_type("īī��");}
         else if(userList.get(i).getU_type().equals("Naver")) {userList.get(i).setU_type("���̹�");}
         else {userList.get(i).setU_type("����");}
         dataCell.setCellValue(userList.get(i).getU_type()); 
         dataCell.setCellStyle(d_style1); 
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //�̸� 
         dataCell.setCellValue(userList.get(i).getU_name()); 
         dataCell.setCellStyle(d_style2);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //��ȣ
         dataCell.setCellValue(userList.get(i).getU_tel()); 
         dataCell.setCellStyle(d_style2);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //�̸���
         dataCell.setCellValue(userList.get(i).getU_email()); 
         dataCell.setCellStyle(d_style2);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //sns ���ż���
         if(userList.get(i).isU_sms_usable()) dataCell.setCellValue("O");
         else dataCell.setCellValue("X");
         dataCell.setCellStyle(d_style1);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //email ���ż���
         if(userList.get(i).isU_email_usable()) dataCell.setCellValue("O");
         else dataCell.setCellValue("X");
         dataCell.setCellStyle(d_style1);
         cellNum++;
         
         dataCell = dataRow.createCell(cellNum); //Ȱ������ (�־���ұ� ���..!?) 
         if(userList.get(i).isU_status()) dataCell.setCellValue("Ȱ��");
         else dataCell.setCellValue("��Ȱ��");
         dataCell.setCellStyle(d_style1);
         cellNum++;
         
      }

   
      
      //�� ȸ����
      //u_style
      CellStyle u_style = wb.createCellStyle();
      Font u_font = wb.createFont();
      u_font.setFontHeight((short)(16*18));
      u_style.setFont(u_font);
      u_style.setAlignment(HorizontalAlignment.CENTER);
      u_style.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
      u_style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
      
      dataRow = sheet.createRow(rowNum++); 
      dataRow.setHeight((short)350);
      
      dataCell = dataRow.createCell(header.length-2);
      dataCell.setCellValue("�� ȸ��");
      dataCell.setCellStyle(u_style);
      dataCell = dataRow.createCell(header.length-1);
      dataCell.setCellValue(userList.size() +"��"); 
      dataCell.setCellStyle(u_style);
      
       /* ���� ���� ���� */
       response.setContentType("ms-vnd/excel");
       response.setHeader("Content-Disposition", "attachment;filename=userExcelDownload.xls");
       wb.write(response.getOutputStream());
       
   }
   
}