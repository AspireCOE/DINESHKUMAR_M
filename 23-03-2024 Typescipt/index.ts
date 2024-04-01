// inheritance 
class Parent {
    name: string;
    constructor(name) {
        this.name = name;
        console.log("This is parent class");
    }
}
class Child extends Parent {
    displayChild(): void {
        console.log("This is child class");
    }
}

let obj = new Child("ajaay");
obj.displayChild();

class Top{
    studentName:string;
    constructor(studentName){
        this.studentName=studentName;
        console.log("The student name is "+studentName);
    }
}
class Middle extends Top{
    displayGreetings():void{
        console.log("WELOCOME");
    }
}
class Bottom extends Middle{
    display():void{
        console.log("This is Bottom class");
    }
}
let obj2=new Bottom("Arun");
obj2.displayGreetings();

// abstraction

abstract class Bank{
    abstract printDetails():void;
}
class CustomerOne extends Bank{
    printDetails(): void {
        console.log("This is customer 1 Details");
    }
}
class CustomerTwo extends Bank{
    printDetails(): void {
        console.log("This is customer 2 Details");
    }
}

const customerOne=new CustomerOne();
const customerTwo=new CustomerTwo();

customerOne.printDetails();
customerTwo.printDetails();