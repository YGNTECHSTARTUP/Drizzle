import { relations } from "drizzle-orm";
import { bigint, boolean, integer,  pgEnum,  pgTable, serial, text, time, varchar } from "drizzle-orm/pg-core";
export const moodEnum = pgEnum('mood',['happy','sad','angry','neutral','confused'])
export const users = pgTable('users',{
    id:serial('id').primaryKey(),
    age:integer('age').notNull(),
    isMale:boolean('isMale').notNull().default(true),
    description:varchar('description',{
        length:1600
    }),
    startAt:time('startAt').defaultNow(),
    mood:moodEnum('mood').default("neutral")
})

export const profiles = pgTable('profiles',{
    name:varchar('name',{
        length:255
    }).notNull(),
    bio:varchar('bio',{
        length:1024
    }).notNull(),
    userId:integer('userId').references(()=>users.id).notNull()
})




export const bank = pgTable('bank',{
    id:serial('id').primaryKey(),
    name:varchar('name',{
        length:255
    }).notNull(),
    branchLocation:varchar('branch',{
        length:255
    }).notNull(),
    bankid:integer('bankid').references(()=>users.id).notNull(),
   

})

export const account = pgTable('account',{
    id:serial('id').primaryKey(),
    accountNumber:text('accountNumber').notNull(),
    balance:integer('balence').notNull(),
    bankcode:integer('bankcode').notNull().references(()=>bank.id),
})  

// Relations 
export const userRelation = relations(users,({one})=>({
   profile:one(profiles,{
    fields:[users.id],
    references:[profiles.userId]
   }),
   bank:one(bank,{
    fields:[users.id],
    references:[bank.bankid]
   })
 }))

 export const bankRelation = relations(bank,({many})=>(
    {
        ac:many(account)
    }
 ))

 export const accountrelation = relations(account,({one})=>(
    {
        bankcode:one(bank,{
            fields:[account.bankcode],
            references:[bank.id]
        })
    }
 ))

 
