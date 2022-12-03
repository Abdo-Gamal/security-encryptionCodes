import java.util.Arrays;
import java.util.Base64;
import java.util.Scanner;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class TripleDESTest {
    private String encrypt(String Plain_txt, String Key) {
        try {
            byte[] bytePass = Key.getBytes("utf-8");
            byte[] byteKey = Arrays.copyOf(bytePass, 24);
            SecretKey key = new SecretKeySpec(byteKey, "DESede");
            Cipher cipher = Cipher.getInstance("DESede");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] byteText = Plain_txt.getBytes("utf-8");
            byte[] buf = cipher.doFinal(byteText);
            
            byte[] byteBase64 = Base64.getEncoder().encode(buf);
            String data = new String(byteBase64);
            
            return data;
        }
        catch(Exception ex) {
            return ex.getMessage();
        }
    }
    
    private String decrypt(String data, String secretKey) {
        try {
            byte[] byteData = Base64.getDecoder().decode(data.getBytes("utf-8"));
            byte[] bytePass = secretKey.getBytes("utf-8");
            byte[] byteKey = Arrays.copyOf(bytePass, 24);
            
            SecretKey key = new SecretKeySpec(byteKey, "DESede");
            Cipher cipher = Cipher.getInstance("DESede");
            cipher.init(Cipher.DECRYPT_MODE, key);
            
            byte[] byteText = cipher.doFinal(byteData);
            String clearText = new String(byteText, "utf-8");
            
            return clearText;
        }
        catch(Exception ex) {
            return ex.getMessage();
        }
    }
    
    public static void main(String[] args) {
        try (Scanner Sc = new Scanner(System.in)) {
			System.out.print("Enter Plain Text: ");
			String Plain_txt = Sc.nextLine();
			System.out.print("Enter Key: ");
			String Key = Sc.nextLine();
			
			String data = new TripleDESTest().encrypt(Plain_txt, Key);
			Plain_txt = new TripleDESTest().decrypt(data, Key);
			
			System.out.println("Cipher Text is " + data);
			System.out.println("Plain Text is " + Plain_txt);
		}
    }
    
}