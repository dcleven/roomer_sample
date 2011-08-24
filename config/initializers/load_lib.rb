# Load all the files from the lib directory
lib_home =  File.join(Rails.root.to_s, 'lib', "*.rb")
Dir[lib_home].each {|file| require file }