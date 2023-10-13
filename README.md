# fruby

a (probably dumb but) flexible way to write ruby code.

## installation

maybe don't just yet. this is very much still a proof of concept.

## usage

```ruby
# app/foo.rb
y do
  def bar
    puts "bar!"
  end
end

Foo.new.bar # => "bar!"

# app/baz.rb
y from: Foo do # inherit from Foo
  def qux
    puts "qux!"
  end
end

Baz.new.qux # => "qux!"
Baz.new.bar # => "bar!"
```

fruby will automatically define a class for you based on the file name. in this case, `Foo` will be defined as a subclass of `Object`.

## but y?

how many times have you renamed a file and then forgotten to change the class name? convention is a great idea, but what's the source of truth? the file name or the class name? why should we have to write everything twice?
