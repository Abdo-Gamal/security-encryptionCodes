import java.util.Scanner;
public class Vigenere_Tableau {
	public static String Encrypt(String Plain_txt , String Key)
	{
		String Cipher_txt = "";
		String Chars="";
		Plain_txt = Plain_txt.toLowerCase();
		
		Plain_txt = Plain_txt.replaceAll("\\s", "");
		
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
		
		char[][] Chars_Mat=new char[26][26];
		for(int i = 0 ; i < 26 ; i++)
			for(int j = 0 ; j < 26 ; j++)
				Chars_Mat[i][j] = Chars.charAt((i+j)%26);
		
		int c = 0;
		for(int i = 0 ; i < Plain_txt.length() ; i++)
		{
			char Ch_Plain = Plain_txt.charAt(i);
			int Ind_Plain = Chars.indexOf(Ch_Plain);
			
			if(c >= Key.length())
				c = 0;
			
			char Ch_Key = Key.charAt(c);
			int Ind_Key = Chars.indexOf(Ch_Key);
			
			Cipher_txt += Chars_Mat[Ind_Key][Ind_Plain];	
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
		
		char[][] Chars_Mat=new char[26][26];
		for(int i = 0 ; i < 26 ; i++)
			for(int j = 0 ; j < 26 ; j++)
				Chars_Mat[i][j] = Chars.charAt((i+j)%26);
		
		int c = 0;
		for(int i = 0 ; i < Cipher_txt.length() ; i++)
		{
			char Ch_Cipher = Cipher_txt.charAt(i);
			
			if(c >= Key.length())
				c = 0;
			
			char Ch_Key = Key.charAt(c);
			int Ind_Key = Chars.indexOf(Ch_Key);
			
			for(int j = 0 ; j<26 ; j++)
			{
				if (Chars_Mat[Ind_Key][j] == Ch_Cipher)
				{
					Plain_txt += Chars.charAt(j);
					break;
				}
			}			
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
