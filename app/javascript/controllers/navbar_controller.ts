import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["closedIcon", "openIcon", "mobileMenu"];
  declare closedIconTarget: Element | null;
  declare openIconTarget: Element | null;
  declare mobileMenuTarget: Element | null;

  // connect(): void {}

  open(): void {
    if (this.hasClosedIconTarget){
      this.toggleButton(this.closedIconTarget, 'hide');
      this.toggleButton(this.openIconTarget, 'display');
      this.toggleMenu('display');
    }
  }

  close(): void {
    if (this.hasOpenIconTarget){
      this.toggleButton(this.openIconTarget, 'hide');
      this.toggleButton(this.closedIconTarget, 'display');
      this.toggleMenu('close');
    }
  }

  // Toggle the specified attributes classes dependant on it's state
  //
  // @param element [Object]
  // @param state [String]
  private toggleButton(element: Element, state: string): void {
    if (state == 'display'){
      element.classList.add('block');
      element.classList.remove('hidden');
    } else { // hide the element
      element.classList.add('hidden');
      element.classList.remove('block');
    }
  }

  private toggleMenu(state: string): void {
    if (this.hasMobileMenuTarget){
      if (state == 'display'){
        this.mobileMenuTarget.classList.remove('hidden');
      } else { // hide it
        this.mobileMenuTarget.classList.add('hidden');
      }
    }
  }
}
