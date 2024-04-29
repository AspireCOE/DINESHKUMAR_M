class Student{
    void printMessage(){
        System.out.println("This is a Student class");
    }
}
class StudentOne extends Student{
    void printingNames(){
        System.out.println("My name is Ram");
    }
}
class MarkOne extends StudentOne{
    void printingMarks(){
        System.out.println("My mark is 97");
    }
}
public class Multilevel_Inheritance {
    public static void main(String[] args){
        MarkOne obj=new MarkOne();
        obj.printMessage();
    }
    
}