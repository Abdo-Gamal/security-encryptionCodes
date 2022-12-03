import java.util.Scanner;
public class Hill {
	public static String Encrypt(String Plain_txt ,String Key)
	{
		String Cipher_txt = "";
		String Chars="";
		Plain_txt = Plain_txt.toLowerCase();
		
		Plain_txt = Plain_txt.replaceAll("\\s", "");
		
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
		
		int Len = (int)Math.sqrt(Key.length());
	    int[][] Key_Mat=new int[Len][Len];
		
	    int C = 0;
	    for(int i=0; i < Len ; i++)
	        for(int j=0;j<Len;j++)
	        {
	        	char Key_Char = Key.charAt(C); 
	        	int Key_Ind = Chars.indexOf(Key_Char);
	        	Key_Mat[i][j]= Key_Ind;	        		                     
	            C++;            
	        }
	    int Count = 0; 
	    
	    int[] Block = new int[Len]; 
	    for(int i = 0 ; i < Plain_txt.length() ; i=i+Len)
	    {
	    	for(int j = 0 ; j < Len ; j++)
	        {
	    		char Plain_Char;
	    		if( i+j < Plain_txt.length())
	    			Plain_Char = Plain_txt.charAt(i+j);
	    		else
	    		{
	    			Plain_Char = 'x';
	    			Count++;
	    		}
	    		
	    		int Plain_Ind = Chars.indexOf(Plain_Char);
	    		Block[j] = Plain_Ind;	    		
	        }
	    	
	    	for (int r = 0 ; r < Len ; r++)
	        {
	    		int Cipher_Ind = 0;
	    		for (int c = 0 ; c < Len ; c++)
	    			Cipher_Ind += Key_Mat[r][c] * Block[c]; 

	    		Cipher_txt += Chars.charAt(Cipher_Ind % 26);
	        }	    	
	    }
    	if(Count > 0)
    		return Cipher_txt.substring(0, Cipher_txt.length()- Count).toUpperCase();
    	else
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
		int Len = (int)Math.sqrt(Key.length());
	    int[][] Key_Mat=new int[Len][Len];
		
	    int C = 0;
	    for(int i=0; i < Len ; i++)
	        for(int j=0;j<Len;j++)
	        {
	        	char Key_Char = Key.charAt(C); 
	        	int Key_Ind = Chars.indexOf(Key_Char);
	        	Key_Mat[i][j]= Key_Ind;	        		                     
	            C++;            
	        }
	    
	    //compute_Determinante
	    int Det =0;   int r = 1;
	    for (int c = 0 ; c < 3; c++)
	    { 
	        Det += Key_Mat[r][c]*(  Key_Mat[(row + 1) % 3][(column + 1) % 3]
	                * Key_Mat[(row + 2) % 3][(column + 2) % 3]
	                - Key_Mat[(row + 1) % 3][(column + 2) % 3]
	                * Key_Mat[(row + 2) % 3][(column + 1) % 3]);
	    }
	    
		return Plain_txt;
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
		
		//Plain_txt = Decrypt(Cipher_txt , Key);
		//System.out.println("Plain Text: " + Plain_txt);
	}

}
