# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = Question.create([
  { question: 'Why are you interested in the role at Shopify?  What do you know about Shopify as an organization?'},
  { question: 'Tell me about a situation where you came up with a creative or innovative solution to a problem/challenge.  How did you arrive at that solution?  How did you implement it?'},
  { question: 'Working with groups of other people can be challenging.  Tell me about the most challenging group/person you had to work with.  How did you navigate the situation?'},
  { question: 'Tell me about a time when you were working on something important and realized later on that you made a mistake.  What did you do?  What did you learn?'},
  { question: 'How have you grown personally during the time you were completing your degree(s)?  How do you plan on continuing your learning as you move into a full-time job?'},
  { question: 'Are there any questions you anticipated us asking today or any additional details or comments about yourself that you would like to share with us?'},
])

candidates = Candidate.create([
  { first_name: 'Bob', last_name: 'Newhart', email: 'bob.newhart@yahoo.com' },
  { first_name: 'Mike', last_name: 'Tester', email: 'mike@gmail.com' },
  { first_name: 'Suzanne', last_name: 'Richards', email: 'suzanne@outlook.com' },
  { first_name: 'Ann', last_name: 'Pinovsky', email: 'apinovsk@email.net' },
])

questionnaires = Questionnaire.create([
  { description: 'Question set for general developer interviewing'},
  { description: 'Question set for general guru interviewing'}
])

questionnaire = Questionnaire.find(1)
questionnaire.question_ids = [1, 2, 4]

questionnaire = Questionnaire.find(2)
questionnaire.question_ids = [1, 3, 5, 6]

job_postings = JobPosting.create([
  { description: 'Production Engineer (Ottawa, Toronto, Montreal, Waterloo', posting_link: 'https://www.shopify.com/careers/production-engineer-e58182', questionnaire_id: 1},
  { description: 'Customer Success Representative (Ontario) [Expression of Interest]', posting_link: 'https://www.shopify.com/careers/customer-success-representative-ontario-expression-of-interest-fb6fd2', questionnaire_id: 2}
])

job_posting = JobPosting.find(1)
job_posting.candidate_ids = [1, 2, 3]

job_posting = JobPosting.find(2)
job_posting.candidate_ids = [2, 4]
