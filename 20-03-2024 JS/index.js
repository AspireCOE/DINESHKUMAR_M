// Named fuction 
function Car(){
    console.log("This is a car");
}
Car();

// anonymous function
var fun=function(){
    console.log("This is anonymous function");
};
console.log(fun);

// creating function with arrow function 
var fun2=()=>{
    console.log("This is an arrow function");
};
console.log(fun2);

// IIFE-Immediately Invoke Function Expression 
(
    ()=>{
        var a=10;
        console.log("This is IIFE");
        console.log(a);
    }
)();

// Call back function 1
function invite(callback){
    console.log("Welcome");
    callback();
}
function person(){
    console.log("Ram");
}
invite(person);

// Call back function 2
function add(callback2){
    var a=10;
    var b=20;
    console.log("The addition of two numbers :"+(a+b));
    callback2();
}
function exit(){
    console.log("This is the final message");
}
add(exit);

