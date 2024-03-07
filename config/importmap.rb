# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.3
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.3
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.1.3
pin "mapbox-gl" # @3.1.2
pin "process" # @0.11.10
