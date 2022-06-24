import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]

  connect() {
    this.menuOpen = false
  }

  toggle() {
    if (this.menuOpen) {
      this.menuOpen = false;
      this.menuTarget.classList.replace("translate-x-0", "translate-x-full")
      document.body.style.overflow = 'auto'
    } else {
      this.menuOpen = true;
      this.menuTarget.classList.replace("translate-x-full", "translate-x-0")
      document.body.style.overflow = 'hidden'
    }
  }
}
