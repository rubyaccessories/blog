# The Standard Librarians

This is a blog for the Rails Girls Summer of Code Volunteer Team The Standard Librarians

#### The Team consists of 

* Jen Diamond
* Stephanie Betancourt
* Josh Loper
* Omowale Oniyide
* Jalil Mohammed

#### Coaching Company 

  **Pivotal Labs:**  
  Mike McCormick, John Ryan, Ryan Moran, Dave Bellotti, Zachary Gershman
  
#### Mentors 

  Pat Maddox

#### The blog can be found on Heroku at (http://thestandardlibrarians.herokuapp.com/)

## Goals of The Standard Librarians

#### Launch a Rails site so the community can easily try out some of the elements of the Ruby Standard Library.

* Create of an in-browser REPL for the Ruby 2.1.2 Ruby Standard Library like TryRuby.org.
* Create an open source learning tool for the community. 
* Making the Ruby Standard Library more accessable for beginners.

#### Use Sinatra to blog about the progress and challenges of the creation. We are using Nesta.

This project involves understanding the Ruby Standard Library, writing guides explaining it, 
creating a repl and the Rails site to host it on.

------------------------------------------
------------------------------------------

# Posting to the Blog

## To create a category in the Sidebar

Create a <blog-category>.haml in the content/pages/ directory.

(use dashes not underscores in the title)

Add the name of your file to the menu.txt file. 
The name you put in the menu.txt file has to match the name in the content/pages directory
for the Category to post to the sidebar.


------------------------------------------

## To create a post

1. Create a <blogpost-title>.mdown Use the format  in the 
2. Use this format:
------------------------------------------

Date: June 11 2014
Author: Jen Diamond
Categories: cat
Summary: cat stuff

\# Cat Pies
Missing until dinner time hate dog
Cat ipsum dolor sit amet, intently sniff hand. Why must they do that behind the couch 
chase imaginary bugs. Chase imaginary bugs.  stretch chew 

<img src="/attachments/screenshot.jpg" class="screenshot">

------------------------------------------

The title of the first h1 tag will be the title of your post.

Do not use another h1 tag in the next line or the first letter of the post won't get 
the proper css styling.


