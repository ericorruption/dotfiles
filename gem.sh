echo 'eval "$(rbenv init -)"' >> ~/Sites/dotfiles/.zshrc
sourcezsh

rbenv install 2.3.1
rbenv global 2.3.1

gem update
gem install rails bundler awesome_print brakeman rails_best_practices
