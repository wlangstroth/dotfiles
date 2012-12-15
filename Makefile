# Copy the dotfiles into home, with their '.' prefix

all: gemrc

gemrc:
	cp gemrc ~/.gemrc
