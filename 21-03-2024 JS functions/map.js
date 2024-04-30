let myMap = new Map();

myMap.set('one', 'value1');
myMap.set('two', 'value2');
myMap.set('three', 'value3');
myMap.set('four', 'value3');

console.log("Size of the map:", myMap.size); 

console.log("Value associated with 'key1':", myMap.get('one')); 

console.log("Does the map contain 'key2'?", myMap.has('two')); 

myMap.delete('key1');

myMap.forEach((value, key) => {
  console.log(`Key: ${key}, Value: ${value}`);
});

myMap.clear();
console.log("Size of the map after clearing:", myMap.size); 
