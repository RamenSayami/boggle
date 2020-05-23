# Ruby on Rails backend for Boggle Game

## Starter guide used:
https://guides.rubyonrails.org/v2.3/getting_started.html


### Ruby version:
##### ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]

### Rails version:
##### Rails 6.0.3

### Node version:
#### v10.18.1 

### npm version:
#### v6.13.4

### yarn version:
#### v1.22.4

### gem version:
#### v3.1.2

### Configuration:
##### Database: sqlite3

### Database initialization:
##### `rails db:seed`

### Services (job queues, cache servers, search engines, etc.)<br/>
#### Wordnet Search API
Side note: Wordnet Search API is quiet slow. Takes anywhere from 20 - 60 seconds.<br/>
So when submitting a word, which is not a correct word recorded in the database, it may take some time. Please be patient.<br/>

### How to run:
##### `rails s`<br/>

This should run the backend server at http://localhost:3000/<br/>

Then run react frontend from: https://github.com/RamenSayami/boggle-game<br/>

