// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from '@hotwired/stimulus';
import { registerControllers } from 'stimulus-vite-helpers';
// application.warnings = true
// application.debug    = false
// window.Stimulus      = application

const application = Application.start();
const controllers = import.meta.globEager('./*_controller.{js,ts}');
registerControllers(application, controllers);
