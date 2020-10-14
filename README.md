# README

Curbalert allows users to post images and details of things people are giving or throwing away in their area, becoming viewable on a public map. Assisted by Google Directions, users can make their way to hidden treasures that are simply going to waste.

## Curbalert-Backend  
Curbalert-Backend is a Ruby on Rails with PostgreSQL backend API for Curbalert-Frontend. This DB saves models for users, posts, items, and dashboards. Active Storage is also utilized to store post images onto cloud service AWS S3 bucket.
  
## Start. 
To begin backend, run 'bundle install'.  
Then rails db:migrate to create database.  
Then run rails s to start the local server, which will create endpoints /items, and /users.  

## Curbalert Frontend  
Curbalert-Backend works alongside Curbalert-Frontend, built React along with styling framework Semantic UI React and CSS Transition Group library. API's included are Geolocation API, Google Directions API, and Leaflet API. For image storage, Curbalert Backend uses Rails with active storage enabled, which uses AWS S3 Cloud to store images.  
