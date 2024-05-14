var mongoose=require('mongoose');

var Schema =mongoose.Schema;

async function mongooconnect(){
var skillSchema=new Schema({
    skillName:String,
    experience:Number,
    proficiency:String
});

var jobSeekerSchema=new Schema({
    jobSeekerName:String,
    emailId:String,
    age:Number,
    certified:Boolean,
    skills:[skillSchema]
})

var js=mongoose.model('jobSeeker',jobSeekerSchema);
mongoose.connect("mongodb://127.0.0.1:27017/test");

var jobSekker1=new js({
    jobSeekerName:"Raj",
    age:22,
    emailId:"raj@test.com",
    certified:true,
    skills:[{skillName:"java",experience:8,proficiency:"begineer"},
    {skillName:"angular",experience:2,proficiency:"intermediate"}    
    ]
})

jobSekker1.save();

js.find({},(err,data)=>{
    if(err){
        console.log("Error while retrieving the data");
    }
    else{
        console.log(data);
    }
});

//update data
const updateResult1=await js.findOneAndUpdate({jobSeekerName:"Raj"},{age:27},{new:true});

    //retrieving data
    const result=await js.find({"skills.experience":{$lte:2}});
    result.map(record=>console.log(record));

    
}

mongooconnect();