## Posting to the Ruby Accessories Blog.

Create a new document inside of the $content/pages directory.

It is easiest to run `$ cp <an-old-blog-post-filename.mdown>  <your-new-post-filename.mdown>`

Name it with the appropriate date and your name like this:  
wk01-day01-mon-yourname-rubyaccessories.mdown

#### Formatting is crucial for your post to show up on the site. 
 
##### There are 3 elements that you cannot vary from  

1. the Date 
2. the author
3. an h1 tag


**like this:**  

    Date: 23 July 2014  
    Author: your name  
    
    Your Heading


The easiest thing to do is to use an old post, rename it and change the info.

### To run the blog locally runc `$ mr-sparkle config.ru`

#### Use Sinatra to blog about the progress and challenges of the creation. We are using Nesta.

To run it from an instance of groundwork's vagrant use [http://33.33.33.33:8080/team-bios](http://33.33.33.33:8080/team-bios)
