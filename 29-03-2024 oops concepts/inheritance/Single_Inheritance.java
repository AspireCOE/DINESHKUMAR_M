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
public class Single_Inheritance {
    public static void main(String args[]){
        StudentOne obj=new StudentOne();
        obj.printingNames();
        
    }
}
