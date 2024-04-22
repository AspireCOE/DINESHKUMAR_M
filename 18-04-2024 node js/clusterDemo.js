var cluster=require('cluster');
var http=require('http');
var cpus=require('os').cpus.length;
if(cluster.isMaster){
    masterProcess();
}
else{
    childProcess();
}

function masterProcess(){
    console.log(`Master ${process.pid} is running`);

    for(let i=0;i<cpus;i++){
        console.log(`forking process number ${i}`);
        cluster.fork();
    }
    process.exit();
}

function childProcess(){
    console.log(`child ${process.pid} started and completed`);
    process.exit();
}
