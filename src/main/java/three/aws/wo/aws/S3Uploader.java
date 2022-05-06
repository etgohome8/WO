package three.aws.wo.aws;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;

import antlr.collections.List;
import lombok.Value;

@Component
public class S3Uploader {

	
    public static String accessKey;
    public static String secretKey;
	
	public void setSecret(String value) {
		secretKey = "yCjWWU2JJ2Ivvy4hOykmFZm0EUUqpK4WkEW9e0nq";
	}
	public void setClient(String value) {
		accessKey = "AKIAVUCQQXOOSXX7DJAH";
	}
    
    
	private AmazonS3 conn;

	public void S3Uploader() {
		System.out.println("accessKey ==>"+accessKey);
		System.out.println("secretKey ==>"+secretKey);
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint("s3.ap-northeast-2.amazonaws.com"); // ��������Ʈ ���� [ �ƽþ� ����� ���� ]
	}

	// ��Ŷ�� �����ϴ� �޼����̴�.
	public Bucket createBucket(String bucketName) {
		return conn.createBucket(bucketName);
	}

	// ���� ���� (������ ���ϸ� �ڿ� "/"�� �ٿ����Ѵ�.)
	public void createFolder(String bucketName, String folderName) {
		conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}
	
	// ���� ���ε�
	public void fileUpload(String bucketName, String fileName, MultipartFile file) throws IOException {
		byte [] fileData=file.getBytes();
		
		String filePath = (fileName).replace(File.separatorChar, '/'); // ���� �����ڸ� `/`�� ����(\->/) �̰� ������ / ��� �Ѿ���鼭 \�� �ٲ�� �Ű���.
		ObjectMetadata metaData = new ObjectMetadata();

		metaData.setContentLength(fileData.length);   //��Ÿ������ ���� -->������ 128kB���� ���ε� ���������� ����ũ�⸸ŭ ���۸� �������״�.
	    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData); //���� ����

		conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);
		
	}
	// ���� ���ε�
	public void fileUpload(String bucketName, String fileName, byte[] fileData) throws FileNotFoundException {

		String filePath = (fileName).replace(File.separatorChar, '/'); // ���� �����ڸ� `/`�� ����(\->/) �̰� ������ / ��� �Ѿ���鼭 \�� �ٲ�� �Ű���.
		ObjectMetadata metaData = new ObjectMetadata();

		metaData.setContentLength(fileData.length);   //��Ÿ������ ���� -->������ 128kB���� ���ε� ���������� ����ũ�⸸ŭ ���۸� �������״�.
	    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData); //���� ����

		conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);

	}
	// ���� ����
	public void fileDelete(String bucketName, String fileName) {
		String imgName = (fileName).replace(File.separatorChar, '/');
		conn.deleteObject(bucketName, imgName);
		System.out.println("��������");
	}

	// ���� URL
	public String getFileURL(String bucketName, String fileName) {
		System.out.println("�Ѿ���� ���ϸ� : "+fileName);
		String imgName = (fileName).replace(File.separatorChar, '/');
		return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, imgName)).toString();
	}
}
