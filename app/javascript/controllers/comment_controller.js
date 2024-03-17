import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"
export default class extends Controller {
  connect() {
    
  }

  greet() {
    this.element.querySelector("#addANote").value = ''
    const ele = document.querySelector(".chat-history");
    ele.scrollTo(100, ele.scrollHeight);
  }
}
