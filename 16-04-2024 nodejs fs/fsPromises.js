const path=require('path');
const fsPromises=require('fs').promises;

const fileOps= async() => {
    try{
        const data=await fsPromises.readFile(path.join(__dirname,'files','greetings.txt'),'utf-8');
        console.log(data);

        await fsPromises.writeFile(path.join(__dirname,'files','hi.txt'),'Hi people','utf-8');
        console.log("File written successfully");

        const stats = await fsPromises.stat(path.join(__dirname, 'files', 'hi.txt'));
        if (stats.isFile()) {
            console.log('File exists: Yes');
        } else {
            console.log('File exists: No');
        }

        await fsPromises.unlink(path.join(__dirname,'files','hi.txt'));
        console.log("File deleted successfully");
    }
    catch(error){
        console.error("Error : "+error)
    }
}
fileOps();

