package polymorphism;
//compile time polymorphism
class Methodoverloading1{
    void add(int a,int b,int c){
        System.out.println(a+b+c);
    }
    void add(int a,int b){
        System.out.println(a+b);
    }
}

public class MethodOverloading{
    public static void main(String args[]){
        Methodoverloading1 obj=new Methodoverloading1();

        obj.add(1,2,3);
        obj.add(1,2);
    }
}

