# URL Shortener

A simple project to generate shorten urls (like bit.ly, tinyurl.com, etc. services) within 5 characters.


<br>

Demo here: https://truong-url-shortener.herokuapp.com

## Getting Started

### Prerequisites

The setups steps expect following libraries/ tools installed on your system.

- Github
- Ruby [3.2.1]
- Rails [7.0.4]
- Bundler [2.4.10]
- PostgreSQL

### Codebase Setup

Check out the repository
```
git clone git@github.com:truongdodang/url-shortener.git
```

Go to the repository
```
cd url-shortener
```

Install gems
```
bundle install
```

### Database Setup

Open database config file `config/database.yml` and update what you like.

Create and migrate database
```
rails db:create
rails db:migrate
rails db:seed
```

### Build

Enable caching on development mode
```
rails dev:cache
```

### Tests
Run and check unit tests
```
bundle exec rspec
```

Run and check rubocop
```
bundle exec rubocop
```

### Start local server
```
rails s
```

Then you can use the shortener service at the URL http://localhost:3000


### How to use

Demo with https://truong-url-shortener.herokuapp.com:

Use curl, postman or any support tools to call apis.

1. Request to get credential (JWT token)
```
curl --location 'https://truong-url-shortener.herokuapp.com/api/request_access' \
--form 'email="admin1@example.com"' \
--form 'password="123456"'
```

2. Request shortened url
```
curl --location 'https://truong-url-shortener.herokuapp.com/api/shorten' \
--header 'Authorization: Bearer xxx.yyy.zzz' \
--form 'original_url="https://www.google.com/"'
```
(with xxx.yyy.zzz is the token string that returned from (1))

3. You can check the returned shorten url from (2) with your browser
```
https://truong-url-shortener.herokuapp.com/abc
```

### Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Frontend
- [PostgreSQL](https://www.postgresql.org/) - Database
- [RSpec](https://rspec.info/) — Testing
- [Heroku](https://heroku.com/) - Deployment

### Contributing
Pull requests are welcome.

### Discussions
1. Performance
2. Security
3. Scale up
4. Documentation
