import 'core-js/stable';
import 'regenerator-runtime/runtime';

import Rails from "@rails/ujs";
window.Rails = Rails;
import '@rails/actioncable';
import "@hotwired/turbo-rails";
import * as ActiveStorage from "@rails/activestorage";
Rails.start();
ActiveStorage.start();

import '../channels';
import '../controllers';
import '../src/plugins';


// document.addEventListener('turbo:load', function() {
//   console.log('turbo loaded')
// })
