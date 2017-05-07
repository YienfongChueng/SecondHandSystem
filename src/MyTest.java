import java.util.ArrayList;
import java.util.List;


public class MyTest {
	public String removeSameCreatorId(String str){
		String[] array   = str.split(",");  
		List<String> list =new ArrayList<String>();   
		  for (int i=0;i<array.length;i++)   
		  {   
		          if(!list.contains(array[i]))   
		          {   
		             list.add(array[i]);   
		          }   
		  }   
		  return   list.toString();
	}
	public static void main(String[] args) {
		String str  =   "1,1,3,3,2,1";
		MyTest pa=new MyTest();
		String newstr=pa.removeSameCreatorId(str);
		System.out.println(newstr);

	}

}
