# USER-AUTHENTICATE
## Description

This API REST with RUBY.

## Installation
Using Ruby on Rails and Gems Knock, JWT.

## Usage
```html
$ git clone https://github.com/DanielArturoAlejoAlvarez/user-authenticate.git [NAME APP] 

$ bundle install

$ rails s
```
Follow the following steps and you're good to go! Important:


![alt text](https://i.gifer.com/Rbt2.gif)


## Coding

### Controller

```ruby
class UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token, raise: false
end
```

### Model 

```ruby
class User < ApplicationRecord
    has_secure_password

    validates_length_of :password, maximum: 72, minimum: 6, allow_blank: false, allow_nil: false

    validates_presence_of :username
    validates_presence_of :email

    validates_uniqueness_of :username
    validates_uniqueness_of :email
end
```

### CONFIG 

```ruby
#JWT and Knock
Knock.setup do |config|  
  config.token_lifetime=1.week # life time 1 week
  config.token_signature_algorithm='HS256' # SHA256
  config.token_secret_signature_key= -> Rails.application.secrets.secret_key_base} # KEY auto generate
end
```

### SERIALIZER 

```ruby
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
end
```

### ROUTES 

```ruby
Rails.application.routes.draw do
  root 'home#index'
  get 'auth'            =>  'home#auth'
  post 'user_token'     =>  'user_token#create'
  get '/users'          =>  'users#index'
  post '/users/create'  =>  'users#create'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DanielArturoAlejoAlvarez/user-authenticate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).



# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
