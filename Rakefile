require 'rake'
require 'fileutils'


YADR_SETT = File.join(ENV['HOME'],'.yadr/vim/settings')
BASE = File.expand_path('..',__FILE__);
SETTINGS = File.join(BASE,'vim/settings')

desc 'Install'
task :install do

  if ! File.directory?(YADR_SETT)
    p ""
    p "YARD not installed."
    p "See https://github.com/skwp/dotfiles for install YADR"
    p ""
  end

  Dir.glob(SETTINGS+"/*.vim") do |f|
    FileUtils.ln_s f,File.join(YADR_SETT,File.basename(f)), :force=>true
  end

  p "Install sucssesful. Enjoy :)"

end

