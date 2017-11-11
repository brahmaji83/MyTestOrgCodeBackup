public class forum
{
    public static void m1(integer n)
    {
     boolean flag=true;
        integer i = 1;
     integer input=n/i;
     for( i=2 ;i<=n;i++){
      if(input==0){
      System.debug('the given number is not a prime number');
      flag=false;
      break;
      }
      
      }
      if(flag==true){
      system.debug('the value is prime no'+n);
     }
    
    }

}