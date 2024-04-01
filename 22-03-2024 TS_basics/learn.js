var studentName = "Arun";
console.log(studentName);
function greeting(studentName) {
    return "welcome " + studentName;
}
console.log(greeting(studentName));
var Attendance = /** @class */ (function () {
    function Attendance(rollNo, name) {
        this.rollNo = rollNo;
        this.name = name;
    }
    Attendance.prototype.display = function () {
        console.log("Roll no. " + this.rollNo + " is present");
        console.log("His name is " + this.name);
    };
    return Attendance;
}());
var obj = new Attendance(22, "Dinesh");
obj.display();
// arrays
var arr = [1, 2, 3];
arr.push(4);
console.log(arr);
arr.forEach(function (num) {
    console.log(num);
});
