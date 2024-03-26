// Array inbuilt functions 
var names=[];
names.push("Ram","Ravi","Arun","Balu","Kishan");
console.log(names.length);

names.pop();
// removes last element in array 
console.log(names.length);

let sorted_names=names.sort();
console.log(sorted_names);

let filled_names=names.fill("Dinesh",1,3);
// fills every element of array 
console.log(filled_names);

let shift_names=names.shift();
// removes the first Element of the array 
console.log(shift_names);

names.unshift("Ajaay");
// adds element to the start of the array 
console.log(names);

// map function -iterate through every elemnts in array and apply that function to each element
names.map(
    (product,index)=>{
        console.log(product+" "+index);
    }
)

//keys()-retuen a array iterator obj that contains keys for each element
let iterator=names.keys();
for(let key of iterator){
    console.log(key);
}

//values()-return a array iterator obj that contain value for each index
let iterator2=names.values();
for(let value of iterator2){
    console.log(value);
}


// String inbuilt functions 
var str="Aspire";
console.log(str);
console.log(str.charAt(2));
console.log(str.substring(0,2));

str=str.concat(" ","Systems");
console.log(str);
console.log(str.indexOf("e"));
console.log(str.toUpperCase());
console.log(str.toLowerCase());

const arr=str.split(" ");
console.log(arr);

const msg="Hello    ";
console.log(msg.trim());
console.log(str.slice(3,7));

const nums=[1,2,3,4,5];
nums.forEach(
    (num)=>{
        console.log(num*2);
    }
);
console.log(nums);

var map_fun=nums.map(
    (num)=>{
        return num*2;
    }
);
console.log(map_fun);
