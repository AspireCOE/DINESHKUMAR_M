class EmployeeDetails{
    private empId:number;
    private empName:string;
    private empDept:string;


    //?-optional parameter
    constructor(empId:number,empName:string,dept:string){
        console.log("This ia an constructor");
    }

    public printName():void{
        console.log("EmpID"+this.empId);
        console.log("Emp Name"+this.empName);
        console.log("Emp Department"+this.empDept);
    }
    // let empDetail=new EmployeeDetails(2,"Raj","Marketing");
    // empDetail.printName();

    totalSalary(...salary:number[]):number{
        let total=0;
        salary.forEach((num)=>total+=num);
        return total;
    }
    console.log(empDetail)


}