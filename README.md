#Description

This is an app written with Ruby, Rails, and Javascript that manages a database of enrollment records. Through this app you can enroll, screen, unenroll, and edit enrollment records, as well as view the enrollment history of a record.

Integration tests are also included.

Additional features:
- Search feature - allows you to filter your list of enrollments based off of certain attributes
- Export - search results will be exported to a local CSV file.
- Import - add or update enrollment records through an import of a CSV file.
- Table sorting, pagination, etc.

#Setup Instructions

Once you have your Ruby and Rails environments set up (which you can find details for here: http://guides.rubyonrails.org/getting_started.html) and your MySQL server running (which you can find details for here: https://dev.mysql.com/doc/refman/5.5/en/windows-server-first-start.html), then:

1. Run `rake db:create` (in your command line)
2. Run `rake db:seed` (without the "migrate" folder in the project)
3. Run `rake db:migrate`
4. Run `rails s` in your console
5. Go to "localhost:3000" in your browser
6. To run tests, run `rspec`

Or check out the live site [here.](https://sheltered-eyrie-5331.herokuapp.com/active)

#Additional Features:

###Search filter

Simply select the attribute and condition you want to filter your search results on and click the "Search" button.

###Exporting

Click the "Export CSV" button on the main page and your search results will immediately download to a CSV file.

###Importing

Click the "Import CSV" button on the main page and select a file to either add or update enrollment records.

NOTE: See the two sample import files found in the `public` folder.

#Author

Ben Pritchard

ben.s.pritchard@gmail.com

**Thanks for checking it out!**
