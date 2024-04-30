let mySet = new Set();

mySet.add(1);
mySet.add("hello");
mySet.add("Welcome")
mySet.add({ name: "Dinesh" });

console.log(mySet.has(1));
console.log(mySet.has(2));

mySet.delete("hello");

console.log(mySet.size);

mySet.forEach((value) => {
  console.log(value);
});
