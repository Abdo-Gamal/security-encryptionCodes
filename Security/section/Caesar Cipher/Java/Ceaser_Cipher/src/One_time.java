import java.util.Scanner;
public class One_time {
	public static String Encrypt(String Plain_txt , String Key)
	{
		String Cipher_txt = "";
		String Chars="";
		Plain_txt = Plain_txt.toLowerCase();
		//Plain_txt = Plain_txt.replaceAll("\\s", "");	
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
		
		for(int i=0; i<Plain_txt.length(); i++)
	    {
			char Plain_Char = Plain_txt.charAt(i);
			int Plain_Dec = (int)Plain_Char;

			char Key_Char = Key.charAt(i);
			int Key_Dec = (int)Key_Char;
			
			int Cipher_Dec = Plain_Dec ^ Key_Dec;
			
			Cipher_txt += (char)Cipher_Dec;
			
	    }
		return Cipher_txt.toUpperCase();
	}
	public static String Decrypt(String Cipher_txt , String Key)
	{
		String Plain_txt = "";
		String Chars="";
		Cipher_txt = Cipher_txt.toLowerCase();
		
		//Cipher_txt = Cipher_txt.replaceAll("\\s", "");
		
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
		
		for(int i=0; i < Cipher_txt.length(); i++)
	    {
			char Cipher_Char = Cipher_txt.charAt(i);
			int Cipher_Dec = (int)Cipher_Char;
			
			char Key_Char = Key.charAt(i);
			int Key_Dec = (int)Key_Char;
			
			int Plain_Dec = Cipher_Dec ^ Key_Dec;
			Plain_txt += (char)Plain_Dec;
	    }
		return Plain_txt;
	}
	public static void main(String[] args) {
		Scanner Sc = new Scanner(System.in);
		String Plain_txt  , Cipher_txt ;
		String Key ;
		
		
		System.out.print("Enter Your Message: ");
		Plain_txt = Sc.nextLine();
		
		System.out.print("Enter Key: ");
		Key = Sc.nextLine();
		if(Plain_txt.length()==Key.length())
		{
			Cipher_txt = Encrypt(Plain_txt , Key);		
			System.out.println("Cipher Text: " + Cipher_txt);
		
			Plain_txt = Decrypt(Cipher_txt , Key);
			System.out.println("Plain Text: " + Plain_txt);
		}
		else
			System.out.println("Length of plain text and key must be the same...");

	}

}
