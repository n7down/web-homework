# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Homework.Users.User
alias Homework.Merchants.Merchant
alias Homework.Companies.Company
alias Homework.Transactions.Transaction
alias Homework.Repo

# companies
%Company{name: "parks and recreation", credit_line: 1000} |> Repo.insert!()

company = Homework.Companies.get_company_by_name!("parks and recreation") 

# users
%User{first_name: "leslie", last_name: "knope", dob: "01181975", company_id: company.id} |> Repo.insert!()
%User{first_name: "april", last_name: "ludgate", dob: "04131989", company_id: company.id} |> Repo.insert!()
%User{first_name: "andy", last_name: "dwyer", dob: "01011981", company_id: company.id} |> Repo.insert!()
%User{first_name: "ron", last_name: "swanson", dob: "05061970", company_id: company.id} |> Repo.insert!()
%User{first_name: "donna", last_name: "meagle", dob: "04121970", company_id: company.id} |> Repo.insert!()
%User{first_name: "ann", last_name: "perkins", dob: "07201976", company_id: company.id} |> Repo.insert!()
%User{first_name: "ben", last_name: "wyatt", dob: "11171974", company_id: company.id} |> Repo.insert!()
%User{first_name: "jerry", last_name: "gergich", dob: "01291948", company_id: company.id} |> Repo.insert!()
%User{first_name: "tom", last_name: "haverford", dob: "04281985", company_id: company.id} |> Repo.insert!()
%User{first_name: "jean-ralphio", last_name: "saperstein", dob: "12121986", company_id: company.id} |> Repo.insert!()
%User{first_name: "chris", last_name: "traeger", dob: "10261967", company_id: company.id} |> Repo.insert!()
%User{first_name: "tammy", last_name: "swanson", dob: "04221965", company_id: company.id} |> Repo.insert!()

# merchants
%Merchant{name: "very good building co", description: "ron swanson finally jumped overboard from the local government ship and decided to do what he does best - build things."} |> Repo.insert!() 
%Merchant{name: "entertainment 720", description: "the silver-medal winning business of this list is special for one particular reason - we're still not entirely sure what it does."} |> Repo.insert!() 
%Merchant{name: "sweetums", description: "arguably the most famous of all pawnee establishments, sweetums quickly became a staple of the series as the candy-company found it's way into every nook and cranny that the show could fit them into."} |> Repo.insert!() 
%Merchant{name: "tom's bistro", description: "tom's bistro was a breath-of-fresh-air compared to the rest of tom's possible business endeavors since it was simply a restaurant that had tom's name on it."} |> Repo.insert!() 
%Merchant{name: "gryzzl", description: "a tech company that quickly begins to take over the world."} |> Repo.insert!() 
%Merchant{name: "rent-a-swag", description: "even ignoring the hilarious concept that a grown man's entire wardrobe could fill a boutique and fit a bunch of pre-tweeners, the business of rent-a-swag was gold from the start."} |> Repo.insert!() 
%Merchant{name: "the snakehole lounge", description: "the snakehole lounge is one of pawnee's most memorable establishment."} |> Repo.insert!() 
%Merchant{name: "paunch burger", description: "their burgers are poison and full of wasps but they sure do taste good, though!"} |> Repo.insert!() 
%Merchant{name: "wamapoke casino", description: "the wamapoke casino is their way of, 'slowly taking back their money back from white people, one quarter at a time.'"} |> Repo.insert!() 
%Merchant{name: "cozys bar", description: "every person in pawnee would be flocking too simply to get an earful from their favorite jazz saxophonist, duke silver."} |> Repo.insert!() 

merchant = Homework.Merchants.get_merchant_by_name!("paunch burger") 
knope_user = Homework.Users.get_user_by_last_name!("knope") 
saperstein_user = Homework.Users.get_user_by_last_name!("saperstein") 

%Transaction{amount: 30, credit: true, debit: false, description: "bought a paunch burger", merchant_id: merchant.id, user_id: knope_user.id, company_id: company.id} |> Repo.insert!()
%Transaction{amount: 50, credit: true, debit: false, description: "bought a large paunch burger", merchant_id: merchant.id, user_id: saperstein_user.id, company_id: company.id} |> Repo.insert!()

