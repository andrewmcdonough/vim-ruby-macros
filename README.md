# Vim Ruby Macros

This is an experiment for using Ruby to create macros/template for common code structures I write.

# Boilerplate class

In vim, highlight a list of keywords in visual mode and run this to get a class boilerplate

```
:'<,'>! ~/{repo}/{path}/bin/filter.rb
```
