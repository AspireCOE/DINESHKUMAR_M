const fs=require('fs');
const path=require('path');

//read a file
fs.readFile(path.join(__dirname,'files','greetings.txt'), 'utf8', (err,data)=>{
    if(err) throw err;
    console.log(data);
});

console.log("Hiii");

//write a file
fs.writeFile(path.join(__dirname,'files','invitation.txt'), 'All are welcomed. ', (err)=>{
    if(err) throw err;
    console.log('Write completed');
    //append a file
    //callback
    fs.appendFile(path.join(__dirname,'files','invitation.txt'), '\nThank you.', (err)=>{
        if(err) throw err;
        console.log('Append completed');

        //rename file
        fs.rename(path.join(__dirname,'files','invitation.txt'), path.join(__dirname,'files','thanks.txt'), (err)=>{
            if(err) throw err;
            console.log('Rename completed');
        });
    }); 
});



//exit on uncaught errors
process.on('uncaughtException',err=>{
    console.error(`There was an uncaught error :${err}`);
    process.exit(1);
});