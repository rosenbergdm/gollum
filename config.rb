=begin
This file can be used to (e.g.):
- alter certain inner parts of Gollum,
- extend it with your stuff.

It is especially useful for customizing supported formats/markups. For more information and examples:
- https://github.com/gollum/gollum#config-file

=end

wiki_options = {
  live_preview: true,
  css: true,
  js: true,
  critic_markup: true
}

Precious::App.set(:wiki_options, wiki_options)
Precious::App.set(:port, 14567)
# enter your Ruby code here ...
