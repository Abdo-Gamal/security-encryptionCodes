import java.util.Scanner;
import java.security.MessageDigest;
import java.util.Arrays; 
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class TDES {

    public static void main(String[] args) throws Exception {
        
    	Scanner Sc = new Scanner(System.in);
    	System.out.print("Enter Plain Text: ");
		String text = Sc.nextLine();
    
        byte[] codedtext = new TDES().encrypt(text);
        
        System.out.println("The plain text: " + text );
        System.out.println("The cipher text: " + codedtext); // this is a byte array, you'll just see a reference to an array
        System.out.println("-------------------------------------");
       
    }

    public byte[] encrypt(String message) throws Exception {
        final MessageDigest md = MessageDigest.getInstance("md5");
        final byte[] digestOfPassword = md.digest("HG58YZ3CR9"
                .getBytes("utf-8"));
        final byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
        for (int j = 0, k = 16; j < 8;) {
            keyBytes[k++] = keyBytes[j++];
        }

        final SecretKey key = new SecretKeySpec(keyBytes, "DESede");
        final IvParameterSpec iv = new IvParameterSpec(new byte[8]);
        final Cipher cipher = Cipher.getInstance("DESede/CBC/PKCS5Padding");
        System.out.println("The KEY: " + key );
        cipher.init(Cipher.ENCRYPT_MODE, key, iv);

        final byte[] plainTextBytes = message.getBytes("utf-8");
        final byte[] cipherText = cipher.doFinal(plainTextBytes);
        // final String encodedCipherText = new sun.misc.BASE64Encoder()
        // .encode(cipherText);

        return cipherText;
    }
   
    }