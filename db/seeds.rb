# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: "georgescu.cristi@gmail.com", password: "Parola12345", password_confirmation: "Parola12345", first_name: "Cristian", last_name: "Georgescu", bio: "ESPCOP admin")
#SubscriptionPlan.create!(name: "ESPCOP Membership",  amount:"50", currency:"eur", interval_count:"1", interval:"year", statement_descriptor:"ESPCOP Membership Plan", tokens: 1, visible: true)
#User.crate!(email: "georgescu.cristi@gmail.com", password:"Parola12345", password_confirmation:"Parola12345", subscription_plan_id: 1)

Newsletter.create!(date:"18-07-2016",title:"Obesity Anaesthesia July Newsletter 2016",url:"http://eepurl.com/bOD4A1")
Newsletter.create!(date:"06-02-2016",title:"Obesity Anaesthesia February Newsletter 2016",url:"http://eepurl.com/bKRj0v")
Newsletter.create!(date:"23-12-2015",title:"Happy Winter Holidays !!!",url:"http://eepurl.com/bKOker")
Newsletter.create!(date:"15-12-2015",title:"6th ESPCOP Meeting",url:"http://eepurl.com/bCKbN5")
Newsletter.create!(date:"23-10-2015",title:"Obesity Anaesthesia October Newsletter 2015",url:"http://eepurl.com/bDEV8X")
Newsletter.create!(date:"13-10-2015",title:"6th ESPCOP Meeting",url:"http://eepurl.com/bClNwz")
Newsletter.create!(date:"03-09-2015",title:"Reminder: Last call for abstract submission for the 4th Annual ISPCOP Symposium!",url:"http://eepurl.com/bx627X")
Newsletter.create!(date:"13-07-2015",title:"Obesity Anaesthesia July Newsletter 2015",url:"http://eepurl.com/bs0jM9")
Newsletter.create!(date:"25-05-2015",title:"Obesity Anaestesia May News 2015",url:"http://eepurl.com/bolFPr")
Newsletter.create!(date:"12-04-2015",title:"Obesity Anaestesia April News 2015",url:"http://eepurl.com/bjD-Kv")
Newsletter.create!(date:"23-03-2015",title:"Obesity Anaestesia March Newsletter 2015",url:"http://eepurl.com/bhNT41")
Newsletter.create!(date:"24-12-2014",title:"Happy Winter Holidays",url:"http://eepurl.com/_8bF9")
Newsletter.create!(date:"16-12-2014",title:"Don’t miss the 5th ESPCOP Meeting!",url:"http://eepurl.com/_k1nH")
Newsletter.create!(date:"08-10-2014",title:"October ESPCOP Newsletter",url:"http://eepurl.com/5gmBH")
Newsletter.create!(date:"08-09-2014",title:"ESPCOP Invitations Newsletter",url:"http://eepurl.com/2EMN1")
Newsletter.create!(date:"24-05-2014",title:"May ESPCOP Newsletter",url:"http://eepurl.com/VcxC9")
Newsletter.create!(date:"17-04-2014",title:"Invitation for Anaesthesia Session at IFSO European Chapter on 2nd of May",url:"http://eepurl.com/STBe9")
Newsletter.create!(date:"02-03-2014",title:"March ESPCOP Newsletter",url:"http://eepurl.com/Pu4CH")
Newsletter.create!(date:"02-03-2014",title:"March ESPCOP Newsletter",url:"http://eepurl.com/O0-Nz")
Newsletter.create!(date:"21-12-2013",title:"Happy Winter Holidays",url:"http://eepurl.com/LeKiD")


