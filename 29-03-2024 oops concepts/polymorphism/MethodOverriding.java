package polymorphism;

//run time polymorphism
class EmployeeDetailOne{
    void printName(){
        System.out.println("Name is Ravi");
    }
}
class EmployeeDetailTwo extends EmployeeDetailOne{
    @Override
    void printName(){
        System.out.println("Name is Ram");
    }
}

public class MethodOverriding {
    public static void main(String args[]){
        EmployeeDetailTwo obj=new EmployeeDetailTwo();
        obj.printName();
        EmployeeDetailOne obj1=new EmployeeDetailOne();
        obj1.printName();
    }   
}
