Crowdsourcing Conference 2012
=============================

http://www.conferenciacrowdsourcing.com.br/

Install
-------

Clone the project
  `git clone git://github.com/softa/ccs12.git`

Enter in your app folder
  `cd ccs12`

Install dependencies
  `bundle install`

Run the tests
  `rake spec`

Start the Server
  `rails server`

Setting the environment variables
---------------------
  create this file https://github.com/softa/ccs12/blob/f4c92725354fb5389c7ce51acc3d5fece68e766e/config/heroku.yml in config/heroku.yml

  To export the settings to Heroku, run:
    `thor -T`