studip-to-filesystem
====================

Thanks alot to the guy who wrote this tool in the first place!
I have no idea about ruby, so my modifications are currently hard-coded, so I'd appreciate help.
I just forked and modified it, such that the following features are added:
- being able to download / sign-in to http://e-learning.tu-harburg.de/studip which has different addresses for logging in, also the studip address was hard-coded into the lib-file
- saving the studip documents under ~/documents

This tool is able to copy all files of your courses in the elearning plattform "StudIp" to a folder on your local hard
drive. If the initial copy has finished the tool will fetch the new files and download them.

On the initial copy the tool will create a folder for each course and save the files there. If you doesn't like the
simplified names, simply rename the folders to something you like more. On the next run of the script it will recognize
the rename and update the renamed folders.

### Dependencies

- Ruby >= 1.9
- Nokogiri
- Mechanize
- Highline

### Usage
    $> cd ~/documents
    $> git clone git@github.com:BubblesToTheLimit/studip-to-filesystem.git
    $> apt-get install ruby ruby-highline ruby-mechanize ruby-nokogiri
    $> cd studip-to-filesystem
    $> ruby studip.rb init http://e-learning.tu-harburg.de/studip
    Username:
    <Enter your Studip username here>
    Password:
    <Enter your studip username here>
    
    From now on to get the newest uploads, just enter the following line. (idea: cronjob?)
    $> ruby ./studip sync
    <The data of your courses are copied now to this dir>
