import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carts--modal"

export default class extends Controller {
  static targets = ["sidebar", "sidebarBg"]
  connect() {
    setTimeout(() =>{
      this.sidebarTarget.classList.remove('translate-x-full')
      this.sidebarTarget.classList.add('translate-x-0')}, 50)
  }
  close() {
    this.sidebarTarget.classList.remove('translate-x-0')
    this.sidebarTarget.classList.add('translate-x-full')
    this.sidebarBgTarget.remove()
  }

}
