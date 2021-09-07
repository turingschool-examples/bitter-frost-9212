# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd bitter-frost-9212`
5. `bundle install`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories

Order up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes.
- Chefs have many dishes
- Dishes belong to a chef
- Dishes have many Ingredients
- Ingredients have many dishes

- Chefs have a name
  - Ex: name: 'Chef Remy'
- Dishes have a name and description
  - Ex: name: 'Pasta Al Dente', description: 'Fresh pasta with your favorite sauce'
- Ingredients should have a name and calories.
  - Ex: name: 'Mozzarella', calories: 78


Two migrations have been made for you. You will need to create migrations for the many to many relationship between ingredients and dishes.
(Note: The plural of dish is dishes. The plural of chef is chefs.)

```
Done [x]
Story 1 of 3
As a visitor
When I visit a dish's show page
I see the dish’s name and description
And I see a list of ingredients for that dish
And I see the chef's name
```   
```   
Done [x]
Story 2 of 3
As a visitor
When I visit a dish's show page
I see the total calorie count for that dish.
```

```
Done [x]
Story 3 of 3
As a visitor
When I visit a chef's show page
I see the name of that chef
And I see a link to view a list of all ingredients that this chef uses in their dishes
When I click on that link
I'm taken to a chef's ingredient index page
and I can see a unique list of names of all the ingredients that this chef uses
```
```   
Done [x]
Extension
As a visitor
When I visit a chef's show page
I see the three most popular ingredients that the chef uses in their dishes
(Popularity is based off of how many dishes use that ingredient)
```
