---
layout: post
title: "Don't overload #nil?"
date: 2011-11-09 21:46
comments: true
categories: 
---

There's a popular post on Hacker News about writing confident code by, among
other things, overloading `Object#nil?` and returning "null objects" instead of
nil itself.

__DO NOT DO THIS.__

In Ruby, all objects (except nil itself) coerce to the boolean value `true`.
Your object will be nil and true at the same time. Bad things will happen. Your
coworkers will cry. Sad people from around the world will ask bewildering
questions on your mailing list.

Here's what happens:

```ruby
class NullObject
  def nil?
    true
  end
end

o = NullObject.new

o.nil?             #=> true, great.
!!o                #=> true. not so great.
puts "exists" if o #=> "exists". ut oh.
```

Do you write all your guards using `if o.nil?`  Neither do I.

If you overload `#nil?`, _you will get burned._ Please don't.
