class ProjectDirManager
  @@directory
  def self.directory
    @@directory
  end  
  def initialize()
    @project_dirs = Hash.new
  end

  #its called with "."
  def import_dirs(wd)
    @@directory = wd
    #the .studipdl-files contain one hash each and are simply read into the project_dirs array
    Dir.glob("#{@@directory}/**/.studipdl").each do |file|
      #puts file
      f = File.new(file, "r")
      cid = f.readline
      course_dir = File.dirname(file)
      @project_dirs[cid] = course_dir
    end
    @project_dirs.size
  end

  def clear()
    @project_dirs.clear
  end
  def clean_up_course_name(course_name)
    #Klammern aus dem Namen entfernen
    clean_up_name = course_name.gsub(/\([^\)]*\)/, "").strip
    #Slashes entfernen
    clean_up_name.gsub("/", " ")
  end

  def dir_for(course_name, cid)
    if not @project_dirs[cid]
      #Create dir
      puts "create new dir here:"+clean_up_course_name(course_name)
      newDir = @@directory+"/"+clean_up_course_name(course_name)
      if not File.directory? newDir
        Dir::mkdir(newDir)
      end

      #Create info file
      File.open("#{newDir}/.studipdl", "w") do |f|
        f.write(cid)
      end
      @project_dirs[cid] = newDir
    end
    @project_dirs[cid]
  end
end
