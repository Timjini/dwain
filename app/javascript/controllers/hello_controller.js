import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // console log the hello world message
  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

}