const { MongoClient } = require("mongodb");

// Connection URI
const uri = "mongodb://127.0.0.1:27017/";

// Create a new MongoClient
const client = new MongoClient(uri);

// Connect to the MongoDB server
async function connectToMongoDB() {
  try {
    await client.connect();
    const db = client.db("test");
    const collection = db.collection("employees");

    const cursor = collection.find({});

    // insertOne
    // const ackresult = collection.insertOne({
    //   _id: 7,
    //   firstName: "John",
    //   lastName: "Steves",
    //   gender: "male",
    //   email: "john.steves@abc.com",
    //   salary: 50000,
    //   department: { name: "Developer" },
    // });
    // console.log("The record inserted into the collection with "+(ackresult.insertedId));

    //insertMany
    // const ackresult = await collection.insertMany([
    //   {
    //     _id: 8,
    //     firstName: "Abdul",
    //     lastName: "Salam",
    //     gender: "male",
    //     email: "abdul.salam@abc.com",
    //     salary: 40000,
    //     department: { name: "Marketing" },
    //   },
    //   {
    //     _id: 9,
    //     firstName: "Amal",
    //     lastName: "Davis",
    //     gender: "male",
    //     email: "amal.davis@abc.com",
    //     salary: 6000,
    //     department: { name: "Data analyst" },
    //   },
    // ]);
    // console.log(
    //   "The record inserted into the collection with " +
    //     Object.values(ackresult.insertedIds)
    // );


    // UpdateOne
    // const updateResult = await collection.updateOne(
    //   { _id: 8 }, // Filter
    //   { $set: { salary: 77000 } } // Update
    // );
    // console.log(`${updateResult.modifiedCount} document updated`);

    // updateMany
    // const updateResult=await collection.updateMany(
    //     {_id:{$in:[8,9]}},
    //     {$set:{salary:65000}}
    // );
    // console.log(`${updateResult.modifiedCount} document updated`);

    // const updateResult=await collection.updateMany(
    //     {salary:{$eq:65000}},
    //     {$set:{"department.name":"HR"}}
    // );
    // console.log(`${updateResult.modifiedCount} document updated`);

    // deleteOne
    // const deleteResult = await collection.deleteOne({ _id: 9 });
    // console.log("Deleted documents count "+deleteResult.deletedCount);

    //deleteMany
    // const deleteResult = await collection.deleteMany({_id: { $in: [7,8] } });
    // console.log("Deleted documents count "+deleteResult.deletedCount);

    await cursor.forEach((record) => {
      console.log(record);
    });
    await client.close();

    console.log("Connected to MongoDB successfully");
  } catch (error) {
    console.error("Error connecting to MongoDB:", error);
  }
}

// Call the function to connect
connectToMongoDB();
