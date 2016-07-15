# _{Ruby Salon}_

#### _{SQL databse webApp imitating a hair salon website}

#### By _**{Liam Ellis}**_

## Description

_{Application is built in Ruby. Sinatra is the web server of choice. Database is SQL featuring a one to many relationship. Specs are written in RSPEC and capybara for unit and integration tests respectively }_

## Setup/Installation Requirements

*_clone the repo
* CREATE DATABASE hair_salon;
* _ \c hair_salon
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
* CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;



## Known Bugs
_{No known bugs}_

## Support and contact details

_{Liam Ellis: liamhellis@gmail.com}_

## Technologies Used

_{Ruby, SQL, Postgres, Capybara, Rspec, Sinatra}_
