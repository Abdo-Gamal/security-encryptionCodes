
public class Payfair1 {
	public static boolean Contains(String Str , char Ch)
	{
		for(int i = 0 ; i < Str.length() ; i++)
			if(Str.charAt(i) == Ch)
				return true;
		
		return false;
	}
	public static String Func(String Str)
	{
		// if two consecutive characters are same, then insert character 'x' in between them
        for (int i = 0; i < Str.length(); i += 2) 
        {
        	if( ( i + 1 ) == Str.length() )
        		Str += 'x';
            if (Str.charAt(i) == Str.charAt(i + 1))
            	Str = Str.substring(0, i + 1) + 'x' + Str.substring(i + 1);
        }
        return Str;
	}
	public static String Encrypt(String Plain_txt , String Key)
	{
	// Part 1: Format Plain_txt
		Plain_txt = Plain_txt.toLowerCase();
		Plain_txt = Plain_txt.replaceAll("\\s", "");
		Plain_txt = Plain_txt.replace('j', 'i');
		
		// if two consecutive characters are same, then insert character 'x' in between them
		Plain_txt = Func(Plain_txt);
        // make the Plain_text of even length
        if (Plain_txt.length() % 2 != 0)
        	Plain_txt += 'x';
        
    	String Cipher_txt = "";
		String Chars = "";
		for(int i = 'a' ; i<='z' ; i++)
			Chars += (char)i;
	
		char[][] Char_Mat = new char[5][5];
		
	// Part 2: Format Key        
		Key = Key.replaceAll("\\s", "");
		Key = Key + Chars;
		Key = Key.replace('j', 'i');
		
		String F_Chars = "";
		for(int i = 0 ; i < Key.length() ; i++)
		{
			char Ch = Key.charAt(i);
			// F_Chars.contains(Ch)
			if( Contains(F_Chars , Ch) == false )
				F_Chars += Ch;
		}
	//	Insert Chars in Matrix
		for(int i = 0 , C = 0 ; i < 5 ; i++)
			for(int j = 0 ; j < 5 ; j++)
				Char_Mat[i][j] = F_Chars.charAt(C++);
		
	// 	
		int F_row = 0 , F_column = 0 , S_row = 0 , S_column = 0;  
		for(int i = 0 ; i < Plain_txt.length() ; i=i+2)
		{
			char F_Ch = Plain_txt.charAt(i);
			char S_Ch = Plain_txt.charAt(i+1);
			
			for(int r = 0 ; r < 5 ; r++)
	            for(int c = 0 ; c < 5 ; c++)
	            { 
	                
	                if ( Char_Mat[r][c] == F_Ch )
	                {
	                    F_row = r; 
	                	F_column = c;
	                }	               
	                
	                if (Char_Mat[r][c] == S_Ch )
	                {
	                	S_row = r; 
	                	S_column = c;
	                }	               
	            }
			
			// if both the characters are in the same row
			if (F_row == S_row)
	        {
	            Cipher_txt += Char_Mat[F_row][(F_column+1)%5];
	            Cipher_txt += Char_Mat[S_row][(S_column+1)%5];
	        }
			else if (F_column == S_column)
			{
				Cipher_txt += Char_Mat[(F_row+1)%5][F_column];
	            Cipher_txt += Char_Mat[(S_row+1)%5][S_column];
			}
			else
			{
				Cipher_txt += Char_Mat[F_row][S_column];
	            Cipher_txt += Char_Mat[S_row][F_column];
			}
			
		}

		return Cipher_txt.toUpperCase();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
