const express=require('express');
const app=express();
const PORT=8000

app.use('/',(req,res)=>{
    res.send(
        `<h1>Welcome to docker!</h1>`
    )
})
app.listen(PORT,()=>{
    console.log(`Server running on ${PORT}`);
});