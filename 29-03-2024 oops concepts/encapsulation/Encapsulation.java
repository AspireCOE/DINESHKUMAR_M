package encapsulation;
class Student{
    private int rollnum;
    private String name;
    public void getRollnum(int rollnum){
         this.rollnum=rollnum;
    }
    public int setrollnum(){
        return rollnum;

    }
    public void getName(String name){
        this.name=name;
    }
    public String setName(){
        return name;
    }

}
public class Encapsulation{
    public static void main (String args[]){
        Student obj=new Student();
        obj.getRollnum(1);
        obj.getName("Dinesh");
       
        System.out.println(obj.setrollnum());
        System.out.println(obj.setName());
    }
}

