# README

#   TEST-SIMONE

### Introduction ###

The purpose of this API v1 is to display informations about potato prices on the market.

With this v1 api, you will be able to:
- get potato prices for a given date,
- get best profit possible for a given date.

### Prerequisites ###

Make sure these tools are installed on your machine:
- ruby version "3.2.1" => the coding language [https://www.ruby-lang.org/fr/]
- git => an open source version control system [https://git-scm.com/]

You will also need:
- a relational database => the project uses postgreSQL [https://www.postgresql.org/], but you can use another relational database (see below).

### Installation ###

- Clone this repository => replace `my project_name` with the name you choose for your app
`git clone git@github.com:Stef-Rousset/test-simone.git my_project_name`
- Move into the project you created =>
`cd my_project_name`
- If you want to change the db for mySQL for example =>
 `rails db:system:change --to=mysql`
- Install dependencies =>
`bundle install`
- Initialize the database =>
`rails db:create db:migrate db:seed`
- If you need minimum data to play with api =>
`rails db:seed`
- You can launch the server with `rails s`.<br>
The server should only run on `localhost:3000`.<br>
You should see the homepage of Rails application.
If you want to stop the server, use Ctrl + C.<br>

### Application endpoints ###

To get data, you have to provide a date in format "YYYY-MM-DD" or "DD-MM-YYYY"
The available endpoints are :

- Get all potato prices for a given date<br>
GET `/api/v1/potato_prices?date=YYYY-MM-DD`<br>
*ex of response:* <br>
  `[{ "time": "2022-08-22T09:00:00.000Z", "value": 100.25}, {...}]`
- Get best possible profit for a given date<br>
GET `/api/v1/potato_prices/best_profit?date=YYYY-MM-DD`<br>
*ex of response:* <br>
  `{ "best_profit": "100.25€"}`

### Testing ###

Testing is performed with Rspec.

- testing the models =>
`rspec spec/models`
- testing the controllers =>
`rspec spec/controllers`
- testing values =>
`rspec spec/services`
- testing helpers =>
`rspec spec/helpers`

