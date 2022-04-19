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
          <li><a href="#show-customer">Show Customer Info and Subscriptions</a></li>
          <li><a href="#create-tea">Create Tea</a></li>
          <li><a href="#create-subscription">Create Subscription</a></li>
          <li><a href="#update-subscription">Update Subscription</a></li>
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

![Screen Shot 2022-04-18 at 1 33 03 PM](https://user-images.githubusercontent.com/88853324/164088610-90a08833-1d99-45f2-83aa-9a918ed88f3d.png)

----------

## Available Endpoints and Examples
<!-- Add static postman collection here when created -->

### Create Customer

| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /customers | Returns newly created customer as JSON object. If customer already exists, returns existing customer. | /customers?first_name=Meredith&last_name=otwaldG&email=merry@gotty.edu&address=1234 Merry Gotty St. Boulder CO 80304 

<details>
    <summary> JSON response example </summary>

Create Customer:
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

### Show Customer

| http verb | name | description | example |
| --- | --- | --- | --- |
| GET | /customers/:id | Returns customer info and associated subscriptions as JSON object. | /customers/1

<details>
    <summary> JSON response example </summary>

Show Customer:
```json
 {
    "data": {
        "id": "1",
        "type": "customer_and_subscriptions",
        "attributes": {
            "first_name": "Mel",
            "last_name": "Gibson",
            "email": "mel@gibson.com",
            "address": "1234 Hollywood St., Los Angeles, CA, 11111",
            "subscriptions": [
                {
                    "id": 1,
                    "title": "Jasmine Galore",
                    "price": 1500,
                    "status": "cancelled",
                    "frequency": "weekly",
                    "customer_id": 1,
                    "tea_id": 1,
                    "created_at": "2022-04-19T17:11:40.734Z",
                    "updated_at": "2022-04-19T19:59:27.638Z"
                },
                {
                    "id": 2,
                    "title": "Jasmine Galore",
                    "price": 1500,
                    "status": "active",
                    "frequency": "weekly",
                    "customer_id": 1,
                    "tea_id": 1,
                    "created_at": "2022-04-19T17:18:40.329Z",
                    "updated_at": "2022-04-19T17:18:40.329Z"
                },
                {
                    "id": 3,
                    "title": "Jasmine Galore",
                    "price": 1500,
                    "status": "active",
                    "frequency": "weekly",
                    "customer_id": 1,
                    "tea_id": 1,
                    "created_at": "2022-04-19T17:19:27.973Z",
                    "updated_at": "2022-04-19T17:19:27.973Z"
                }
            ]
        }
    }
}
```
</details>


### Create Tea

| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /teas | Returns newly created tea as JSON object. If tea already exists, returns existing tea. | /teas?title=Jasmine&description=A very fine tea&temperature=120&brew_time=180 

<details>
    <summary> JSON response example </summary>

Create Tea:
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

### Create Subscription

| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /subscriptions | Returns newly created subscription, customer info, and tea info as JSON object. | /subscriptions?title=Jasmine Galore&price=1500&customer_id=1&tea_id=1&frequency=weekly 

<details>
    <summary> JSON response example </summary>

Create Subscription:
```json
{
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Jasmine Galore",
            "price": 1500,
            "status": "active",
            "frequency": "weekly",
            "customer": {
                "id": 1,
                "first_name": "Mel",
                "last_name": "Gibson",
                "email": "mel@gibson.com",
                "address": "1234 Hollywood St., Los Angeles, CA, 11111",
                "created_at": "2022-04-18T22:28:04.415Z",
                "updated_at": "2022-04-18T22:28:04.415Z"
            },
            "tea": {
                "id": 1,
                "title": "Earl Grey",
                "description": "This tea is delicious. Full of caffeine. Good for waking up in the morning.",
                "temperature": 180,
                "brew_time": 180,
                "created_at": "2022-04-18T22:28:04.424Z",
                "updated_at": "2022-04-18T22:28:04.424Z"
            }
        }
    }
}
```
</details>

### Update Subscription

| http verb | name | description | example |
| --- | --- | --- | --- |
| PATCH | /subscriptions | Returns updated subscription info as JSON object. | /subscriptions?id=1&status=cancelled

- Note: You can use this endpoint to update any attributes for a Subscription as outlined in the database schema. Simply add them as params after the subscription ID (IE: `?id=1&title=Changed Title&price=1399@frequency=monthly`)
<details>
    <summary> JSON response example </summary>

Update Subscription:
```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Jasmine Galore",
            "price": 1500,
            "status": "cancelled",
            "frequency": "weekly",
            "customer": {
                "id": 1,
                "first_name": "Mel",
                "last_name": "Gibson",
                "email": "mel@gibson.com",
                "address": "1234 Hollywood St., Los Angeles, CA, 11111",
                "created_at": "2022-04-18T22:28:04.415Z",
                "updated_at": "2022-04-18T22:28:04.415Z"
            },
            "tea": {
                "id": 1,
                "title": "Earl Grey",
                "description": "This tea is delicious. Full of caffeine. Good for waking up in the morning.",
                "temperature": 180,
                "brew_time": 180,
                "created_at": "2022-04-18T22:28:04.424Z",
                "updated_at": "2022-04-18T22:28:04.424Z"
            }
        }
    }
}
```
</details>

----------

## Built By
