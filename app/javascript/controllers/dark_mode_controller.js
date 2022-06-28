import { Controller } from "@hotwired/stimulus"
import Cookies from "js-cookie"

export default class extends Controller {
  static targets = [ "html", "icon" ]

  connect() {
    this.darkMode = Cookies.get("dark_mode") === "true" || false;
    if (this.darkMode) {
      this.enableDarkMode();
    }
    if (Cookies.get("dark_mode") === undefined && (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      this.enableDarkMode();
      Cookies.set("dark_mode", true);
      this.darkMode = true;
    }
  }

  disableDarkMode() {
    this.htmlTarget.classList.remove("dark");
    this.htmlTarget.style.setProperty("color-scheme", "light");
    this.iconTarget.classList.replace("fa-sun-bright", "fa-moon");
    document.querySelector('meta[name="theme-color"]').setAttribute("content", "#fff");
  }

  enableDarkMode() {
    this.htmlTarget.classList.add("dark");
    this.htmlTarget.style.setProperty("color-scheme", "dark");
    this.iconTarget.classList.replace("fa-moon", "fa-sun-bright");
    document.querySelector('meta[name="theme-color"]').setAttribute("content", "#000");
  }

  toggle() {
    if (this.darkMode) {
      this.darkMode = false;
      this.disableDarkMode();
      Cookies.set("dark_mode", false);
    } else {
      this.darkMode = true;
      this.enableDarkMode();
      Cookies.set("dark_mode", true);
    }
  }
}
