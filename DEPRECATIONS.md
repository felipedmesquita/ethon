# Deprecations and migration notes

This project emits a few deprecation warnings during the test suite. Below are the messages, why they occur, and how to update your code. These are safe cleanups you can do in your own applications.

## Ethon: Easy#supports_zlib? is deprecated

Message:

> Ethon: Easy#supports_zlib? is deprecated and will be removed, please use Easy#.

Cause:
- Calling the instance method `Ethon::Easy#supports_zlib?`.

Fix:
- Use the class method instead.

Before:
```ruby
easy = Ethon::Easy.new
zlib_supported = easy.supports_zlib?
```
After:
```ruby
zlib_supported = Ethon::Easy.supports_zlib?
```

## ETHON: It is no longer necessary to call Easy#prepare

Message:

> ETHON: It is no longer necessary to call Easy#prepare. It's going to be removed

Cause:
- Explicitly invoking `Ethon::Easy#prepare`.

Fix:
- Remove calls to `prepare`. Initialization and request setup happen automatically via `http_request` and related APIs.

Before:
```ruby
easy = Ethon::Easy.new
# easy.prepare  # remove this
```
After:
```ruby
easy = Ethon::Easy.new
# no explicit prepare needed
```

## ETHON: It is no longer necessary to call Multi#prepare

Message:

> ETHON: It is no longer necessay to call Multi#prepare. Its going to be removed

Cause:
- Explicitly invoking `Ethon::Multi#prepare`.

Fix:
- Remove calls to `prepare`. Use `multi.add(easy)` and `multi.perform` directly.

Before:
```ruby
multi = Ethon::Multi.new
# multi.prepare  # remove this
```
After:
```ruby
multi = Ethon::Multi.new
# no explicit prepare needed
```

## Ethon: Easy#to_hash is deprecated

Message:

> Ethon: Easy#to_hash is deprecated and will be removed, please use #mirror.

Cause:
- Invoking `Ethon::Easy#to_hash` on an `Easy` instance.

Fix:
- Use `Ethon::Easy#mirror` to obtain a `Mirror` and then call `#to_hash` if needed, or directly access data via methods on `Mirror`.

Before:
```ruby
easy = Ethon::Easy.new
# ... perform request ...
result = easy.to_hash
```
After:
```ruby
easy = Ethon::Easy.new
# ... perform request ...
result = easy.mirror.to_hash
```

---

Notes:
- Some specs intentionally exercise deprecated APIs to ensure warnings are emitted and behavior remains compatible while the deprecation period is active.
- For Ruby 3.x environments, `webrick` is added in the development/test group to provide the Rack server used in tests.
- Sinatra is constrained to `~> 2.2` to ensure compatibility with the test helper server implemented under `spec/support/server.rb`.