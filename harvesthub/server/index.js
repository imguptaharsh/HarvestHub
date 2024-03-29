// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const dotenv = require("dotenv");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// Config
dotenv.config();

// Init   
const PORT=process.env.PORT || 3001;
const app=express(); 
const db="mongodb+srv://guptaharsh:hkg220@cluster0.rwepirz.mongodb.net/?retryWrites=true&w=majority";
// midleware
// Client -> middlware -> Server -> Client
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
 
// Connections
mongoose
    .connect(db)
    .then(()=>{     
        console.log("connection Successful")
    })
    .catch((e)=>{
        console.log(e);
    });

    
app.listen(PORT,"0.0.0.0", ()=>{
    console.log('connected at port '+ PORT);
});
     