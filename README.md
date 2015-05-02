studip-to-filesystem
====================

Thanks alot to the guy who wrote this tool in the first place! (github.com/flammi)
The following features have been added:
- download from the TUHH studip
- save the studip documents under any given path

This tool is able to copy all files of your courses in the e-learning platform "StudIp" to a folder on your local hard
drive. If the initial copy has finished the tool will fetch the new files and download them.

On the initial copy the tool will create a folder for each course and save the files there. If you doesn't like the
simplified names, simply rename the folders to something you like more. On the next run of the script it will recognize
the rename and update the renamed folders.

If this tool doesnt work for your studip-platform (this one is optimized for tuhh), change the paths in [lib/studip.rb](lib/studip.rb) accordingly.

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
    $> ruby studip.rb init http://e-learning.tu-harburg.de/studip
    $> ruby studip.rb sync
