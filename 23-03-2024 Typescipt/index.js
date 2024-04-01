var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
// inheritance 
var Parent = /** @class */ (function () {
    function Parent(name) {
        this.name = name;
        console.log("This is parent class");
    }
    return Parent;
}());
var Child = /** @class */ (function (_super) {
    __extends(Child, _super);
    function Child() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Child.prototype.displayChild = function () {
        console.log("This is child class");
    };
    return Child;
}(Parent));
var obj = new Child("ajaay");
obj.displayChild();
var Top = /** @class */ (function () {
    function Top(studentName) {
        this.studentName = studentName;
        console.log("The student name is " + studentName);
    }
    return Top;
}());
var Middle = /** @class */ (function (_super) {
    __extends(Middle, _super);
    function Middle() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Middle.prototype.displayGreetings = function () {
        console.log("WELOCOME");
    };
    return Middle;
}(Top));
var Bottom = /** @class */ (function (_super) {
    __extends(Bottom, _super);
    function Bottom() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Bottom.prototype.display = function () {
        console.log("This is Bottom class");
    };
    return Bottom;
}(Middle));
var obj2 = new Bottom("Arun");
obj2.displayGreetings();
// abstraction
var Bank = /** @class */ (function () {
    function Bank() {
    }
    return Bank;
}());
var CustomerOne = /** @class */ (function (_super) {
    __extends(CustomerOne, _super);
    function CustomerOne() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    CustomerOne.prototype.printDetails = function () {
        console.log("This is customer 1 Details");
    };
    return CustomerOne;
}(Bank));
var CustomerTwo = /** @class */ (function (_super) {
    __extends(CustomerTwo, _super);
    function CustomerTwo() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    CustomerTwo.prototype.printDetails = function () {
        console.log("This is customer 2 Details");
    };
    return CustomerTwo;
}(Bank));
var customerOne = new CustomerOne();
var customerTwo = new CustomerTwo();
customerOne.printDetails();
customerTwo.printDetails();
