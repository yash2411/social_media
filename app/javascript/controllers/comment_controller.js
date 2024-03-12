import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  connect() {
    
  }

  greet() {
    this.element.querySelector("#addANote").value = ''
  }
}
