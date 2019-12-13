# my-interviews

**my-interviews** is a web application for recruiters and interviewers who need to perform phone screen type interviews (or other screening type interviews) of a mass group of applicants to a job posting.

The application centres around **job postings** that link a list of **candidates** with a **questionnaire**. A **questionnaire** is a collection of **questions** for a specific type of interview (can be used for multiple job postings).  After one or more interviews are completed, **responses** are stored for each question/candidate/job posting combination.

## Setup
- `$ dev clone mkevinosullivan/my-interviews` (or `git clone https://github.com/mkevinosullivan/my-interviews`)
- `$ dev up` in directory where repo is saved
- `$ yarn install --check-files`
- `$ dev server`
- Ctrl-T to open browser to application.

## Use
- The logical place to start is by adding a **job posting**.  The application will check if there are any **questionnaires** to use with a **job posting** and if there aren't any, it will send you over to the **questionnaires** section where you can create one.  Of course, the **questionnaires** section will check if there are any **questions**, and if there are none, it'll send you over to **questions** to create some **questions**!
- So, the smarter place to start is with adding some **questions**, then create a **questionnaire** made up of one or more of those **questions**, then create a **job posting** using that **questionnaire**.  You don't have to have any **candidates** yet to complete creation of the **job posting**.
- Next, add some **candidates**, and return to the **job posting** section to link some **candidates** to the **job posting** you created.
- When you show the **job posting**, you should have a list of **candidates** with 'Start interview' links - so, start an interview!
- When you've completed the interview, you should see a 'review' link, where you can review the **responses** of the **candidate**.

## Models
- `Candidate`
  - `first_name` - String
  - `last_name` - String
  - `email` - String
- `JobPosting`
  - `description` - Text
  - `posting_link` - String (intended to be a URL to job description)
  - `questionnaire_id` - identifier of associated `Questionnaire`
- `Questionnaire`
  - `description` - Text
- `Question`
  - `question` - Text
- `Response`
  - `response` - Text
  - `score` - Integer
  - `candidate_id` - identifier of associated `Candidate`
  - `question_id` - identifier of associated `Question`
  - `job_posting_id` - identifier of associated `JobPosting`


- There are two join tables also - one linking `Candidate`'s with `JobPosting`'s, and another linking `Question`'s with `Questionnaire`'s.


- In terms of associations:
  - `JobPosting` can have only one `Questionnaire`
  - `Questionnaire` can have many `Question`'s
  - `Question`'s can belong to many `Questionnaire`'s
  - `Candidate`'s can belong to many `JobPosting`'s
  - `Response`'s have only one `Question`, only one `JobPosting` (through the `Questionnaire` associated with that `JobPosting`), and only one `Candidate`