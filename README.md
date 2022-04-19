<!-- Maybe add a photo here -->

# Mod4 Solo Project: Tea Time

reference: [Project Specs and Overview](https://mod4.turing.edu/projects/take_home/)

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#getting-started">Getting Started</a></li>
    <ul>
      <li><a href="#versions">Versions</a></li>
      <li><a href="#dependencies">Dependencies</a></li>
      <li><a href="#set-up">Setup Repo</a></li>
      <li><a href="#project-description">Project Description</a></li>
    </ul>
    <!-- Available Endpoints and Examples -->
    <li>
      <details>
        <summary><a href="#available-endpoints-and-examples">Available Endpoints and Examples</a></summary>
        <ul>
          <li><a href="#create-customer">Create Customer</a></li>
          <li><a href="#create-tea">Create Tea</a></li>
        </ul>
      </details>
    </li>
    <li><a href="built-by">Built By</a></li>
  </ol>
</details>
  

----------

## Getting Started

### Versions

- Ruby 2.7.2
- Rails 5.2.7

----------

### Dependencies

- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)

- API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993), [faraday](https://github.com/lostisland/faraday)

- Linting: [rubocop](https://github.com/rubocop/rubocop)

----------

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:jbreit88/tea_time.git`
2. Navigate to the newly cloned directory `$ cd tea_time`
3. If bundler is not installed onm your local machine run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required Gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

----------

## Project Description

This is a back-end project designed to implement the skills necessary to build and expose an API for a front-end team to consume.

----------

## Available Endpoints and Examples
<!-- Add static postman collection here when created -->

###  Create Customer

| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /customers | Returns newly created customer as JSON object. If customer already exists, returns existing customer. | /customers?first_name=Meredith&last_name=otwaldG&email=merry@gotty.edu&address=1234 Merry Gotty St. Boulder CO 80304 

<details>
    <summary> JSON response example </summary>

Create User:
```json
  {
    "data": {
        "id": "2",
        "type": "customer",
        "attributes": {
            "first_name": "Meredith",
            "last_name": "Gotwald",
            "email": "merry@gotty.edu",
            "address": "1234 Merry Gotty St. Boulder CO 80304"
        }
    }
}
```
</details>

###  Create Tea

| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /teas | Returns newly created tea as JSON object. If tea already exists, returns existing tea. | /teas?title=Jasmine&description=A very fine tea&temperature=120&brew_time=180 

<details>
    <summary> JSON response example </summary>

Create User:
```json
  {
    "data": {
        "id": "2",
        "type": "tea",
        "attributes": {
            "title": "Jasmine",
            "description": "A very fine tea",
            "temperature": 120,
            "brew_time": 180
        }
    }
}
```
</details>

----------

## Built By
