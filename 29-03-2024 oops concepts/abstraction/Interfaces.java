package abstraction;
interface action{
    void run();
    void swim();
}
class StudentOne implements action{
    public void run(){
        System.out.println("Student one is running");
    }
    public void swim(){
        System.out.println("Student one is swimming");
    }
}

public class Interfaces {
    public static void main(String args[]){
        StudentOne obj=new StudentOne();
      obj.run();
      obj.swim();
    }   
}
