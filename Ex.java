// 패키지 예   : ExCalc.java
import lib.Calculator;

class ExCalc extends Calculator{
    public int add(int a,int b){
        return a+b;
    }
    public int sub(int a,int b){
        return a-b;
    }
    public double average(int[] a){
        double sum = 0;
        for(int i=0;i<a.length;i++){
            sum += a[i];
        }
        return sum/a.length;
    }
}


public class Ex{
    public static void main(String[] args){
        Calculator cc = new ExCalc();
        System.out.println(cc.add(2,3));
        System.out.println(cc.sub(2,3));
        System.out.println(cc.average(new int [] {2,3,5,7,9,1,23}));
    }
}
