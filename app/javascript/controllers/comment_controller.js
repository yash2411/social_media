import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  connect() {
    
  }

  greet() {
    console.log("hello")
    this.element.querySelector("#addANote").value = ''
  }
}
