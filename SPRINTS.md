# Sprints

### Completed and ongoing
- [x] ***Setup*** (no specific branch)
  - Initial file commits after dev init, dev up, install webpacker, etc.
  - Create **Questions**, **Candidates** and **Responses** models, views, controllers using rails scaffold


- [x] ***Basic MVP*** (branch: `basic-mvp-1`)
  - Start with list of all candidates which includes 'Start interview' link
  - 'Start interview' lists all questions in **questions** table, with answer boxes and score selectors (in a form)
  - Submitting responses adds them to **responses** table


- [x] ***Add questionnaires*** (branch: `add-questionnaires`)
  - Add **Questionnaire** MVC
  - Creating a new questionnaire allows user to select questions from list of existing questions
  - Create a join table to link questions to questionnaires


- [x] ***Add concept of job postings*** (branch: `add-jobpostings`)
  - List of job postings becomes starting point (instead of list of candidates)
  - Selecting a job posting shows description and list of candidates linked to that posting
  - The list of candidates with each job posting has a 'Start interview' link beside it (if no responses in **responses** table for that candidate/job posting combination)
  - **responses** now includes reference to originating job posting


- [x] ***Prepare code for initial review*** (branch: `prep-for-review-1`)
  - Update `README` document to describe application, and its intent.  Add a `Setup` section.
  - Add a document to list previous and planned sprints (this doc)
  - Test a clean download of the repo and setup instructions


- [ ] ***Add Bootstrap and "pretty-up" application*** (branch: `add-bootstrap`)
  - Add a navbar with logo
  - Add styles to form elements, buttons, menus, etc.

### Planned (not necessarily in this order)
- [ ] ***Upload file of candidates with job posting*** (branch: `upload-candidates-to-job-posting`)
  - When creating a job posting, at the select candidates step, include option to upload a comma-separated-variable (CSV) file of candidates and link them to that job posting
  - In the general list of candidates page (not via job posting), allow upload of a CSV file of candidates
  - format of CSV file: `first_name, last_name, email`


- [ ] ***Refactor code to use more partials and helpers*** (branch: `add-partials-helpers`)
  - Move code from the views into helpers and/or partials


- [ ] ***Add new question when creating/updating a questionnaire*** (branch: `add-new-question-to-questionnaire`)
  - Currently can only select from existing list of questions when creating/updating a questionnaire
  - Add ability to create a new question and automatically associate to the questionnaire


- [ ] ***Add new questionnaire when creating/updating a job posting*** (branch: `add-new-questionnaire-to-job-posting`)
  - Currently, when creating or updating a job posting, can only select from existing questionnaires
  - Add ability to create a new questionnaire and automatically associate with job posting


- [ ] ***Add rules around record changes*** (branch: `add-biz-rules`)
  - A question **cannot** be deleted/edited if any response exists associated with that question
  - A candidate **cannot** be deleted/edited if any response exists associated with that candidate
  - A job posting **cannot** be deleted/edited if any response exists associated with that job posting
  - A questionnaire **cannot** be deleted/edited if any response exists associated with a job posting that uses that questionnaire


- [ ] ***Add authentication (login)*** (branch: `add-authentication`)
  - Either link to Shopify's Okta capabilities or use Devise gem, or even just basic Rails password_digest


- [ ] ***Add authorization (user roles)*** (branch: `add-authorization`)
  - Add different roles for different types of users, e.g.
    - Interviews (can just select 'Start interview') - can't add job postings/candidates/questionnaires/questions
    - Recruiters - can add job postings/candidates/questionnaires/questions (but bound by )


- [ ] ***Add pagination and search*** (branch: `add-pagination-search`)
  - For adding questions to questionnaires, need pagination and search
  - For adding candidates to job-postings, need pagination (maybe search)


- [ ] ***TBD*** (branch: `tbd-branch-name`)
  - 1
  - 2
