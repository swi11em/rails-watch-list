import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["comment", "submitButton", "radio"]

  connect() {
    this.updateSubmitButtonState()

    const selectListModal = document.getElementById("selectListModal");

    if (selectListModal) {
      selectListModal.addEventListener("show.bs.modal", (event) => {
        const button = event.relatedTarget;
        const movieId = button.getAttribute("data-movie-id");
        const hiddenMovieIdField = document.getElementById("modal_movie_id");
        if (hiddenMovieIdField) {
          hiddenMovieIdField.value = movieId;
        }
      });
    }
  }
  updateSubmitButtonState() {
    const comment = this.commentTarget.value
    const isCommentValid = comment.length >= 6
    const isRadioSelected = Array.from(this.radioTargets).some(radio => radio.checked)
    this.submitButtonTarget.disabled = !(isCommentValid && isRadioSelected)
  }
}
