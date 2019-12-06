- Create a repo in GitHub
- `$ cd ~/src`
- `$ dev clone mkevinosullivan/my-interviews`
(already in `~/src/github.com/mkevinosullivan/my-interviews`)
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
- `$ rails webpacker:install`
- `$ dev up`
- `$ dev server` - to check that everything runs, then Ctrl-C
- `$ git add -A`
- `$ git commit -m"Updated files after installing webpacker"`
- `$ git push` - to update origin/master in GitHub
