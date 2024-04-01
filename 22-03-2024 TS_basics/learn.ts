let studentName: string = "Arun";
console.log(studentName);

function greeting(studentName: string) {
  return "welcome " + studentName;
}
console.log(greeting(studentName));

class Attendance {
  rollNo: number;
  name: string;

  constructor(rollNo: number, name: string) {
    this.rollNo = rollNo;
    this.name = name;
  }

  display(): void {
    console.log("Roll no. " + this.rollNo + " is present");
    console.log("His name is " + this.name);
  }
}

let obj = new Attendance(22, "Dinesh");
obj.display();

// arrays
let arr: number[] = [1, 2, 3];
arr.push(4);
console.log(arr);

arr.forEach((num) => {
  console.log(num);
});
