import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["row"];

  connect() {
    console.log("Hello from training table controller");
  }

  filterTrainings(event) {
    const trainingTerm = event.target.value.toLowerCase();

    this.rowTargets.forEach((row) => {
      const name = row.getAttribute("data-training-table-target-name").toLowerCase();
      const type = row.getAttribute("data-training-table-target-type").toLowerCase();
      const coach = row.getAttribute("data-training-table-target-coach").toLowerCase();
      const day = row.getAttribute("data-training-table-target-day").toLowerCase();

      if (type.includes(trainingTerm) || name.includes(trainingTerm) || coach.includes(trainingTerm) || day.includes(trainingTerm)) {
        row.style.display = "";
      } else {
        row.style.display = "none";
      }
    });
  }
}
