studip-to-filesystem
====================

Thanks alot to the guy who wrote this tool in the first place! (github.com/flammi)
I have no idea about ruby, so my modifications are currently hard-coded and I'd appreciate your help.
I just forked and modified it, such that the following features are now added:
- being able to download / sign-in to http://e-learning.tu-harburg.de/studip which has different addresses for logging in, also the studip address was hard-coded into the lib-file
- saving the studip documents under ~/documents

This tool is able to copy all files of your courses in the e-learning platform "StudIp" to a folder on your local hard
drive. If the initial copy has finished the tool will fetch the new files and download them.

On the initial copy the tool will create a folder for each course and save the files there. If you doesn't like the
simplified names, simply rename the folders to something you like more. On the next run of the script it will recognize
the rename and update the renamed folders.

### Workflow

![alt text](https://github.com/BubblesToTheLimit/studip-to-filesystem/blob/master/example.png)

### Dependencies

- Ruby >= 1.9
- Nokogiri
- Mechanize
- Highline

### Installation
    $> cd ~/documents
    $> git clone git@github.com:BubblesToTheLimit/studip-to-filesystem.git
    $> apt-get install ruby ruby-highline ruby-mechanize ruby-nokogiri
    $> cd studip-to-filesystem
    open studio.rb with an editor
    $> vim studip.rb
    now edit the 51th line and change it to your documents-path
    from:
    dlDir = "/home/scat666/documents/"+pm.dir_for(course.name, course.cid)
    to:
    dlDir = "/home/your_username/documents/"+pm.dir_for(course.name, course.cid)
    $> ruby studip.rb init http://e-learning.tu-harburg.de/studip
    Username:
    <Enter your Studip username here>
    Password:
    <Enter your studip username here>
    
    From now on to get the newest uploads, just enter the following line. (idea: cronjob?)
    $> ruby ./studip sync
    <The data of your courses are copied now to this dir>
