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
    exit!
  end

  Dir.glob(SETTINGS+"/*.vim") do |f|
    FileUtils.ln_s f,File.join(YADR_SETT,File.basename(f)), :force=>true
  end

  if RUBY_PLATFORM =~ /cygwin/i
    puts "Is sygwin"
    `touch ~/.vimrc.before`
    `echo 'let g:yadr_using_unsolarized_terminal = 1' >> ~/.vimrc.before` if `cat ~/.vimrc.before | grep g:yadr_using_unsolarized_terminal`.strip.length==0
    `echo 'set t_Co=256' >> ~/.vimrc.before` if `cat ~/.vimrc.before | grep t_Co=256`.strip.length == 0
  end

  p "Install sucssesful. Enjoy :)"

end

