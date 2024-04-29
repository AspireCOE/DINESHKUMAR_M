const express = require("express");
const bodyParser = require("body-parser");

const axios = require("axios");
const app = express();
const port = 5000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static("public"));
app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});
app.post("/submit", (req, res) => {
  console.log("submit");
  const { username, password, mobile, email } = req.body;
  const userdata = {
    username,
    password,
    mobile,
    email,
  };

  axios
    .post("http://localhost:3000/users", userdata)
    .then((data) => {
      res.send("user data saved success");
    })
    .catch((err) => console.log("error saving the data", err));
});

app.get("/getuser", (req, res) => {
  axios
    .get("http://localhost:3000/users")
    .then((dbresponse) => {
      res.json(dbresponse.data);
    })
    .catch((err) => {
      console.log(err);
    });
});

app.post("/changePassword", (req, res) => {
  const { id, password } = req.body;

  console.log("Changing password for user:", id);

  axios
    .patch(`http://localhost:3000/users/${id}`, { password })
    .then((response) => {
      console.log("Password updated successfully:", response.data);
      res.send("Password updated successfully");
    })
    .catch((error) => {
      console.error("Error updating password:", error);
      res.status(500).send("Error updating password");
    });
});


// Start the server
app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});
