import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "html", "icon" ]

  connect() {
    this.darkMode = localStorage.getItem("darkMode") === "true" || false;
    if (this.darkMode) {
      this.enableDarkMode();
    }
    if (localStorage.getItem("darkMode") === null && (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      this.enableDarkMode();
      localStorage.setItem("darkMode", true);
      this.darkMode = true;
    }
  }

  disableDarkMode() {
    this.htmlTarget.classList.remove("dark");
    this.htmlTarget.style.setProperty("color-scheme", "light");
    this.iconTarget.classList.replace("fa-sun-bright", "fa-moon");
  }

  enableDarkMode() {
    this.htmlTarget.classList.add("dark");
    this.htmlTarget.style.setProperty("color-scheme", "dark");
    this.iconTarget.classList.replace("fa-moon", "fa-sun-bright");
  }

  toggle() {
    if (this.darkMode) {
      this.darkMode = false;
      this.disableDarkMode();
      localStorage.setItem("darkMode", false);
    } else {
      this.darkMode = true;
      this.enableDarkMode();
      localStorage.setItem("darkMode", true);
    }
  }
}
