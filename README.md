# OmniAuth SAML RM Unify

An RM Unify SAML strategy for OmniAuth.

https://github.com/hampei/omniauth-saml-rmunify

* It's a simple subclass of omniauth-saml with a rm unify specific info hash.
* Take a look at [rm attributes](http://dev.rmunify.com/reference/understanding-rm-unify/user-attributes.aspx) for descriptions.
* The attribute names have been taken from the manage-app/single-sign-on/saml-p page, underscored for your convenience.
* Read the [list of info attributes](https://github.com/hampei/omniauth-saml-rmunify/blob/master/lib/omniauth/strategies/saml-rmunify.rb) for what is available.

## Requirements

* [omniauth-saml](https://github.com/PracticallyGreen/omniauth-saml) '~> 1.1.0'

## Usage

See omniauth-saml for more options.

In your Rails application:

in `Gemfile`:

```ruby
gem 'omniauth-saml-rmunify'
```

and in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml_rmunify,
    assertion_consumer_service_url: "https://#{app_host}/users/auth/saml_rmunify/callback",
    issuer:                         "https://#{app_host}/rmunify",
    idp_sso_target_url:             "https://sts.platform.rmunify.com/issue/saml/?binding=redirect",
    idp_cert_fingerprint:           "66:cb:2d:02:cd:81:f1:b1:03:22:6b:a0:21:cd:8e:69:0c:5e:f4:25",
end
```

## Authors

Authored by Henk van der Veen.

Maintained by [Henk van der Veen](http://hampei.github.io/).

## License

Copyright (c) 2014 [Henk van der Veen IT.](http://hampei.github.io/).
All rights reserved. Released under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
