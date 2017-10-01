Survey/Quiz sample application using Ruby 2.3.1 and Rails 5.1.4
=======
# Survey

- [x] Shows to a user a simple Quiz, that has 5 questions as 5 separate pages, shown one after another. 
- [x] Each question will have 2-5 predefined answers that user can pick from, open answers are not possible. No backend for managing questions is needed.
- [ ] After the quiz user should see the results page with answers distribution for each question from all users who completed the quiz (answered all 5 questions).
- [x] The user should not be able to access next question without answering current, or going back to previous questions.
- [x] No login for users should be required.
- [x] The user should be able to do the quiz only once (We expect that users always use default browser settings and don't use incognito).

Requirements:

- [x] Testwork should be done using ruby framework of your choice.
- [x] Any gems are allowed
- [x] Quiz should have backend rendering
- [ ] Please try to make the interface as user-friendly as possible

## Usage

1. Bundle dependencies

  `$ bundle install`

2. Seed initial data

  `$ bundle exec rake db:seed`

3. Start application in development mode

  `$ bundle exec rails s`

4. Open browser at `http://localhost:3030/`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ndemianc/survey
