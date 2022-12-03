import java.util.Scanner;
public class Vigenere {
	public static String Encrypt(String Plain_txt , String Key)
	{
		String Cipher_txt = "";
		String Chars="";
		Plain_txt = Plain_txt.toLowerCase();
		
		Plain_txt = Plain_txt.replaceAll("\\s", "");
		
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
		
		int c = 0;
		for(int i = 0 ; i < Plain_txt.length() ; i++)
		{
			char Ch_Plain = Plain_txt.charAt(i);
			int Ind_Plain = Chars.indexOf(Ch_Plain);
			
			if(c >= Key.length())
				c = 0;
			
			char Ch_Key = Key.charAt(c);
			int Ind_Key = Chars.indexOf(Ch_Key);
			
			int New_Index = (Ind_Plain + Ind_Key)%26;
			Cipher_txt += Chars.charAt(New_Index);	
			c++;
		}
		
		
		return Cipher_txt.toUpperCase();
	}
	public static String Decrypt(String Cipher_txt, String Key)
	{
		String Plain_txt = "";
		String Chars="";
		Cipher_txt = Cipher_txt.toLowerCase();
		Cipher_txt = Cipher_txt.replaceAll("\\s", "");
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
		
		int c = 0;
		for(int i = 0 ; i < Cipher_txt.length() ; i++)
		{
			char Ch_Cipher = Cipher_txt.charAt(i);
			int Ind_Cipher = Chars.indexOf(Ch_Cipher);
			
			if(c >= Key.length())
				c = 0;
			
			char Ch_Key = Key.charAt(c);
			int Ind_Key = Chars.indexOf(Ch_Key);
			
			int New_Index = (Ind_Cipher - Ind_Key +26)%26;
			Plain_txt += Chars.charAt(New_Index);	
			c++;
		}
		
		return Plain_txt.toLowerCase();
	}
	public static void main(String[] args) {
		Scanner Sc = new Scanner(System.in);

		String Plain_txt , Cipher_txt;
		String Key;
		System.out.print("Enter Your Message: ");
		Plain_txt = Sc.nextLine();
		
		System.out.print("Enter Key: ");
		Key = Sc.nextLine();
		
		Cipher_txt = Encrypt(Plain_txt , Key);		
		System.out.println("Cipher Text: " + Cipher_txt);
		
		Plain_txt = Decrypt(Cipher_txt , Key);
		System.out.println("Plain Text: " + Plain_txt);

	}

}
