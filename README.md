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


## To do
- Need implement other methods
- Add more tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
