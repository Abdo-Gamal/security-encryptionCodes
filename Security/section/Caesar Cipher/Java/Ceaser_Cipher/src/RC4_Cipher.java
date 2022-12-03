
import java.util.Scanner;
public class RC4_Cipher {
	public static String Encrypt(String Plain_txt , String Key)
	{
		String Cipher_txt = "";
		int[] S = new int[256];
		char[] T = new char[256];
		for(int i = 0 ; i < 256 ; i++)
		{
			S[i] = i;
			T[i] = Key.charAt(i % Key.length());
		}

		for(int i = 0 , j = 0; i < 256 ; i++)
		{
			j = (j + S[i] + T[i]) % 256;
			int Temp = S[i];
			S[i] = S[j];
			S[j] = Temp;
		}
		int Length = Plain_txt.length();
		int[] New_Key = new int[Length];
		int L = 0 , i = 0 , j = 0;
	
		while( L < Length )
		{
			i = (i + 1) % 256;
			j = (j + S[i]) % 256;
			int Temp = S[i];
			S[i] = S[j];
			S[j] = Temp;
			int t = S[i] + S[j];
			New_Key[L] = S[t % 256];
			L++;
		}
		L = 0;
		while( L < Length )
		{
			char Plain_Char = Plain_txt.charAt(L);
			int Plain_Dec = (int)Plain_Char;
			int Key_Dec = New_Key[L];
			int Cipher_Dec = Plain_Dec ^ Key_Dec;
			//System.out.println(Cipher_Dec);
			Cipher_txt += (char)Cipher_Dec;			
			L++;
		}
		
		return Cipher_txt;
	}
	public static String Decrypt(String Cipher_txt , String Key)
	{
		String Plain_txt = "";
		
		int[] S = new int[256];
		char[] T = new char[256];
		for(int i = 0 ; i < 256 ; i++)
		{
			S[i] = i;
			T[i] = Key.charAt(i % Key.length());
		}
		//int j ;
		for(int i = 0 , j = 0 ; i < 256 ; i++)
		{
			j = (j + S[i] + T[i]) % 256;
			int Temp = S[i];
			S[i] = S[j];
			S[j] = Temp;
		}
		int Length = Cipher_txt.length();
		int[] New_Key = new int[Length];
		int L = 0 , i = 0 , j = 0;
		while( L < Length )
		{
			i = (i + 1) % 256;
			j = (j + S[i]) % 256;
			int Temp = S[i];
			S[i] = S[j];
			S[j] = Temp;
			int t = S[i] + S[j];
			New_Key[L] = S[t % 256];
			L++;
		}
		L = 0;
		while( L < Length )
		{
			char Cipher_Char = Cipher_txt.charAt(L);
			int Cipher_Dec = (int)Cipher_Char;
			int Key_Dec = New_Key[L];
			int Plain_Dec = Cipher_Dec ^ Key_Dec;			
			Plain_txt += (char)Plain_Dec;			
			L++;
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
		
		Cipher_txt = Encrypt(Plain_txt , Key);		
		System.out.println("Cipher Text: " + Cipher_txt);
	
		Plain_txt = Decrypt(Cipher_txt , Key);
		System.out.println("Plain Text: " + Plain_txt);

	}

}
