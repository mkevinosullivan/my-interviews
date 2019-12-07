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


### Some references
[Rails building json API responses with JBuilder](https://rubyinrails.com/2018/11/10/rails-building-json-api-resopnses-with-jbuilder/)