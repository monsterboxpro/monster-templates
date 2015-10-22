# Monster  Templates

Adds your HTML templates into Angular's `$templateCache` using Rails asset pipeline.
It removes the need for AJAX calls to retrieve the templates (or for you to manually set them into the DOM). Any markup that Tilt supports can be used.

## Usage

### 1. Add the Gem

In Gemfile

```ruby
gem 'monster-templates', github: 'monsterboxpro/monster-templates'
```

### 2. Update your application.coffee

In your `application.coffee` file, require `monster-templates`:

```coffeescript
#= require angularjs
#= require monster-templates
```
### 3. Templates Directory

Create a /app/templates directory. Any template found in here will be made avaliable to you in angularjs.

### 3. User your Template

Lets say we have the following templates:
```
app/templates/admin/users/index.html.haml
app/templates/projects/show.haml
```

by convention its the path without the file extension
```coffescript
  states.state 'users' , url: '/users', templateUrl: 'admin/users/index'
  states.state 'project', url: '/projects/:id', templateUrl: 'projects/show'  
```

### 3. You can use Partials

You can use partials like you normally would:
```
app/templates/items/index.erb
app/templates/items/_item.erb
```
be aware you can not use partials as `templateURL` since they are not compiled to `templateCache`

### 4. You Have Access to Helper Methods

We automatically include `ApplicationHelper` so any functions you define in there will be accessible to you in your app/templates templates.

### TODO

- [ ] TravisCI
- [ ] Basic Configuration options (change dir name)
- [ ] Load All Helpers or specific in config file


This project rocks and uses MIT-LICENSE.
