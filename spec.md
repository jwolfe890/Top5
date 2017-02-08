# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
There are a few has_many relationships in the project. User has_many lists, and List has_many :list_topics and List has_many ratings

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
List belongs to User

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)

has_many :raters, through: :ratings, class_name: "User", foreign_key: 'rated_id'

List has many Topics through ListTopics

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

has_many :raters, through: :ratings, class_name: "User", foreign_key: 'rated_id'

Rating has a "rating" attribute

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

Title and numbers need to be filled in

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

scope :non_user_lists, lambda { |current| where.not(:user_id => current.id) }
scope :recent, -> { order('created_at desc').limit(5) }
scope :topic_finder, lambda { |item| where(topic_id: Topic.find(item).id) }

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

It's visible in Lists/new and in the List model

- [x] Include signup (how e.g. Devise)
Devise

- [x] Include login (how e.g. Devise)
Devise

- [x] Include logout (how e.g. Devise)
Devise

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
Devise/OmniAuth

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
users/:id/lists

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
new_user_list_path(current_user.id)

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
Flash messages

Confirm:
- [x] The application is pretty DRY
As much as I could possibly make it. 

- [x] Limited logic in controllers
I moved all methods to the models when possible and incorporated callbacks

- [x] Views use helper methods if appropriate
Didn't need any from what I could tell

- [x] Views use partials if appropriate
I used a form partial for List new/edit

