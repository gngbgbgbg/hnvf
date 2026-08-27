const express = require("express");

const app = express();
const PORT = process.env.PORT || 10000;

app.use(express.static("public"));

app.get("/api/status", (req,res)=>{
    res.json({
        status:"online",
        platform:"Render Docker",
        time:new Date()
    });
});

app.listen(PORT,"0.0.0.0",()=>{
    console.log("Panel running on port",PORT);
});
