
import java.util.Scanner;
public class Ceaser {
	public static String Encrypt(String Plain_txt , int Key)
	{
		String Cipher_txt = "";
		String Chars="";
		Plain_txt = Plain_txt.toLowerCase();
		
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;	

		for(int i = 0 ; i < Plain_txt.length() ; i++)
		{
			char Ch = Plain_txt.charAt(i);
			if (Ch != ' ')
			{
				 int Index = Chars.indexOf(Ch);
				 int New_Index = (Index + Key)%26;
				 Cipher_txt += Chars.charAt(New_Index);	
			}
		}
		
		return Cipher_txt.toUpperCase();
	}
	
	public static String Decrypt(String Cipher_txt, int Key)
	{
		String Plain_txt = "";
		String Chars="";
		Cipher_txt = Cipher_txt.toLowerCase();
		
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;	

		for(int i = 0 ; i < Cipher_txt.length() ; i++)
		{
			char Ch = Cipher_txt.charAt(i);
			if (Ch != ' ')
			{
				 int Index = Chars.indexOf(Ch);
				 int New_Index = (Index - Key)%26;
				 Plain_txt += Chars.charAt(New_Index);	
			}
		}
		
		return Plain_txt.toLowerCase();
	}
	public static void main(String[] args) {
		Scanner Sc = new Scanner(System.in);

		String Plain_txt , Cipher_txt;
		int Key;
		System.out.print("Enter Your Message: ");
		Plain_txt = Sc.nextLine();
		
		System.out.print("Enter Key: ");
		Key = Sc.nextInt();
		
		Cipher_txt = Encrypt(Plain_txt , Key);		
		System.out.println("Cipher Text: " + Cipher_txt);
		
		Plain_txt = Decrypt(Cipher_txt , Key);
		System.out.println("Plain Text: " + Plain_txt);
	}

}
