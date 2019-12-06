 1. Create a repo in GitHub
 2. `$ cd ~/src`
 3. `$ dev clone mkevinosullivan/my-interviews`
(already in `~/src/github.com/mkevinosullivan/my-interviews`)
 4. `$ dev init`
    1. Scaffold an entirely new project with a dev.yml (***Second option***)
    2. Pick `rails` as the application
    3. Accept the default port choice
    4. Accept the default ip choice
    5. Pick `NO` to commit these changes
    6. Pick `NO` to commit these changes (again)
    7. Pick `NO` to configure Google Analytics
    8. Pick `YES` for open-source app
 5. `$ git add -A`
 6. `$ git commit -m"Initial files from dev init"`
 7. `$ dev up`
(updated `.gitignore` to ignore `/*.log`)
 8. `$ git add -A`
 9. `$ git commit -m"Initial files from dev init"`
10. `$ rails webpacker:install`
11. `$ dev up`
12. `$ dev server` - to check that everything runs