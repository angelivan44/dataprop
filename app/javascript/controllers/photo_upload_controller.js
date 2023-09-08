import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["photoFields", "photoInput", "addPhotoBtn"];

  connect() {
    this.photoInputTemplate = this.photoInputTarget.cloneNode(true);
    // Configurar el índice inicial basado en el número actual de campos de fotos
    this.currentIndex = this.photoFieldsTarget.children.length - 1;
  }

  addPhotoField(event) {
    event.preventDefault();

    // Incrementar el índice actual
    this.currentIndex++;

    const newPhotoInput = this.photoInputTemplate.cloneNode(true);

    // Actualizar el atributo name del input clonado para usar el nuevo índice
    const fileInput = newPhotoInput.querySelector('input[type="file"]');
    const newName = fileInput.getAttribute('name').replace(/\[\d+\]/, '[' + this.currentIndex + ']');
    fileInput.setAttribute('name', newName);

    this.photoFieldsTarget.appendChild(newPhotoInput);
  }

  removePhotoField(event) {
    if (event.target.classList.contains('remove-photo')) {
      event.preventDefault();
      event.target.closest('.photo-input').remove();
      // Cuando se elimina un campo de foto, podría ser una buena idea reducir el índice,
      // pero esto puede complicar las cosas si se intenta mantener un orden secuencial.
      // Por lo tanto, el decremento es opcional.
      // this.currentIndex--;
    }
  }
}
