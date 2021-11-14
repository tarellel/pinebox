import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from 'stimulus-use';

// https://github.com/hotwired/stimulus/blob/7f58b5597292e88423c3fa9ccd0e6f25ffc83192/packages/%40stimulus/core/src/tests/target_controller.ts#L3-L9
// https://github.com/hotwired/stimulus/issues/303#issuecomment-653630360
export default class extends Controller {
  static targets = ["content"];
  declare contentTarget: Element | null;

  connect(): void {
    this.hide();
    useClickOutside(this);
  }

  disconnect(): void {
    this.hide();
  }

  // if the user clicks outside of the dropdown, close it
  clickOutside(): void {
    this.hide();
  }

  toggle(): void {
    if (this.element){
      if (this.element.getAttribute('aria-expanded') == 'true'){
        this.hide();
      } else {
        this.display();
      }
    }
  }

  private display(): void {
    if (this.hasContentTarget){
      this.setAriaExpanded('true');
      this.contentTarget.classList.remove('hidden');
    }
  }

  private hide(): void {
    if (this.hasContentTarget){
      this.setAriaExpanded('false');
      this.contentTarget.classList.add('hidden');
    }
  }

  private setAriaExpanded(val: string): void {
    if (this.element){
      this.element.setAttribute('aria-expanded', val);
    }
  }
}
