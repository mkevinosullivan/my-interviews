### Setup
- Create a repo in GitHub
- `$ cd ~/src`
- `$ dev clone mkevinosullivan/my-interviews`
- Should already be in `~/src/github.com/mkevinosullivan/my-interviews` directory
- `$ dev init`
  1. Scaffold an entirely new project with a dev.yml (***Second option***)
  2. Pick `rails` as the application
  3. Accept the default port choice
  4. Accept the default ip choice
  5. Pick `NO` to commit these changes
  6. Pick `NO` to commit these changes (again)
  7. Pick `NO` to configure Google Analytics
  8. Pick `YES` for open-source app
- `$ git add -A`
- `$ git commit -m"Initial files from dev init"`
- `$ git push` - to update origin/master in GitHub
- `$ dev up`
- `$ git add -A`
- `$ git commit -m"Initial files from dev init"`
- `$ git push` - to update origin/master in GitHub
- `$ bin/rails webpacker:install`
- `$ dev up`
- `$ dev server` - to check that everything runs, then Ctrl-C
- `$ git add -A`
- `$ git commit -m"Updated files after installing webpacker"`
- `$ git push` - to update origin/master in GitHub
- Install [Sequel Pro](https://www.sequelpro.com/) and connect to the database
  ```
  host = my-interviews.railgun
  username: root
  password: (blank)
  ```

### Building `Questions` MVC
- `$ bin/rails generate scaffold Questions question:text`
- `$ bin/rails db:migrate`
- Update content of `test/fixtures/questions.yml`
- `$ bin/rails test` - should pass immediately without changing anything!
- Edit `db/seeds.db` to populate some initial data
  ```
  questions = Question.create([
    { question: '...' },
    { question: '...' },
    ...
  ])
  ```
- `$ bin/rails db:seed`

### Building `Candidates` MVC
- `$ bin/rails generate scaffold Candidates first_name:string last_name:string email:string`
- Edit `NNN_create_candidates.rb` to look like this
  ```
  class CreateCandidates < ActiveRecord::Migration[6.0]
    def change
      create_table :candidates do |t|
        t.string :first_name, null: false
        t.string :last_name, null: false
        t.string :email, null: false

        t.timestamps
      end
      add_index :candidates, :email
    end
  end
  ```
- `$ bin/rails db:migrate`
- Update content of `test/fixtures/candidates.yml`
- `$ bin/rails test` - create candidate test fails (because it's trying to add an email that's already there - to be resolved)
- Edit `db/seeds.db` to populate some initial data
  ```
  candidates = Candidate.create([
    { first_name: '...', last_name: '...', email: '...' },
    { first_name: '...', last_name: '...', email: '...' },
    ...
  ])
  ```
- `$ bin/rails db:seed`

### Building `Responses` MVC
- `$ bin/rails generate scaffold Responses response:text score:integer`
- Edit `app/models/response.rb` to include `belongs_to :candidate` and `has_one :question`
- Edit `app/models/question.rb` to include `has_many :responses`
- Edit `app/models/candidate.rb` to include `has_many :responses`
- Edit `NNN_create_responses.rb` to look like this
  ```
  class CreateResponses < ActiveRecord::Migration[6.0]
    def change
      create_table :responses do |t|
        t.text :response, null: false
        t.integer :score, null: false

        t.belongs_to :candidate
        t.belongs_to :question

        t.timestamps
      end
    end
  end
  ```
- `$ bin/rails db:migrate`
- Update content of `test/fixtures/responses.yml`
- `$ bin/rails test test/controllers/responses_controller_test.rb` - should pass, but don't - getting `NoMethodError: undefined method 'response' for nil:NilClass` for `create` and `update`

### Some references
[Rails building json API responses with JBuilder](https://rubyinrails.com/2018/11/10/rails-building-json-api-resopnses-with-jbuilder/)