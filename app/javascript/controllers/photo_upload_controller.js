import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["photoFields", "photoInput", "addPhotoBtn"];

  connect() {
    this.photoInputTemplate = this.photoInputTarget.cloneNode(true);
  }

  addPhotoField(event) {
    event.preventDefault();
    const newPhotoInput = this.photoInputTemplate.cloneNode(true);
    this.photoFieldsTarget.appendChild(newPhotoInput);
  }

  removePhotoField(event) {
    if (event.target.classList.contains('remove-photo')) {
      event.preventDefault();
      event.target.closest('.photo-input').remove();
    }
  }
}