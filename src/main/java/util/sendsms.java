package util;
import java.io.IOException;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

public class sendsms {
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	public void getSMS(int mobile_code, String phone) {

		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);
		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");				
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = {
				new NameValuePair("account", "C44632581"), 
			    new NameValuePair("password", "4b47fca432af1549ad7fc69ca8daf4b7"),
			    new NameValuePair("mobile", phone), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);

		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();
			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();
			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			 if("2".equals(code)){
				System.out.println("短信提交成功");
			}

		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}
	
}