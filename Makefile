# Copy the dotfiles into home, with their '.' prefix

put:
	cp bash_profile ~/.bash_profile
	cp gemrc ~/.gemrc
	cp gitconfig ~/.gitconfig
	cp gitignore ~/.gitignore

get:
	cp ~/.bash_profile bash_profile
	cp ~/.gemrc gemrc
	cp ~/.gitconfig gitconfig
	cp ~/.gitignore gitignore
