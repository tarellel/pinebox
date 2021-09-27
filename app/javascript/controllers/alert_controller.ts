import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  public connect(): void {
    setTimeout(() => {
      this.close();
    }, 2500);
  }

  public close(): void {
    this.hide();

    setTimeout(() => {
      if (this.element){
        this.element.classList.add('h-0');
        this.element.remove();
      }
    }, 500);
  }

  private hide(): void {
    if (this.element){
      this.element.classList.add(...['transition', 'opacity-0', 'duration-500']);
    }
  }
}
