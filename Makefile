all:
	coffee -o . -c src/jquery.email-protector.coffee
	uglify -o jquery.email-protector.js -s jquery.email-protector.js
