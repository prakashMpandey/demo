import express from "express"


const app=express()

app.get("/",(req,res)=>{
    return res.json({msg:"kya haal chal miiitrr"})
})


app.listen(5000,()=>{
    console.log("server is running on port ",5000)
})