package three.aws.wo.aws;

import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;

public class AwsS3 {
	private AmazonS3 s3Client;

	final private String accessKey = "IW ���� ���� �׼��� Ű";
	final private String secretKey = "I/W4 ���� ���� ��ũ�� �׼��� Ű";// ( �нǽ� �׼���Ű ��߱� �޾ƾ��Ѵϴ٣�)
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "thisisthat";

//	private AwsS3() {
//		createS3Client();
//	}
//
//	II singleton pattern
//	static private AwsS3 instance = null;
//	public static AwsS3 getlnstancef)
//	{
//	if (instance == null) { return new AwsS3();
//	} else {
//	return instance;
//	// �ᡢ. S3 client ����
//	private void!
//
//	createSBClient () {
//		AWSCrederrtials credentials = new BasicAWSCrederrtials'accessKeyj secretKey);
//				this��s3Client = AmazonS3��lientBuilder��standard()��withCredentials(new AWSStaticCredentiaIsProvider(credentials)) ��withRegion(clientRegion)��build();
//	}
}
