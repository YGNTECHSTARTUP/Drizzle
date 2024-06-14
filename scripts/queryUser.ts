import { asc, eq } from "drizzle-orm";
import { db } from "../db/db";
import { profiles } from "../db/schema";


const usersfirst = await db.query.users.findMany({
    with:{profile:true},
    columns:{age:true,mood:true},
    orderBy:(table,func)=>func.asc(table.age),
    where:(table,func)=>func.between(table.age,50,90),
    limit:3,
    
})

const bankfirst = await db.query.bank.findMany({
    with:{
    ac:true
    },
})
console.log(bankfirst)
// console.log(usersfirst)

