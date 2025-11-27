import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["hideable", "show"]

  call(event) {
    event.preventDefault()
    console.log("toggle!", this.showTarget)
    console.log(this.hideableTarget && this.hideableTarget.classList.contains("d-none"))
    console.log(this.showTarget && this.showTarget.classList.contains("d-none"))
    if (this.hideableTarget.classList.contains("d-none")) {
      this.hideableTarget.classList.remove("d-none")
      this.showTarget.classList.add("d-none")
    } else {
      this.hideableTarget.classList.add("d-none")
      this.showTarget.classList.remove("d-none")
    }
  }
}
