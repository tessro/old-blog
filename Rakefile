def jekyll(opts="")
  sh "jekyll " + opts
end

desc "Build site using Jekyll"
task :build => :clean do
  jekyll "build"
end

desc "Destroy _site"
task :clean do
  sh "rm -rf _site"
end

desc "Serve locally"
task :serve do
  jekyll "serve --watch --baseurl /writings"
end

task :default => :serve

desc "Deploy"
task :deploy => :build do
  user = "deploy"
  host = "rosania.org"
  path = "sites/paul.rosania.org/shared/writings/"

  sh "rsync --compress --recursive --checksum --delete _site/ #{user}@#{host}:#{path}"
end
