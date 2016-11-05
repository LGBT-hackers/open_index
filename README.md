# Open Index

### About the Project
Open Index aims to be a well-rounded indicator of minority group experiences in the workplace across companies. Similar to Glassdoor, users can post reviews about the workplace and rate different aspects from strongly disagree to strongly agree. At the hackathon, we focussed on LGBTQ+ specific issues, modeling the questions from the StoneWall workplace index.


We hope to expand Open Index to include questions for different minority groups to share their experiences.


Ruby version: 2.3.0

### Installation instructions
```
$ git clone https://github.com/LGBT-hackers/open_index.git
$ cd open_index
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

### To run the server:
```
$ rails s
```
