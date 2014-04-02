all:
	coffee -o . -c src/jquery.email-protector.coffee
	uglifyjs -o jquery.email-protector.js jquery.email-protector.js
