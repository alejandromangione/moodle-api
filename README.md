# Moodle API

Gem to connect on Moodle API

## Installation

Add this line to your application's Gemfile:

```
gem 'moodle-api', git: 'git://github.com/alejandromangione/moodle-api.git', branch: 'master'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install moodle-api -s http://github.com/alejandromangione/moodle-api
```

## Usage

```
Moodle::Connector.mdl_url = "http://someurlmoodle.com"
Moodle::Connector.mdl_token = "token"
Moodle::Connector.course_by_id(5)
```

## Configuration

Create a file `config/initializers/moodle_api.rb` and add a configuration block like:

```
require 'moodle'

Moodle::Connector.setup do |config|
  config.mdl_url = 'http://urlmoodle.com'
  config.mdl_token = 'token'
  config.mdl_first_password = 'P@ssword123'
end
```

## Methods

| Method | Params |
|--------|--------|
| course_by_id | id (Number) |
| user_by_email | email (String) |
| user_by_username | username (String) |
| enrol_user | user_mdl_id (Integer), course_mdl_id (Integer) |
| enrol_user_suspend | user_mdl_id (Integer), course_mdl_id (Integer), suspend (0 or 1) |
| create_user | user_hash (email, firstname, lastname, city, state, cpf, address, number_address, complement, neighborhood, cep) |
| get_courses | void |
| reset_password | reset_password (String) |
| valid_user? | username (String), password (String) |



## To do
- Need implement other methods
- Add more tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
