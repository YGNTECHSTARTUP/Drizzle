import { db } from "../db/db";
import { account, bank, profiles, users } from "../db/schema";

for (let i=0;i<10;i++)
    {
    //     let z = false
    //     if(i%2==0)
    //         {
    //           z = true
    //         }
    //   const fun =  await db.insert(users).values({
    //         age:Math.floor(Math.random()*100),
    //         isMale:z,
    //         description:`THis is user ${i}`,
    //         mood:z?"angry":"sad"
    //     }).returning({userId:users.id})

    //     await db.insert(profiles).values({
    //         name:`User ${i}`,
    //         bio:`This is user ${i}`,
    //         userId:fun[0].userId
    //     }).execute()

           const fun = await db.insert(bank).values({
            name:`Bank ${i}`,
             branch:`Branch ${i}`
           }).returning({id:bank.id})
           
          await db.insert(account).values({
            accountNumber:`${Math.floor(Math.random()*1000000000000)}`,
            balance:Math.floor(Math.random()*100000),
            bankid:fun[0].id
          })
        }
      
    