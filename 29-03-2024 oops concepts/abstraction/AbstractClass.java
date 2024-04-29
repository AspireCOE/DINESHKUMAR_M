package abstraction;
abstract class School{
    abstract void viewDetails();
}
class Student extends School{
       void viewDetails(){
        System.out.println("This is a student class");
       }
}
class Teacher extends School{
    void subjectHandled(){
        System.out.println("This teacher handles Maths");
    }
    void viewDetails(){
        System.out.println("This is a teacher class");
    }
}
public class AbstractClass {
    public static void main(String args[]){
        Student obj=new Student();
        Teacher obj1=new Teacher();
        obj.viewDetails();
        obj1.subjectHandled();
        obj1.viewDetails();
    }   
}
